package vn.edu.hcmuaf.fit.service;

import org.bouncycastle.jce.provider.BouncyCastleProvider;
import vn.edu.hcmuaf.fit.db.DBConnect;
import vn.edu.hcmuaf.fit.model.Order;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.ObjectOutputStream;
import java.nio.charset.StandardCharsets;
import java.security.*;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.PKCS8EncodedKeySpec;
import java.security.spec.RSAPrivateKeySpec;
import java.security.spec.X509EncodedKeySpec;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.Base64;

public class DigitalSignattureManager {
    Connection conn;
    PreparedStatement statement;
    ResultSet resultSet;
    public boolean addSignature(int id_key, int id_order, String signature, String encrypt_order) throws SQLException {
        boolean result = false;
        conn = DBConnect.getInstance().getConnection();
        statement = conn.prepareStatement("insert into `sign_orders` (id_key, id_order, sign_order, encrypt_order) values(?,?,?,?)");
        statement.setInt(1, id_key);
        statement.setInt(2, id_order);
        statement.setString(3, signature);
        statement.setString(4, encrypt_order);

        result = statement.executeUpdate() != 0;
        conn.close();
        return result;
    }
    public String getPublicKey(int order_id){
        String query = "select `key`.key FROM `key` join `sign_orders` on key.id = sign_orders.id_key WHERE id_order = ?";
        try {
            conn = DBConnect.getInstance().getConnection();
            statement = conn.prepareStatement(query);
            statement.setInt(1, order_id);
            resultSet = statement.executeQuery();
            resultSet.next();
            return  resultSet.getString("key");
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public String getHashOrder(int order_id){
        String query = "select `encrypt_order` FROM `sign_orders`WHERE sign_order = ?";
        try {
            conn = DBConnect.getInstance().getConnection();
            statement = conn.prepareStatement(query);
            statement.setInt(1, order_id);
            resultSet = statement.executeQuery();
            resultSet.next();
            return  resultSet.getString("encrypt_order");
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public String getSign(int order_id){
        String query = "select `sign_order` FROM `sign_orders`WHERE sign_order = ?";
        try {
            conn = DBConnect.getInstance().getConnection();
            statement = conn.prepareStatement(query);
            statement.setInt(1, order_id);
            resultSet = statement.executeQuery();
            resultSet.next();
            return  resultSet.getString("sign_order");
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    private static RSAPrivateKeySpec getKeySpecFromPKCS8(byte[] keyBytes) throws IOException, NoSuchAlgorithmException, NoSuchProviderException, InvalidKeySpecException {
        PKCS8EncodedKeySpec keySpec = new PKCS8EncodedKeySpec(keyBytes);
        KeyFactory keyFactory = KeyFactory.getInstance("RSA", "BC");
        PrivateKey privateKey = keyFactory.generatePrivate(keySpec);

        KeyFactory rsaKeyFactory = KeyFactory.getInstance("RSA", "BC");
        RSAPrivateKeySpec rsaPrivateKeySpec = rsaKeyFactory.getKeySpec(privateKey, RSAPrivateKeySpec.class);
        return rsaPrivateKeySpec;
    }
    public String hashOrder(Order order) throws Exception{
        byte[] orderBytes = null;
        try (ByteArrayOutputStream bos = new ByteArrayOutputStream();
             ObjectOutputStream oos = new ObjectOutputStream(bos)) {
            oos.writeObject(order);
            oos.flush();
            orderBytes = bos.toByteArray();

        } catch (IOException e) {
            e.printStackTrace();
        }

        // Tạo đối tượng SHA-256 để tạo chữ ký
        MessageDigest digest = MessageDigest.getInstance("SHA-256");
        // Cập nhật dữ liệu đầu vào
        digest.update(orderBytes);
        // Lấy giá trị băm (hash)
        byte[] hashedBytes = digest.digest();
        // Chuyển đổi mảng byte sang chuỗi hex
        StringBuilder hexString = new StringBuilder();
        if (hashedBytes != null) {
            for (byte hashedByte : hashedBytes) {
                hexString.append(String.format("%02x", hashedByte));
            }
        }
        return hexString.toString();
    }

    // Tạo chữ ký từ dữ liệu và private key
    public String sign(String hashedOrder, String privateKeyPem) throws Exception {
        Security.addProvider(new BouncyCastleProvider());

        // Đọc Private Key từ định dạng PEM
        byte[] privateKeyBytes = org.bouncycastle.util.encoders.Base64.decode(privateKeyPem.replaceAll("\\n", "").replaceAll("-----BEGIN RSA PRIVATE KEY-----", "").replaceAll("-----END RSA PRIVATE KEY-----", ""));
        KeyFactory keyFactory = KeyFactory.getInstance("RSA", "BC");

        RSAPrivateKeySpec keySpec = getKeySpecFromPKCS8(privateKeyBytes);
        PrivateKey privateKey = keyFactory.generatePrivate(keySpec);

        // Tạo đối tượng ký
        Signature signature = Signature.getInstance("SHA256withRSA", "BC");
        signature.initSign(privateKey);
        signature.update(hashedOrder.getBytes(StandardCharsets.UTF_8));
        System.out.println(hashedOrder);

        // Tạo chữ ký bằng cách ký bản gốc của chuỗi
        byte[] signatureBytes = signature.sign();

        // Chuyển đổi chữ ký sang định dạng Base64
        return Base64.getEncoder().encodeToString(signatureBytes);
    }

//    // Xác minh chữ ký bằng public key
//public boolean verify(String hashedOrder, String signature, String publicKeyPem) throws Exception {
//    Security.addProvider(new BouncyCastleProvider());
//
//    // Đọc Public Key từ định dạng PEM
//    byte[] publicKeyBytes = org.bouncycastle.util.encoders.Base64.decode(publicKeyPem.replaceAll("\\n", "")
//            .replaceAll("-----BEGIN PUBLIC KEY-----", "")
//            .replaceAll("-----END PUBLIC KEY-----", "")
//            .replaceAll("\\s", "+"));
//
//    KeyFactory keyFactory = KeyFactory.getInstance("RSA", "BC");
//    X509EncodedKeySpec keySpec = new X509EncodedKeySpec(publicKeyBytes);
//    PublicKey publicKey = keyFactory.generatePublic(keySpec);
//
//    // Tạo đối tượng ký
//    Signature sig = Signature.getInstance("SHA256withRSA", "BC");
//    sig.initVerify(publicKey);
//    sig.update(hashedOrder.getBytes(StandardCharsets.UTF_8));
//    System.out.println(hashedOrder);
//
//    // Chuyển đổi chữ ký sang định dạng Base64
//    byte[] signatureBytes = Base64.getDecoder().decode(signature);
//
//    // Xác minh chữ ký
//    return sig.verify(signatureBytes);
//}
    public static void main(String[] args) throws Exception {
        DigitalSignattureManager d = new DigitalSignattureManager();
        String privateKey = "-----BEGIN RSA PRIVATE KEY-----MIIEpAIBAAKCAQEAjA5if8yzse5SZMURhGsCVYOs/hXY1MGWFlKxlQZq2iGHm4uLQucrfnI3Cqbs2p5WpDBu9hGYdaK28fXJKTJcJtfih3E4Amx1JBqvpDf4bcWR+Ubo+cehvdPf14Ql/Ro1fn8sTGim0go3P9p6sZ48lyyaZh6iUsmbXHewf8gX6mer00Lej4OFT36g9TvQjWAOCPfMpQKCM0jXMiUXOWhN/MIs+cveN6fQ7hWLExwQmfMlM7ELxqRmv7OFcgmu9dKC+tINRsG7YCvgt+UdzlJSNL7QaO7COxtzuHqunbHbSsBCfAZuqrFnnPIfKYdU1jVQei7yezZpD6QJf9nt97bH7wIDAQABAoIBAEYnMmlnZJ78jCLTn1mfrDSfVziSQuEW8pHN7AuEgmMupllgRWpGlr+ogC+Cu2MqKqXlaL8ywxYxYcfC4HcVNZlzS5GiQXbdUrO59j6glnyNmPeu8CWlPDv0c8vk8o5b4W2yT8MaLG1LFq+SRSDQ7PKgMdpy/8XOHFbt0OfAl1Iey/WJhTmL0WCDR1pDJQxgaM6+hCw22C6hK5TaKl65h5cMONVH3oB7VirypMs51X3erL6Bd1TgEEQbfz+hjR0inx2d7Ve0bXLGsolGupJ5iS75qUwXGMHmE0/s6nxMkucz4nrS9te9X0KMo78USN19Ji3gVmvL4EwSj3CUPqp4agECgYEAwOZ5OuHpa18FgrQPdTqqXCwvdpWfYHK4RrMATG97mxeA0MrLE+o0VTNBx3mcBfLAxYnwqRCyG9y3EVSKNNq8O9Cx9R9RHfLio+kSw99BuepOqd66EA4S6RqFAW9FbfOMFD+fRUkoPlSqjzQidvqrDu6QHxikdAq/oMAvvW7VwO8CgYEAud67KNQYRe+IPY2qGr1vlc9n2rLJx6Umfvct+B1AfaSlhEGG2PH/9a4MCC4mRJkUjC7emxtEzJLd24GVvlpBsKcGcA+oCZMHjHYosHDIliplOwdCRDm5BtiyJXyKTSp7OCBtK0dA2J2ebVPrPAiVdwrpHouobHnuvvWl8AExaQECgYEAiOoM2dJHDsKe8qpC3n4JNOrXtV91g8tpKCUc7SOjo+0GrSuDAFuXUXHUGnUiXMZ0NME3Y4hKIqSB+3b5sZIfUIVMCiN0O8GNQ7HGc+geiorX0pIXlhWnLnR4OxBzQxs+LZEKxu6p9bO6a3IhlDlO+IYzHR8seoC2iq5eNCJa7VkCgYEAmKaUj7OhO8691c/DJLLwMdllMfgkQBMiyqO23U8o6AeQ6E3oscQOs3d96jn8s9oFRhw4NqrulhUIoH6MvQjjanHCl8ZD+5kFWhaw1DfMhYfMG+6aPe4qR7UwmhjufPGmwTHgdurOFxlcQ+3oBCYImvwa+Ts5191MdwjIf5R7QAECgYBJ5Y0jY24jJNUPA1iwEfiibeK/SL3LBl2BEOwElZ2aOqy2jjbw85TZepfo0FQiN+LYMEMKCjh0O6Cg7LImM/q+1YIUYFa2A4x+Llc1m25GvdFXjQ9HecZRWlzR89AGqZnFHozShE9jFC3jie2pNbLfN6cbwKHrHZuVS65lu6/RvA==-----END RSA PRIVATE KEY-----\n";
        String publicKey = "-----BEGIN PUBLIC KEY-----MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAjA5if8yzse5SZMURhGsCVYOs/hXY1MGWFlKxlQZq2iGHm4uLQucrfnI3Cqbs2p5WpDBu9hGYdaK28fXJKTJcJtfih3E4Amx1JBqvpDf4bcWR Ubo cehvdPf14Ql/Ro1fn8sTGim0go3P9p6sZ48lyyaZh6iUsmbXHewf8gX6mer00Lej4OFT36g9TvQjWAOCPfMpQKCM0jXMiUXOWhN/MIs cveN6fQ7hWLExwQmfMlM7ELxqRmv7OFcgmu9dKC tINRsG7YCvgt UdzlJSNL7QaO7COxtzuHqunbHbSsBCfAZuqrFnnPIfKYdU1jVQei7yezZpD6QJf9nt97bH7wIDAQAB-----END PUBLIC KEY-----";
        Order order = new OrderService().getOrder("kimanh");
        String hashed = d.hashOrder(order);
        String sign = d.sign(hashed, privateKey);
//        System.out.println(d.verify(d.getHashOrder(order.getId()), d.getSign(order.getId()), d.getPublicKey(order.getId())));
    }
}
