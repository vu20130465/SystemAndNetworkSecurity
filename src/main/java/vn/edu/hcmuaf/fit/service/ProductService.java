package vn.edu.hcmuaf.fit.service;

import vn.edu.hcmuaf.fit.db.DBConnect;
import vn.edu.hcmuaf.fit.model.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

public class ProductService {
    Connection conn;
    PreparedStatement statement;
    ResultSet resultSet;

    public Product findProductById(int id) {
        String query = "SELECT product.id, product.name, price, category.`name` as category, description, status, discounted_price, quantity FROM product INNER JOIN category on product.category_id = category.id AND product.id = ?";
        try {
            conn = DBConnect.getInstance().getConnection();
            statement = conn.prepareStatement(query);
            statement.setInt(1, id);
            resultSet = statement.executeQuery();
            resultSet.next();
            Product result = new Product(id, resultSet.getString(2), resultSet.getInt(3), resultSet.getInt(7), resultSet.getString(4), resultSet.getString(5), null, resultSet.getString(6), resultSet.getInt(8));
            result.setImages(getListImage(id));
            return result;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public List<Product> findProductsByName(String namePattern) {
        String query = "SELECT product.id, product.name, price, category.`name` AS category, description, status, discounted_price, quantity " +
                "FROM product INNER JOIN category " +
                "ON product.category_id = category.id " +
                "WHERE product.name LIKE ?";
        List<Product> list = new ArrayList<>();
        try {
            Connection conn = DBConnect.getInstance().getConnection();
            PreparedStatement statement = conn.prepareStatement(query);
            statement.setString(1, "%" + namePattern + "%");
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                int price = resultSet.getInt("price");
                int discountedPrice = resultSet.getInt("discounted_price");
                String category = resultSet.getString("category");
                String description = resultSet.getString("description");
                ArrayList<String> images = getListImage(id);
                String status = resultSet.getString("status");
                int quantity = resultSet.getInt("quantity");

                Product pro = new Product(id, name, price, discountedPrice, category, description, images, status, quantity);
                list.add(pro);
            }
            conn.close();
            return list;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public ArrayList<Product> getAllProduct() {
        ArrayList<Product> list = new ArrayList<>();
        String query = "SELECT product.id, product.name, price, category.`name` as category, description, status, discounted_price, quantity FROM product INNER JOIN category on product.category_id = category.id ORDER BY price ASC";
        try {
            conn = DBConnect.getInstance().getConnection();
            statement = conn.prepareStatement(query);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                list.add(new Product(resultSet.getInt(1), resultSet.getString(2), resultSet.getInt(3), resultSet.getInt(7), resultSet.getString(4), resultSet.getString(5), null, resultSet.getString(6), resultSet.getInt(8)));
            }
            conn.close();
            for (Product product : list) {
                product.setImages(getListImage(product.getId()));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return list;
    }

    public ArrayList<String> getListImage(int idProduct) {
        ArrayList<String> list = new ArrayList<>();
        String query = "SELECT image.url FROM image WHERE product_id = ?";
        try {
            conn = DBConnect.getInstance().getConnection();
            statement = conn.prepareStatement(query);
            statement.setInt(1, idProduct);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                list.add(resultSet.getString(1));
            }
            conn.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return list;
    }

    public int getMaxQuantityOfProduct(int idP){
        String query = "SELECT quantity FROM product WHERE id = ?";
        try {
            conn = DBConnect.getInstance().getConnection();
            statement = conn.prepareStatement(query);
            statement.setInt(1, idP);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                return resultSet.getInt(1);
            }
            conn.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return 0;
    }
}
