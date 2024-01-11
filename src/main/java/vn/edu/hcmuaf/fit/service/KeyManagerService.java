package vn.edu.hcmuaf.fit.service;

import vn.edu.hcmuaf.fit.db.DBConnect;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.Date;

public class KeyManagerService {
    Connection conn;
    PreparedStatement statement;
    ResultSet rs;

    public boolean checkKeyExist(String key) throws SQLException {
        conn = DBConnect.getInstance().getConnection();
        statement = conn.prepareStatement("select * from `key` where `key` = ?");
        statement.setString(1, key);
        rs = statement.executeQuery();
        boolean result = rs.next();
        conn.close();
        return result;
    }

    public boolean addKey(String username, String key) throws SQLException {
        if (checkKeyExist(key))
            return false;
        boolean result = false;
        lockKey(username);
        conn = DBConnect.getInstance().getConnection();
        statement = conn.prepareStatement("insert into `key` (username,`key`) values(?,?)");
        statement.setString(1, username);
        statement.setString(2, key);
        result = statement.executeUpdate() != 0;
        conn.close();
        return result;
    }

    public boolean lockKey(String username) throws SQLException {
        boolean result = false;
        conn = DBConnect.getInstance().getConnection();
        Date now = new Date(System.currentTimeMillis());
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        statement = conn.prepareStatement("update `key` set expiryDate = ? where username = ? and expiryDate is null");
        statement.setString(1, sdf.format(now));
        statement.setString(2, username);
        statement.executeUpdate();
        conn.close();
        return result;
    }

    public String getPublicKeyFromUserName(String username) throws SQLException {
        try {
            conn = DBConnect.getInstance().getConnection();
            statement = conn.prepareStatement("SELECT `key` FROM `key` WHERE username = ? AND expiryDate IS NULL ORDER BY id DESC LIMIT 1");
            statement.setString(1, username);
            rs = statement.executeQuery();

            if (rs.next()) {
                return rs.getString("key");
            }

            return null; // Trả về null nếu không tìm thấy public key cho người dùng
        } finally {
            // Đảm bảo đóng tất cả các resource (ResultSet, PreparedStatement, Connection)
            if (rs != null) rs.close();
            if (statement != null) statement.close();
            if (conn != null) conn.close();
        }
    }

    public String getKeyByID(int keyID) throws SQLException {
        conn = null;
        statement = null;
        rs = null;

        try {
            conn = DBConnect.getInstance().getConnection();
            statement = conn.prepareStatement("SELECT key FROM `key` WHERE id = ?");
            statement.setInt(1, keyID);
            rs = statement.executeQuery();

            if (rs.next()) {
                return rs.getString("key");
            }

            return null; // Trả về null nếu không tìm thấy khóa với ID tương ứng
        } finally {
            // Đảm bảo đóng tất cả các resource (ResultSet, PreparedStatement, Connection)
            try {
                if (rs != null) rs.close();
                if (statement != null) statement.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace(); // Xử lý ngoại lệ khi đóng resource
            }
        }
    }
    public int getIdKey(int idOrder){
        String query = "SELECT id_key FROM sign_orders WHERE id_order = ?";
        try {
            Connection conn = DBConnect.getInstance().getConnection();
            PreparedStatement statement = conn.prepareStatement(query);
            statement.setInt(1, idOrder);
            ResultSet rs = statement.executeQuery();

            if (rs.next()) {
                int idKey = rs.getInt("id_key");
                conn.close();
                return idKey;
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return 0;
    }
    public static void main(String[] args) throws SQLException {
        System.out.println(new KeyManagerService().getPublicKeyFromUserName("vu"));
    }
}
