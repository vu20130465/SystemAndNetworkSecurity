<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="header.jsp"></jsp:include>
<head>
    <style>

        .tabs {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }
        .tab {
            margin: 0 10px;
            padding: 10px 20px;
            background-color: #333;
            color: white;
            cursor: pointer;
            border-radius: 4px;
        }
        .tab.active {
            background-color: #4caf50;
        }
        section {
            margin: 20px;
        }
        h2 {
            color: #333;
        }
        .account-details, .order-list, .success-orders, .key-management {
            width: 50%;
            margin: auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            display: none;
        }
        label {
            display: block;
            margin-bottom: 8px;
            color: #555;
        }
        input {
            width: 100%;
            padding: 8px;
            margin-bottom: 16px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
        button {
            background-color: #4caf50;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            margin-right: 10px;
        }
        .avatar-container {
            width: 100px;
            height: 100px;
            overflow: hidden;
            border-radius: 50%;
            margin-bottom: 16px;
        }
        .avatar {
            width: 100%;
            height: 100%;
            object-fit: cover;
            border-radius: 50%;
        }

    </style>
</head>

<div class="tabs">
    <div id="account-details-tab" class="tab active" onclick="showTab('account-details')">Thông tin tài khoản</div>
    <div id="order-list-tab" class="tab" onclick="showTab('order-list')">Danh sách đơn hàng</div>
    <div id="success-orders-tab" class="tab" onclick="showTab('success-orders')">Đơn hàng đã giao thành công</div>
    <div id="key-management-tab" class="tab" onclick="showTab('key-management')">Quản lý Key</div>
</div>

<section>
<%--    <c:set var="user" value="${sessionScope.user}"></c:set>--%>
    <div class="account-details" id="account-details" style="display: block;">
        <h2>Thông tin tài khoản</h2>
        <div class="avatar-container">
            <img src="avatar.jpg" alt="Avatar" class="avatar">
        </div>

        <form>
            <label for="firstname">Tên:</label>
            <input type="text" id="firstname" name="firstname" value="${user.getFirstname()}" readonly>

            <label for="lastname">Họ:</label>
            <input type="text" id="lastname" name="lastname" value="${user.getLastname()}" readonly>

            <label for="email">Email:</label>
            <input type="email" id="email" name="email" value="${user.getEmail()}" readonly>

            <label for="phone">Số điện thoại:</label>
            <input type="tel" id="phone" name="phone" value="${user.getPhone()}" readonly>

            <label for="address">Địa chỉ:</label>
            <input type="text" id="address" name="address" value="${user.getAddress()}" readonly>

            <button type="button" onclick="editAccount()">Sửa thông tin</button>
            <button type="button" onclick="changePassword()">Đổi mật khẩu</button>
        </form>
    </div>

    <div class="order-list" id="order-list">
        <h2>Danh sách đơn hàng</h2>
        <!-- Danh sách đơn hàng -->
    </div>

    <div class="success-orders" id="success-orders">
        <h2>Đơn hàng đã giao thành công</h2>
        <!-- Danh sách đơn hàng đã giao thành công -->
    </div>

    <div class="key-management" id="key-management">
        <h2>Quản lý Key</h2>
        <label for="private-key">Private Key:</label>
        <input type="text" id="private-key" name="private-key" placeholder="Private Key của khách hàng">
        <form>
            <label for="public-key">Public Key:</label>
            <input type="text" id="public-key" name="public-key" placeholder="Public Key của khách hàng" readonly>

            <button type="button" onclick="createKey()">Tạo key</button>
            <button type="button" onclick="reportLostKey()">Báo mất key</button>
            <button type="button" onclick="updateKey()">Cập nhật key mới</button>
        </form>
    </div>
</section>
<jsp:include page="footer.jsp"></jsp:include>
