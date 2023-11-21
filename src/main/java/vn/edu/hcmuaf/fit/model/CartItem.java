package vn.edu.hcmuaf.fit.model;

public class CartItem {
    Product Product;
    int quantity;

    public CartItem(Product Product, int quantity) {
        this.Product = Product;
        this.quantity = quantity;
    }

    public Product getProduct() {
        return Product;
    }

    public void setProduct(Product product) {
        this.Product = product;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
}
