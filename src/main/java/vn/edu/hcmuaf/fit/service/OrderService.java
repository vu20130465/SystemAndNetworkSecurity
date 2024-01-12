package vn.edu.hcmuaf.fit.service;

import vn.edu.hcmuaf.fit.db.DBConnect;
import vn.edu.hcmuaf.fit.model.CartItem;
import vn.edu.hcmuaf.fit.model.Order;
import vn.edu.hcmuaf.fit.model.Order_detail;
import vn.edu.hcmuaf.fit.model.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

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
    // Lấy danh sách đơn hàng của một người dùng
    public ArrayList<Order> getListOrder(String username) {
        ArrayList<Order> list = new ArrayList<>();
        String query = "SELECT * FROM `orders` WHERE username = ? ORDER BY id DESC";
        try {
            conn = DBConnect.getInstance().getConnection();
            statement = conn.prepareStatement(query);
            statement.setString(1, username);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                list.add(new Order(
                        resultSet.getInt("id"),
                        resultSet.getString("username"),
                        resultSet.getString("address"),
                        resultSet.getString("phone"),
                        resultSet.getString("email"),
                        resultSet.getDate("date_create"),
                        resultSet.getString("status"),
                        resultSet.getInt("total")));
            }
            conn.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return list;
    }

    public Order getOrder(String username) {
        String orderQuery = "SELECT * FROM orders WHERE username = ? ORDER BY id DESC LIMIT 1";
        String detailsQuery = "SELECT * FROM order_details WHERE order_id = ?";
        Order order = null; // Initialize order outside the try block
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try {
            conn = DBConnect.getInstance().getConnection();

            // Get Order
            statement = conn.prepareStatement(orderQuery);
            statement.setString(1, username);
            resultSet = statement.executeQuery();

            if (resultSet.next()) {
                int orderId = resultSet.getInt("id");
                String address = resultSet.getString("address");
                String phone = resultSet.getString("phone");
                String email = resultSet.getString("email");
                Date dateCreate = resultSet.getDate("date_create");
                String status = resultSet.getString("status");
                int total = resultSet.getInt("total");

                // Initialize detailsList before using it
                ArrayList<Order_detail> detailsList = new ArrayList<>();

                // Get Order Details
                statement = conn.prepareStatement(detailsQuery);
                statement.setInt(1, orderId);
                resultSet = statement.executeQuery();

                while (resultSet.next()) {
                    detailsList.add(new Order_detail(
                            resultSet.getInt(1),
                            resultSet.getInt(2),
                            resultSet.getInt(3),
                            resultSet.getInt(4),
                            resultSet.getInt(5)
                    ));
                }

                order = new Order(orderId, username, address, phone, email, (java.sql.Date) dateCreate, status, total, detailsList);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            try {
                if (resultSet != null) resultSet.close();
                if (statement != null) statement.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }

        return order;
    }

    public int getId(String username){
        String query = "SELECT id FROM orders WHERE username = ? ORDER BY id DESC LIMIT 1";
        try {
            conn = DBConnect.getInstance().getConnection();
            statement = conn.prepareStatement(query);
            statement.setString(1, username);
            resultSet = statement.executeQuery();
            resultSet.next();
            return  resultSet.getInt(1);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public static void main(String[] args) {
        OrderService o = new OrderService();
//        new OrderService().createOrder("anh", "a", "b", "c", "d", "e","Đang xử lý", 25000);
        System.out.println(o.getOrder("kimanh"));
    }
}
