<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@include file="header.jsp" %>
<section class="form-input py-5">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-5 col-md-5 col-12">
                <div class="h-100 d-flex align-items-center">
                    <form class="m-0 p-5 text-center" action="login" method="post">
                        <h1 class="mb-4">Đăng Nhập</h1>

                        <c:set var="username" value="${requestScope.username}"></c:set>
                        <div id="error" style="display: none; color: red">Đăng nhập không thành công. Bạn vui lòng thử lại.</div>
                        <c:set var="errorLogin" value="${requestScope.errorLogin}"></c:set>
                        <input class="w-100 mb-3" id="username" type="text" placeholder="Tên đăng nhập" name="username"
                               value="${username}">
                        <input class="w-100 mb-4" type="password" placeholder="Mật khẩu" name="password">
                        <c:if test="${errorLogin}">
                            <script>
                                document.getElementById("error").setAttribute("style", "display: block; color: red")
                            </script>
                        </c:if>

                        <button class="next w-100" type="submit">Đăng nhập</button>
                        <span class="or d-inline-block text-uppercase my-4 position-relative">Hoặc</span>
                        <a class="google d-flex justify-content-center w-100 mb-3"><img width="25px" class="mr-2"
                                                                                        src="images/google-logo.png"
                                                                                        alt="">Google</a>
                        <span class="shotcut">
                            <a class="mr-3" href="forgot-password">Quên mật khẩu?</a>
                            <a href="register">Đăng ký</a>
                        </span>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>

<%@include file="footer.jsp" %>