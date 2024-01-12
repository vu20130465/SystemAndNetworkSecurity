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

    public String getPublicKey(int id){
        String query = "select `key` FROM `key`WHERE id = ? ORDER BY createdDate desc limit 1";
        try {
            conn = DBConnect.getInstance().getConnection();
            statement = conn.prepareStatement(query);
            statement.setInt(1, id);
            rs = statement.executeQuery();
            rs.next();
            return  rs.getString(1);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public int getIdKey(String username){
        String query = "select `id` FROM `key`WHERE username = ? ORDER BY createdDate desc limit 1";
        try {
            conn = DBConnect.getInstance().getConnection();
            statement = conn.prepareStatement(query);
            statement.setString(1, username);
            rs = statement.executeQuery();
            rs.next();
            return  rs.getInt(1);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public static void main(String[] args) throws SQLException {
        KeyManagerService key = new KeyManagerService();
//        System.out.println(new KeyManagerService().addKey("vu", "12345679"));
        int id_key = key.getIdKey("kimanh");
        System.out.println(id_key);
        System.out.println(key.getPublicKey(id_key));
    }
}
