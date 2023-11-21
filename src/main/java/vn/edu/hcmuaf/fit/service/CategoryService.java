package vn.edu.hcmuaf.fit.service;

import vn.edu.hcmuaf.fit.db.DBConnect;
import vn.edu.hcmuaf.fit.model.Category;
import vn.edu.hcmuaf.fit.model.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CategoryService {

    public ArrayList<Category> getAllCategory() throws SQLException {
        ArrayList<Category> categories = new ArrayList<>();
        Connection conn = DBConnect.getInstance().getConnection();
        PreparedStatement statement = conn.prepareStatement("select * from category");
        ResultSet rs = statement.executeQuery();

        while (rs.next()) {
            int id = rs.getInt("id");
            String name = rs.getString("name");
            int amount = getAmountProductById(id);
            ArrayList<Product> products = getProductListById(id);
            categories.add(new Category(id, name, amount, products));
        }
        conn.close();
        return categories;
    }

    public ArrayList<Product> getProductListById(int category_id) throws SQLException {
        ArrayList<Product> products = new ArrayList<>();
        Connection conn = DBConnect.getInstance().getConnection();
        PreparedStatement statement = conn.prepareStatement("SELECT product.id, product.`name`, price, discounted_price, category.`name` AS 'category', description, `status`, quantity " +
                "FROM product INNER JOIN category " +
                "ON product.category_id = category.id " +
                "WHERE category.`id` = ? ORDER BY price ASC");
        statement.setInt(1, category_id);
        ResultSet rs = statement.executeQuery();

        while (rs.next()) {
            int id = rs.getInt("id");
            String name = rs.getString("name");
            int price = rs.getInt("price");
            int discountedPrice = rs.getInt("discounted_price");
            String category = rs.getString("category");
            String description = rs.getString("description");
            ArrayList<String> images = (ArrayList<String>) new ProductService().getListImage(id);
            String status = rs.getString("status");
            int quantity = rs.getInt("quantity");

            Product product = new Product(id, name, price, discountedPrice, category, description, images, status, quantity);
            products.add(product);
        }
        conn.close();
        return products;
    }

    public int getAmountProductById(int id) throws SQLException {
        Connection conn = DBConnect.getInstance().getConnection();
        PreparedStatement statement = conn.prepareStatement("SELECT COUNT(*) " +
                "FROM product INNER JOIN category " +
                "ON product.category_id = category.id " +
                "WHERE category.`id` = ?");
        statement.setInt(1, id);
        ResultSet rs = statement.executeQuery();
        int quantity = 0;
        while (rs.next())
            quantity += rs.getInt(1);
        conn.close();
        return quantity;
    }

//    public static void main(String[] args) throws SQLException {
//        for (Category c : new CategoryService().getAllCategory()) {
//            System.out.println(c.getQuantity());
//        }
//    }
}
