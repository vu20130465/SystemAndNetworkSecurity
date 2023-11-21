package vn.edu.hcmuaf.fit.db;

import java.sql.*;

public class DBConnect {
    String url = "jdbc:mysql://localhost:3306/web_ban_trai_cay";
    String user = "root";
    String pass = "";
    Connection connection;
    static DBConnect instance;

    public static DBConnect getInstance() {
        if (instance == null) instance = new DBConnect();
        return instance;
    }

    public Connection getConnection() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(url, user, pass);
            return connection;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
