package vn.edu.hcmuaf.fit.model;

import java.util.ArrayList;

public class Category {
    private int id;
    private String name;
    private int quantity;
    private ArrayList<Product> products;

    public Category() {
    }

    public Category(int id, String name, int quantity, ArrayList<Product> products) {
        this.id = id;
        this.name = name;
        this.quantity = quantity;
        this.products = products;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public ArrayList<Product> getProducts() {
        return products;
    }

    public void setProducts(ArrayList<Product> products) {
        this.products = products;
    }

    @Override
    public String toString() {
        return "id: " + id +
                ", name: " + name +
                ", quantity: " + quantity +
                ", products: " + products;
    }
}
