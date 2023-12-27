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

public class OrderService {
    Connection conn;
    PreparedStatement statement;
    ResultSet resultSet;

    public boolean createOrder(String username, String lName, String fName, String phone, String address, String email, String status, int shipCost) {
        String query1 = "INSERT INTO `orders` (username, lastname, firstname, phone, address, email, status) VALUES (?,?,?,?,?,?,?)";
        String query2 = "INSERT INTO `order_details` (order_id, product_id, quantity, price) VALUES ((SELECT id FROM `orders` WHERE username = ? ORDER BY id DESC LIMIT 1),?,?,?)";
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
            statement.setString(7, status);
            statement.executeUpdate();
            statement.close();

            ArrayList<CartItem> cart = (ArrayList<CartItem>) new CartService().getListCart(username);
            statement = conn.prepareStatement(query2);
            int total = 0;
            ProductService productService = new ProductService();
            for (CartItem item :
                    cart) {
                total += item.getProduct().getPrice() * item.getQuantity();
                statement.setString(1, username);
                statement.setInt(2, item.getProduct().getId());
                statement.setInt(3, item.getQuantity());
                statement.setInt(4, item.getProduct().getPrice());
                statement.executeUpdate();
                productService.updateQuantity(item.getProduct().getId(), item.getQuantity());
            }
            statement.close();
            total += shipCost;

            statement = conn.prepareStatement("UPDATE `orders` SET total = ? WHERE username = ? ORDER BY id DESC LIMIT 1");
            statement.setInt(1, total);
            statement.setString(2, username);
            statement.executeUpdate();
            statement.close();

            statement = conn.prepareStatement(queryDeleteCart);
            statement.setString(1, username);
            statement.executeUpdate();
            conn.close();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return true;
    }

    public static void main(String[] args) {
        new OrderService().createOrder("vu", "a", "b", "c", "d", "e","Đang xử lý", 25000);
    }
}
