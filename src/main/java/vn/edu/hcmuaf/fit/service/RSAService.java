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
        return new Order(id, username, address, phone, email, date, status, total);
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
    public static void main(String[] args) throws Exception {
        RSAService rsa = new RSAService();
        rsa.genKey(3072);
        System.out.println(rsa.exportPublicKey());
    }
}
