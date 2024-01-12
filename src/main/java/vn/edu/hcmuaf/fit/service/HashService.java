package vn.edu.hcmuaf.fit.service;

import vn.edu.hcmuaf.fit.model.Order;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.math.BigInteger;
import java.security.DigestInputStream;
import java.security.MessageDigest;
import java.util.ArrayList;

public class HashService {
    public static String hash(String data, String algorithm) throws Exception {
        MessageDigest md = MessageDigest.getInstance(algorithm);
        byte[] output = md.digest(data.getBytes());
        BigInteger num = new BigInteger(1, output);
        return num.toString(16);
    }
    //hash password bằng sha 256
    public static String hashPassword(String password) throws Exception {
        return hash(password, "SHA-256");
    }
    public static String hashOrderNewAdded(String username) throws Exception {
        OrderService orderService = new OrderService();
        Order order = orderService.getLastOrder(username);
        StringBuilder orderString = new StringBuilder(order.toString());
        ArrayList<Order> orders = orderService.getListOrder(username);
        for (Order o :
                orders) {
                orderString.append(";");
                orderString.append(o.toString());
        }
        return hash(orderString.toString(), "SHA-512");
    }
    //check password
    public static boolean checkPassword(String password, String hash) throws Exception {
        return hashPassword(password).equals(hash);
    }
    public static boolean checkHash(String data, String hash, String algorithm) throws Exception {
        return hash(data, algorithm).equals(hash);
    }
    public static String hashFile(String path, String algorithm) throws Exception {
        MessageDigest md = MessageDigest.getInstance(algorithm);
        DigestInputStream dis = new DigestInputStream(new BufferedInputStream(new FileInputStream(new File(path))), md);
        byte[] read = new byte[1024];
        int i;
        do {
            i = dis.read(read);
        } while (i != -1);
        BigInteger num = new BigInteger(1,dis.getMessageDigest().digest());
        return num.toString(16);
    }

    public static void main(String[] args) throws Exception {
        System.out.println(hash("abc","SHA-256"));
        double start = System.currentTimeMillis();
        System.out.println(hashFile("D:\\Hoc\\AnToanVaBaoMatHTTT\\2. Tong quan ve ma hoa.pdf","SHA-512"));
        double end = System.currentTimeMillis();
        System.out.println(end - start);
    }
}
