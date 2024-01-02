package vn.edu.hcmuaf.fit.service;

import org.bouncycastle.jce.provider.BouncyCastleProvider;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.security.*;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.PKCS8EncodedKeySpec;
import java.security.spec.RSAPrivateKeySpec;
import java.util.Base64;

public class DigitalSignattureManager {
    private static RSAPrivateKeySpec getKeySpecFromPKCS8(byte[] keyBytes) throws IOException, NoSuchAlgorithmException, NoSuchProviderException, InvalidKeySpecException {
        PKCS8EncodedKeySpec keySpec = new PKCS8EncodedKeySpec(keyBytes);
        KeyFactory keyFactory = KeyFactory.getInstance("RSA", "BC");
        PrivateKey privateKey = keyFactory.generatePrivate(keySpec);

        KeyFactory rsaKeyFactory = KeyFactory.getInstance("RSA", "BC");
        RSAPrivateKeySpec rsaPrivateKeySpec = rsaKeyFactory.getKeySpec(privateKey, RSAPrivateKeySpec.class);
        return rsaPrivateKeySpec;
    }
    // Tạo chữ ký từ dữ liệu và private key
    public String sign(String inputString, String privateKeyPem) throws Exception {
        Security.addProvider(new BouncyCastleProvider());

        // Đọc Private Key từ định dạng PEM
        byte[] privateKeyBytes = org.bouncycastle.util.encoders.Base64.decode(privateKeyPem.replaceAll("\\n", "").replaceAll("-----BEGIN RSA PRIVATE KEY-----", "").replaceAll("-----END RSA PRIVATE KEY-----", ""));
        KeyFactory keyFactory = KeyFactory.getInstance("RSA", "BC");

        RSAPrivateKeySpec keySpec = getKeySpecFromPKCS8(privateKeyBytes);
        PrivateKey privateKey = keyFactory.generatePrivate(keySpec);

        // Tạo đối tượng SHA-256 để tạo chữ ký
        MessageDigest digest = MessageDigest.getInstance("SHA-256");
        byte[] inputBytes = inputString.getBytes(StandardCharsets.UTF_8);
        byte[] hashBytes = digest.digest(inputBytes);

        // Tạo đối tượng ký
        Signature signature = Signature.getInstance("SHA256withRSA", "BC");
        signature.initSign(privateKey);
        signature.update(hashBytes);

        // Tạo chữ ký bằng cách ký bản gốc của chuỗi
        byte[] signatureBytes = signature.sign();

        // Chuyển đổi chữ ký sang định dạng Base64
        return Base64.getEncoder().encodeToString(signatureBytes);
    }

//    // Xác minh chữ ký bằng public key
//    public static boolean verify(String data, String signature, PublicKey publicKey) throws Exception {
//        Signature sig = Signature.getInstance("SHA256withRSA");
//        sig.initVerify(publicKey);
//        sig.update(data.getBytes());
//        byte[] signatureBytes = Base64.getDecoder().decode(signature);
//        return sig.verify(signatureBytes);
//    }
    public static void main(String[] args) throws Exception {
        DigitalSignattureManager d = new DigitalSignattureManager();
//        Order order = new Order();
        String bill = "14e9db9ec4c0720eafa6f1ef716f0d4ec60b5043d406c9a6bc1824095bdb2f8e";
        String privateKeyPem = "-----BEGIN RSA PRIVATE KEY-----\n" +
                "MIIEpAIBAAKCAQEAmQB3SePao8bLr1DLUIYQBPOX2nK2rz9frLyopUgS1kgs74nj\n" +
                "tgoidBXdT1yL/tnZD4TAcmIy7y9zvuPWaFihJooIN3NVBy/Owhbi17Hw9va3Ky/\n" +
                "ZcX/WxVevs0BFooObpWYwJK4RT5acX68Kjoop75kNr5AUWnbeGKZqRvXgPOKxyGO\n" +
                "k+1al5clp5CObJHyqso1QnajLHDHJljRZsfGxEEZd+nPVgXbRxx1CUnRXK803M/\n" +
                "jXcgsV3zyJMDlS2ukrlHTI8w+nQ1HQnX2RwJ5VMDSsW07Q6HVl1bUi9cWF9B86M\n" +
                "WRdRDWD1Mwzb+phOZ68mgJOf/RS4I7/+sBI5rAtIQIDAQABAoIBAA0EhSG8STX2\n" +
                "DA52iVXokiRZtWnYqMJwWeuQgajOYQvqSCh5Su6KHjRSR+ograiZUGaJnPYedMb0\n" +
                "+pwbNnraT5u/0sMlBO7/mk/ZMqO3eBELHLqH77BAeD2CIGjX5xTUrcF82EvGo6Jp\n" +
                "5hQeCH/oMXk5RHjTgWfRBUSDpDc1ZEbJwTNg09WYLrQ2NhDbtrVTVVb/GvCq7NH\n" +
                "PPMuntYXg869kJhw9yfwzIEuNbqjLGPkxwjY+zjl13cjqvrc0r+FVC0KhIcus/9g\n" +
                "XOmLB34aWnybdguHbUOa3gZx0MEyJy/JBEdBF2ox70AbopzinNs8JkRFLEdIp7fB\n" +
                "tWez9c/0YFgECgYEAzUKr1zjMhY+3c6Vwzt2voRHcV8W4rCJWEeKHYj7WnN3X2NC\n" +
                "yJjaHsJpgjcsBUBPxApcG0kzJQbEJhERu09NLgZKTE0clvDaL0Ows92VB5nDlRXo\n" +
                "DU+jxf0Vbyc6dyHHzA3+Rt8z2u+jqFYzajU1pSXmhZ3CFSntuSlmcme/92ykCgY\n" +
                "EAvtLBY6+fmVbyRUEwEC1dQnNPjT0KUFeypTRjFmmgVTD4XjZuwkznNc22uh6xBL\n" +
                "FC4883mYSQdpPp8hmLu1shrVPz3vRTKxd3pxXBn3pMYCvQPWfOHcbvIkADjUZHTg\n" +
                "i8vQ9/JHC1k0Y0eaYp7hSX4NB8rGvRdhsm2GoTHEx0eTkCgYAhLVKbQgoE2Jr9b\n" +
                "VNTjI+TyFBGO6ZC5HXnBCd/4MpNpqn52JnDBXNfP0S2Bocay25cTc8DdPfez1/La\n" +
                "khDotaEhg2RwyE9T8+/oD0Qa+R/++WDGlqpWHCYcryIXQYx3QE7ooYKIG4NJ3OWs\n" +
                "iKtTkLjZm6JSq2wwUytZdijJSByKQKBgQC8dj4VjCBeO2bvSyCC+aq/tE7/OSf0j\n" +
                "YicbQ7n1c5KFSFXOv9M2tMHanJrg2BlOATOJZvN/QUId7F4MA63LZwnKWET884oI\n" +
                "vdDh9NBBHJmER+LZfhFpHINK5fWcXB++1Yciy+Q99f86jttYdTLlH8jxAU97QZkV\n" +
                "RCacLkLG9900QKBgQC2C/up/8uIQdXfpAH9jo1Ngsd/m9oriUSvK3//t2dem3nd4\n" +
                "DM2ZLxbWSR/2xFd6aP1JzOR8RDei5aU2szitwdr3NfCLhpz2s7eXoAG85WjOFwBJ\n" +
                "Xotbzp1W69rp7t8GJ12Hy7DpYK862aFncPOIaoUWGoXmCh0p0T/uA6dgo4+oQ==\n" +
                "-----END RSA PRIVATE KEY-----";
        System.out.println(d.sign(bill, privateKeyPem));
    }
}
