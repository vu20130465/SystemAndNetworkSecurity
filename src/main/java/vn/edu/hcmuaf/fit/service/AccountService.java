package vn.edu.hcmuaf.fit.service;

import vn.edu.hcmuaf.fit.db.DBConnect;
import vn.edu.hcmuaf.fit.model.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AccountService {
    Connection conn;
    PreparedStatement statement;
    ResultSet rs;

    public boolean login(String username, String password) throws SQLException {
        conn = DBConnect.getInstance().getConnection();
        statement = conn.prepareStatement("select * from user where user.username = ? and password = ?");
        statement.setString(1, username);
        statement.setString(2, password);
        rs = statement.executeQuery();
        boolean result = rs.next();
        conn.close();
        return result;
    }

    public boolean checkAccountExist(String username) throws SQLException {
        boolean result = false;
        conn = DBConnect.getInstance().getConnection();
        statement = conn.prepareStatement("select * from user where user.username = ?");
        statement.setString(1, username);
        rs = statement.executeQuery();
        while (rs.next()) {
            result = true;
        }
        conn.close();
        return result;
    }

    public void register(String username, String password, String lastname, String firstname, String phone, String email, String address) throws SQLException {
        conn = DBConnect.getInstance().getConnection();
        statement = conn.prepareStatement("insert into user (username,password,firstname,lastname,phone,address,email,status_id) values(?,?,?,?,?,?,?,1)");
        statement.setString(1, username);
        statement.setString(2, password);
        statement.setString(3, firstname);
        statement.setString(4, lastname);
        statement.setString(5, phone);
        statement.setString(6, address);
        statement.setString(7, email);
        statement.executeUpdate();
        conn.close();
    }

    public User getUserInfo(String username) throws SQLException {
        conn = DBConnect.getInstance().getConnection();
        statement = conn.prepareStatement("select username, password, firstname, lastname, phone, address, delivery_address, email, status_id from user where user.username = ?");
        statement.setString(1, username);
        rs = statement.executeQuery();
        User user = null;
        while (rs.next()) {
            user = new User(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getInt(9));
        }
        return user;
    }
}
