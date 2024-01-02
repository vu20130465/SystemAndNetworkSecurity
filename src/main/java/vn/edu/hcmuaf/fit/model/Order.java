package vn.edu.hcmuaf.fit.model;

import java.sql.Date;

public class Order {
    private int id;
    private String lname;
    private String fname;
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
    public Order(int id, String username, String address, String phone, String email, Date date, int total) {
        this.id = id;
        this.username = username;
        this.address = address;
        this.phone = phone;
        this.email = email;
        this.date = date;
        this.total = total;
    }
    public Order() {

    }

    @Override
    public String toString() {
        return "" + id + ';' + username + ';' + address + ';' + phone + ';' + email + ';' + date.toString() + ';' + status + ';' + total;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public String getLname() {
        return lname;
    }

    public void setLname(String lname) {
        this.lname = lname;
    }

    public String getFname() {
        return fname;
    }

    public void setFname(String fname) {
        this.fname = fname;
    }
}
