package vn.edu.hcmuaf.fit.service;

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

            // Lấy public key mới nhất từ người dùng
            KeyManagerService keyManagerService = new KeyManagerService();
            String publicKeyString = keyManagerService.getPublicKeyFromUserName(username);

            if (publicKeyString == null) {
                System.out.println("Không tìm thấy public key cho người dùng " + username);
                return false;
            }

            // Giải mã đoạn hash bằng public key
            RSAService rsaService = new RSAService();
            rsaService.importKeyByPem(new KeyManagerService().getPublicKeyFromUserName(username),false);
            String decryptedHash = rsaService.decrypt(encryptedOrder, false);

            // Lấy thông tin đơn hàng
            String orderInfo = new OrderService().getLastOrder(username).toString();

            // Tính toán đoạn hash của thông tin đơn hàng
            String orderHash = HashService.hash(orderInfo, "SHA-2048");

            // So sánh đoạn hash giải mã và đoạn hash tính toán
            return decryptedHash.equals(orderHash);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

}
