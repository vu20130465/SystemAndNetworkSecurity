package vn.edu.hcmuaf.fit.service;

import vn.edu.hcmuaf.fit.db.DBConnect;
import vn.edu.hcmuaf.fit.model.CartItem;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CartService {
    Connection conn;
    PreparedStatement statement;
    ResultSet resultSet;

    public List<CartItem> getListCart(String username) {
        List<CartItem> list = new ArrayList<>();
        String query = "SELECT product_id, quantity FROM cart INNER JOIN `user` ON `user`.id = cart.user_id AND `user`.username = ?";
        try {
            conn = DBConnect.getInstance().getConnection();
            statement = conn.prepareStatement(query);
            statement.setString(1, username);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                list.add(new CartItem(new ProductService().findProductById(resultSet.getInt(1)), resultSet.getInt(2)));
            }
            conn.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return list;
    }

    public boolean addItem(String username, int idProduct, int quantity) {
        String query = "UPDATE cart SET quantity = ? WHERE user_id = (SELECT id FROM `user` WHERE username = ?) AND product_id = ?";
        try {
            conn = DBConnect.getInstance().getConnection();
            statement = conn.prepareStatement(query);
            statement.setInt(1, quantity);
            statement.setString(2, username);
            statement.setInt(3, idProduct);
            if (statement.executeUpdate()==0){
                query = "INSERT INTO cart VALUES(?,(SELECT id FROM `user` WHERE username = ?),?)";
                statement = conn.prepareStatement(query);
                statement.setInt(1,idProduct);
                statement.setString(2,username);
                statement.setInt(3,quantity);
                statement.executeUpdate();
            }
            conn.close();
        } catch (SQLException e) {
            return false;
        }
        return true;
    }

    public boolean removeItem(String username, int idProduct) {
        String query = "DELETE FROM cart WHERE user_id = (SELECT id FROM `user` WHERE username = ?) and product_id = ?";
        try {
            conn = DBConnect.getInstance().getConnection();
            statement = conn.prepareStatement(query);
            statement.setString(1, username);
            statement.setInt(2, idProduct);
            statement.executeUpdate();
            conn.close();
        } catch (SQLException e) {
            return false;
        }
        return true;
    }

    public int getQuantityItem(int idProduct, List<CartItem> cart) {
        for (CartItem item :
                cart) {
            if (item.getProduct().getId() == idProduct)
                return item.getQuantity();
        }
        return 0;
    }
}
