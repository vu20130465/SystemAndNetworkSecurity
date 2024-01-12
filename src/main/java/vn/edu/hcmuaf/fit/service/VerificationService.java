package vn.edu.hcmuaf.fit.service;

import vn.edu.hcmuaf.fit.model.Order;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.ObjectOutputStream;
import java.sql.SQLException;

public class VerificationService {
    public boolean verifyOrder(int idOrder, String username) {
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
            Order orderInfo = new OrderService().getLastOrder(username);
            byte[] orderBytes = null;
            try (ByteArrayOutputStream bos = new ByteArrayOutputStream();
                 ObjectOutputStream oos = new ObjectOutputStream(bos)) {
                oos.writeObject(orderInfo);
                oos.flush();
                orderBytes = bos.toByteArray();
            } catch (IOException e) {
                e.printStackTrace();
            }

            // Tính toán đoạn hash của thông tin đơn hàng
            String orderHash = HashService.hashSHA256(orderBytes);

            // So sánh đoạn hash giải mã và đoạn hash tính toán
            return decryptedHash.equals(orderHash);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public boolean verifyUser(int idOrder, String username) {
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
        try {
            rsaService.importKeyFromPem(publicKeyString,false);
            String decryptedHash = rsaService.decrypt(encryptedOrder, false);
        } catch (Exception e) {
            return false;
        }
        return true;
    }


}
