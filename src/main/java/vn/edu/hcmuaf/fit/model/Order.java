package vn.edu.hcmuaf.fit.model;

import java.sql.Date;

public class Order {
    private int id;
    private String username;
    private String address;
    private String phone;
    private String email;
    private Date date;
    private String status;
    private int total;

    public Order(int id, String username, String address, String phone, String email, Date date, String status, int total) {
        this.id = id;
        this.username = username;
        this.address = address;
        this.phone = phone;
        this.email = email;
        this.date = date;
        this.status = status;
        this.total = total;
    }

    @Override
    public String toString() {
        return "" + id + ';' + username + ';' + address + ';' + phone + ';' + email + ';' + date.getTime() + ';' + status + ';' + total;
    }
}
