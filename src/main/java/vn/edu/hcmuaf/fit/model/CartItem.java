package vn.edu.hcmuaf.fit.model;

public class CartItem {
    Product product;
    int quantity;

    public CartItem(Product Product, int quantity) {
        this.product = Product;
        this.quantity = quantity;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
}
