package vn.edu.hcmuaf.fit.service;

import vn.edu.hcmuaf.fit.db.DBConnect;
import vn.edu.hcmuaf.fit.model.CartItem;
import vn.edu.hcmuaf.fit.model.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BillService {
    Connection conn;
    PreparedStatement statement;
    ResultSet resultSet;

    public boolean createBill(String username, String lName, String fName, String phone, String address, String email, List<CartItem> cart) {
        String query1 = "INSERT INTO `bills` (user_id,lastname,firstname,phone,delivery_address,email,price) VALUES ((SELECT id FROM `user` WHERE username = ?),?,?,?,?,?,?)";
        String query2 = "INSERT INTO `bill` (bill_id, product_id,quantity) VALUES ((SELECT id FROM `bills` WHERE user_id = (SELECT id FROM `user` WHERE username = ?) ORDER BY id DESC LIMIT 1),?,?)";
        String queryDeleteCart = "DELETE FROM cart WHERE user_id = (SELECT id FROM `user` WHERE username = ?)";
        try {
            conn = DBConnect.getInstance().getConnection();
            statement = conn.prepareStatement(query1);
            statement.setString(1, username);
            statement.setString(2, lName);
            statement.setString(3, fName);
            statement.setString(4, phone);
            statement.setString(5, address);
            statement.setString(6, email);
            statement.executeUpdate();
            statement.close();

            PreparedStatement statement2 = conn.prepareStatement(query2);
            for (CartItem item :
                    cart) {
                statement2.setString(1, username);
                statement2.setInt(2, item.getProduct().getId());
                statement2.setInt(3, item.getQuantity());
                statement2.executeUpdate();
            }
            statement2.close();

            statement2 = conn.prepareStatement(queryDeleteCart);
            statement2.setString(1, username);
            statement2.executeUpdate();
            conn.close();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return true;
    }

    public static void main(String[] args) {
        new BillService().createBill("vu", "a", "b", "c", "d", "e", new CartService().getListCart("vu"));
    }
}
