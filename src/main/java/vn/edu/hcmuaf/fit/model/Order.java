package vn.edu.hcmuaf.fit.model;

import java.sql.Date;

public class Order {
    private int id;
    private String username;
    private String address;
    private String phone;
    private String email;
    private Date date;
    private int status_id;
    private int total;

    public Order(int id, String username, String address, String phone, String email, Date date, int status_id, int total) {
        this.id = id;
        this.username = username;
        this.address = address;
        this.phone = phone;
        this.email = email;
        this.date = date;
        this.status_id = status_id;
        this.total = total;
    }

    @Override
    public String toString() {
        return "" + id + ';' + username + ';' + address + ';' + phone + ';' + email + ';' + date.getTime() + ';' + status_id + ';' + total;
    }
}
