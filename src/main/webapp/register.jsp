<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@include file="header.jsp" %>

<section class="form-input py-5">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-5 col-md-5 col-12">

                    <form class="was-validated" action="register" method="post">
                        <h1 class="mb-4" style="text-align: center;">Đăng Ký</h1>
                        <input type="text" class="form-control is-invalid input-style" placeholder="Họ và tên đệm" required name="lastname">
                        <div class="invalid-feedback error">${errors.lastname}</div>
                        <input type="text" class="form-control is-invalid input-style" placeholder="Tên" required name="firstname">
                        <div class="invalid-feedback error">${errors.firstname}</div>
                        <input type="text" class="form-control is-invalid input-style" placeholder="Số điện thoại" required name="phone">
                        <div class="invalid-feedback error" maxlength="10">${errors.phone}</div>
                        <input type="text" class="form-control is-invalid input-style" placeholder="Địa chỉ" required name="address">
                        <div class="invalid-feedback error">${errors.address}</div>
                        <input type="text" class="form-control is-invalid input-style" placeholder="Tên Tài Khoản" required name="usernameIn">
                        <div class="invalid-feedback error">${errors.username}</div>
                        <input type="text" class="form-control is-invalid input-style" placeholder="Email" required name="email">
                        <div class="invalid-feedback error">${errors.email}</div>
                        <input type="password" class="form-control is-invalid input-style" placeholder="Mật khẩu" required name="password">
                        <div class="invalid-feedback error">${errors.password}</div>
                        <input type="password" class="form-control is-invalid input-style" placeholder="Nhập lại mật khẩu" required name="pwconfirm">
                        <div class="invalid-feedback error">${errors.pwconfirm}</div>

                        <button class="next w-100 mb-3 mt-3" type="submit">Đăng ký</button>
                        <span class="shortcut">Bạn đã có tài khoản? <a href="login">Đăng nhập</a></span>
                    </form>

            </div>
        </div>
    </div>
</section>
<%@include file="footer.jsp" %>
