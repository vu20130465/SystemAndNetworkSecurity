package vn.edu.hcmuaf.fit.model;

import java.text.NumberFormat;
import java.util.List;
import java.util.Locale;

public class Product {
    int id;
    String name;
    int price;
    int discountedPrice;
    String category;
    String description;
    List<String> images;
    String status;
    int quantity;

    public Product(int id, String name, int price, int discountedPrice, String category, String description, List<String> images, String status, int quantity) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.discountedPrice = discountedPrice;
        this.category = category;
        this.description = description;
        this.images = images;
        this.status = status;
        this.quantity = quantity;
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

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getDiscountedPrice() {
        return discountedPrice;
    }

    public void setDiscountedPrice(int discountedPrice) {
        this.discountedPrice = discountedPrice;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public List<String> getImages() {
        return images;
    }

    public void setImages(List<String> images) {
        this.images = images;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    @Override
    public String toString() {
        return "id: " + id +
                ", name: " + name +
                ", price: " + price +
                ", discounted price: " + discountedPrice +
                ", category: " + category +
                ", description: " + description +
                ", images: " + images +
                ", status: " + status +
                ", quantity: " + quantity;
    }
}
