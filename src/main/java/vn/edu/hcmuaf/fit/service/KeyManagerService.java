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

    public static void main(String[] args) throws SQLException {
        System.out.println(new KeyManagerService().addKey("vu", "12345679"));
    }
}
