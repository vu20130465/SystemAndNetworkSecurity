package vn.edu.hcmuaf.fit.service;

import vn.edu.hcmuaf.fit.model.Order;

import javax.crypto.*;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;
import java.io.*;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.security.*;
import java.security.spec.PKCS8EncodedKeySpec;
import java.security.spec.X509EncodedKeySpec;
import java.sql.Date;
import java.util.Base64;
import java.util.StringTokenizer;

public class RSAService {
    KeyPair keyPair;
    PublicKey publicKey;
    PrivateKey privateKey;

    public void genKey(int keySize) throws Exception {
        KeyPairGenerator keyGenerator = KeyPairGenerator.getInstance("RSA");
        keyGenerator.initialize(keySize);
        keyPair = keyGenerator.generateKeyPair();
        publicKey = keyPair.getPublic();
        privateKey = keyPair.getPrivate();
    }

    public String encrypt(String data, boolean isPublicKey) throws Exception {
        Cipher cipher = Cipher.getInstance("RSA/ECB/PKCS1Padding");
        cipher.init(Cipher.ENCRYPT_MODE, isPublicKey ? publicKey : privateKey);
        byte[] output = cipher.doFinal(data.getBytes(StandardCharsets.UTF_8));
        return Base64.getEncoder().encodeToString(output);
    }
    //encrypt object
    public String encryptObject(Order input, boolean isPublicKey) throws Exception {
        Cipher cipher = Cipher.getInstance("RSA/ECB/PKCS1Padding");
        cipher.init(Cipher.ENCRYPT_MODE, isPublicKey ? publicKey : privateKey);
        byte[] output = cipher.doFinal(input.toString().getBytes(StandardCharsets.UTF_8));
        return Base64.getEncoder().encodeToString(output);
    }
    public void fileEncrypt(String inputPath, boolean isPublicKey) throws Exception {
        KeyGenerator keyGen = KeyGenerator.getInstance("AES");
        keyGen.init(256);
        byte[] iv = new byte[16];
        IvParameterSpec spec = new IvParameterSpec(iv);
        SecretKey secretKey = keyGen.generateKey();
        Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
        cipher.init(Cipher.ENCRYPT_MODE, secretKey, spec);

        CipherInputStream is = new CipherInputStream(new BufferedInputStream(Files.newInputStream(Paths.get(inputPath))), cipher);
        DataOutputStream dos = new DataOutputStream(new BufferedOutputStream(Files.newOutputStream(Paths.get(createPathWithNameExtend(inputPath, "encrypt")))));

        String keyString = Base64.getEncoder().encodeToString(secretKey.getEncoded());
        dos.writeUTF(encrypt(keyString, isPublicKey));
        dos.writeLong(new File(inputPath).length());
        dos.writeUTF(Base64.getEncoder().encodeToString(iv));

        byte[] buff = new byte[1024];
        int i;
        while ((i = is.read(buff)) != -1) {
            dos.write(buff, 0, i);
        }
        dos.flush();
        dos.close();
        is.close();
    }


    public String decrypt(String data, boolean isPrivateKey) throws Exception {
        Cipher cipher = Cipher.getInstance("RSA/ECB/PKCS1Padding");
        cipher.init(Cipher.DECRYPT_MODE, isPrivateKey ? privateKey : publicKey);
        byte[] output = cipher.doFinal(Base64.getDecoder().decode(data));
        return new String(output, StandardCharsets.UTF_8);
    }
    //decrypt object
    public Order decryptObject(String data, boolean isPrivateKey) throws Exception {
        Cipher cipher = Cipher.getInstance("RSA/ECB/PKCS1Padding");
        cipher.init(Cipher.DECRYPT_MODE, isPrivateKey ? privateKey : publicKey);
        byte[] output = cipher.doFinal(Base64.getDecoder().decode(data));
        String result = new String(output, StandardCharsets.UTF_8);
        StringTokenizer st = new StringTokenizer(result, ";");
        int id = Integer.parseInt(st.nextToken());
        String username = st.nextToken();
        String address = st.nextToken();
        String phone = st.nextToken();
        String email = st.nextToken();
        Date date = new Date(Long.parseLong(st.nextToken()));
        String status = st.nextToken();
        int total = Integer.parseInt(st.nextToken());
        return new Order(id, username, address, phone, email, date, total);
    }
    public void fileDecrypt(String inputPath, boolean isPrivateKey) throws Exception {
        DataInputStream dis = new DataInputStream(new BufferedInputStream(Files.newInputStream(Paths.get(inputPath))));
        String keyString = dis.readUTF();
        long size = dis.readLong();
        String ivString = dis.readUTF();

        Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
        cipher.init(Cipher.DECRYPT_MODE, new SecretKeySpec(Base64.getDecoder().decode(decrypt(keyString, isPrivateKey)), "AES"), new IvParameterSpec(Base64.getDecoder().decode(ivString)));

        CipherOutputStream cos = new CipherOutputStream(new BufferedOutputStream(Files.newOutputStream(Paths.get(createPathWithNameExtend(inputPath, "decrypt")))), cipher);

        byte[] buff = new byte[1024];
        int i;
        while ((i = dis.read(buff)) != -1) {
            cos.write(buff, 0, i);
        }
        cos.flush();
        cos.close();
        dis.close();
    }

    public String exportPublicKey() throws Exception {
        return Base64.getEncoder().encodeToString(publicKey.getEncoded());
    }

    public String exportPrivateKey() throws Exception {
        return Base64.getEncoder().encodeToString(privateKey.getEncoded());
    }

    public void importPublicKey(String key) throws Exception {
        byte[] byteKey = Base64.getDecoder().decode(key);
        X509EncodedKeySpec X509publicKey = new X509EncodedKeySpec(byteKey);
        KeyFactory kf = KeyFactory.getInstance("RSA");
        publicKey = kf.generatePublic(X509publicKey);
    }

    public void importPrivateKey(String key) throws Exception {
        byte[] byteKey = Base64.getDecoder().decode(key);
        PKCS8EncodedKeySpec keySpec = new PKCS8EncodedKeySpec(byteKey);
        KeyFactory kf = KeyFactory.getInstance("RSA");
        privateKey = kf.generatePrivate(keySpec);
    }

    public void importKeyFromPem(String pemKey, boolean isPrivateKey) throws Exception {
        // Remove PEM header and footer, if present
        pemKey = pemKey.replace("-----BEGIN PUBLIC KEY-----", "")
                .replace("-----END PUBLIC KEY-----", "")
                .replace("-----BEGIN PRIVATE KEY-----", "")
                .replace("-----END PRIVATE KEY-----", "")
                .replaceAll("\\s", "+"); // Remove any whitespaces

        byte[] byteKey = Base64.getDecoder().decode(pemKey);

        if (isPrivateKey) {
            PKCS8EncodedKeySpec keySpec = new PKCS8EncodedKeySpec(byteKey);
            KeyFactory kf = KeyFactory.getInstance("RSA");
            privateKey = kf.generatePrivate(keySpec);
        } else {
            X509EncodedKeySpec X509publicKey = new X509EncodedKeySpec(byteKey);
            KeyFactory kf = KeyFactory.getInstance("RSA");
            publicKey = kf.generatePublic(X509publicKey);
        }
    }

    public String createPathWithNameExtend(String path, String extend) {
        // Lấy đường dẫn và tên tệp tin từ đường dẫn đầy đủ
        File file = new File(path);
        String parentPath = file.getParent();
        String fileName = file.getName();
        // Tách tên tệp tin và đuôi mở rộng
        int dotIndex = fileName.lastIndexOf('.');
        String baseName = fileName.substring(0, dotIndex);
        String extension = fileName.substring(dotIndex + 1);
        // Tạo tên mới
        String newName = baseName + "-" + extend + "." + extension;
        return parentPath != null ? parentPath + File.separator + newName : newName;
    }

    public static void main(String[] args) throws Exception {
        RSAService rsa = new RSAService();
        rsa.importKeyFromPem("-----BEGIN PUBLIC KEY-----MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAqUYhOZoO55HS0M63i4WCQ/6eIvrqkWPi/qxSpS7u4AvJeb53B3b92hhRT3Rk4T3/rjuV/C i9XO386zhevXi3Z ykUPfVSsWa5J94jSLT5Uul1v44tP3EkHX0NEZ9U39ecrsXFjFbVVdzM5wHG3fb4gOqX1mTQuo7hE5mY5VSH4hrDZQa85SfSBsabGAI KQUVrYECxwSbsMiBbjaiAHFOBfEahzc3dMZkpe/CD2whBWI/lMoaXZU7FahukClw1XpLIO5uq3PDbWW6OL9pmJshDpKD5JCBrcCpqlVVKa276 0dnzfcMbTe2 nLLGED4Ks3ipsYrKJCq1bNMdwYRx9wIDAQAB-----END PUBLIC KEY-----", false);
        System.out.println(rsa.exportPublicKey());
//        rsa.genKey(3072);
//        System.out.println(rsa.exportPublicKey());
//        System.out.println(rsa.exportPrivateKey());
//        Order o = new Order(1, "test", "test", "test", "test", new Date(System.currentTimeMillis()), "Đang xử lý", 1);
//        String s = rsa.encryptObject(o, true);
//        System.out.println(s);
//        Order f1 = rsa.decryptObject(s, true);
//        System.out.println(f1);
////        System.out.println(rsa.encrypt("test", false));
////        System.out.println(rsa.decrypt(rsa.encrypt("test", false), false));
//
////        rsa.fileEncrypt("web_ban_trai_cay.sql", false);
////        rsa.fileDecrypt("web_ban_trai_cay-encrypt.sql", false);
    }
}
