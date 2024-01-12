package vn.edu.hcmuaf.fit.service;

import vn.edu.hcmuaf.fit.model.Order;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.ObjectOutputStream;
import java.sql.SQLException;
import java.util.Base64;

public class VerificationService {
    public boolean verifyUser(int idOrder, String username) {
        try {
            // Lấy dữ liệu đã mã hóa từ bảng sign_orders
            OrderService orderService = new OrderService();
            String encryptedOrder = orderService.getSignatureOrder(idOrder);

            if (encryptedOrder == null) {
                System.out.println("Không tìm thấy dữ liệu đã mã hóa cho đơn hàng có ID " + idOrder);
                return false;
            }

            // Lấy public key
            String publicKeyString = new OrderService().getKeyByIDOrder(idOrder, username);

            if (publicKeyString == null) {
                System.out.println("Không tìm thấy public key cho người dùng " + username);
                return false;
            }

            // Giải mã đoạn hash bằng public key
            RSAService rsaService = new RSAService();
            rsaService.importKeyFromPem(publicKeyString,false);
            String decryptedHash = rsaService.decrypt(encryptedOrder, false);

            // Lấy thông tin đơn hàng
            Order orderInfo = new OrderService().getOrder(new OrderService().getLastOrderId(username), username);

            // Tính toán đoạn hash của thông tin đơn hàng
            String orderHash = new DigitalSignattureManager().hashOrder(orderInfo);

            // So sánh đoạn hash giải mã và đoạn hash tính toán
            return decryptedHash.equals(orderHash);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
    private static String bytesToHex(byte[] bytes) {
        StringBuilder hexString = new StringBuilder();
        for (byte b : bytes) {
            String hex = Integer.toHexString(0xff & b);
            if (hex.length() == 1) hexString.append('0');
            hexString.append(hex);
        }
        return hexString.toString();
    }

    public boolean verifyOrder(int idOrder, String username) throws Exception {
        // Lấy dữ liệu đã mã hóa từ bảng sign_orders
        OrderService orderService = new OrderService();
        String encryptedOrder = orderService.getSignatureOrder(idOrder);

        if (encryptedOrder == null) {
            System.out.println("Không tìm thấy dữ liệu đã mã hóa cho đơn hàng có ID " + idOrder);
            return false;
        }

        // Lấy public key
        String publicKeyString = new OrderService().getKeyByIDOrder(idOrder, username);

        if (publicKeyString == null) {
            System.out.println("Không tìm thấy public key cho người dùng " + username);
            return false;
        }
        Order orderInfo = new OrderService().getOrder(idOrder, username);

        DigitalSignattureManager digit = new DigitalSignattureManager();
        String orderHash = new DigitalSignattureManager().hashOrder(orderInfo);

        return digit.verify(orderHash, encryptedOrder, publicKeyString);
    }

    public static void main(String[] args) throws Exception {
        VerificationService verificationService = new VerificationService();
        System.out.println(verificationService.verifyOrder(37, "vu"));
    }
}
