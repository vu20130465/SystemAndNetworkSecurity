<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="vi">
<head>
    <meta http-equiv="content-type" content="text/html" charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <title>Fresh Shop</title>

    <!-- Site Icons -->
    <link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">
    <link rel="apple-touch-icon" href="images/apple-touch-icon.png">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!-- Site CSS -->
    <link rel="stylesheet" href="css/style.css">
    <!-- Responsive CSS -->
    <link rel="stylesheet" href="css/responsive.css">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="css/custom.css">


</head>
<body style="margin: 0">

<!-- Start Main Header -->
<header class="main-header">
    <!-- Start Navigation -->
    <nav class="navbar navbar-expand-lg navbar-light bg-light navbar-default bootsnav">
        <div class="container">
            <!-- Start Header Navigation -->
            <div class="navbar-header">
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar-menu"
                        aria-controls="navbars-rs-food" aria-expanded="false" aria-label="Toggle navigation">
                    <i class="fa fa-bars"></i>
                </button>
                <a class="navbar-brand" href="home"><img src="images/logo.png" class="logo" alt=""></a>
            </div>
            <!-- End Header Navigation -->

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="navbar-menu">
                <ul class="nav navbar-nav ml-auto" data-in="fadeInDown" data-out="fadeOutUp">
                    <c:set var="currentPage" value="${applicationScope.currentPage}"></c:set>
                    <%--Trang chủ--%>
                    <c:choose>
                        <c:when test="${currentPage.equalsIgnoreCase('home')}">
                            <li class="nav-item active"><a class="nav-link" href="home">Trang chủ</a></li>
                        </c:when>
                        <c:otherwise>
                            <li class="nav-item"><a class="nav-link" href="home">Trang chủ</a></li>
                        </c:otherwise>
                    </c:choose>

                    <%--Shop--%>
                    <c:choose>
                        <c:when test="${currentPage.equalsIgnoreCase('shop')}">
                            <li class="nav-item active"><a class="nav-link" href="shop">Cửa hàng</a></li>
                        </c:when>
                        <c:otherwise>
                            <li class="nav-item"><a class="nav-link" href="shop">Cửa hàng</a></li>
                        </c:otherwise>
                    </c:choose>

                    <%--Về chúng tôi--%>
                    <c:choose>
                        <c:when test="${currentPage.equalsIgnoreCase('about')}">
                            <li class="nav-item active"><a class="nav-link" href="about">Về chúng tôi</a></li>
                        </c:when>
                        <c:otherwise>
                            <li class="nav-item"><a class="nav-link" href="about">Về chúng tôi</a></li>
                        </c:otherwise>
                    </c:choose>

                    <%--Liên hệ--%>
                    <c:choose>
                        <c:when test="${currentPage.equalsIgnoreCase('contact')}">
                            <li class="nav-item active"><a class="nav-link" href="contact">Liên hệ</a></li>
                        </c:when>
                        <c:otherwise>
                            <li class="nav-item"><a class="nav-link" href="contact">Liên hệ</a></li>
                        </c:otherwise>
                    </c:choose>
                </ul>
            </div>
            <!-- /.navbar-collapse -->

            <!-- Start Atribute Navigation -->
            <div class="attr-nav">
                <ul>
                    <li class="search"><a href="#"><i class="fa fa-search"></i></a></li>
                    <c:if test="${cart != null}">
                    <li class="side-menu">
                        <a href="cart">
                            <i class="fa fa-shopping-bag"></i>
                            <span class="badge">${cart.size()}</span>
                            <p>Giỏ hàng</p>
                        </a>
                    </li>
                    </c:if>
                </ul>
            </div>
            <!-- End Atribute Navigation -->
            <div class="collapse navbar-collapse">
                <ul class="nav navbar-nav ml-auto" data-in="fadeInDown" data-out="fadeOutUp">
                    <li class="dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">
                            <c:if test="${sessionScope.username != null}">
                                <span>Xin chào, ${sessionScope.username}</span>
                            </c:if>
                            <i class="fa fa-user" id="user"></i></a>
                        <ul class="dropdown-menu">

                            <c:choose>
                                <c:when test="${sessionScope.username == null}">
                                    <li><a href="login"><strong>Đăng nhập</strong></a></li>
                                    <li><a href="register"><strong>Đăng ký</strong></a></li>
                                </c:when>
                                <c:otherwise>
                                    <li><a href="cart"><strong>Giỏ hàng</strong></a></li>
<%--                                    <li><a href="#"><strong>Tài khoản</strong></a></li>--%>
                                    <li><a href="logout"><strong>Đăng xuất</strong></a></li>
                                </c:otherwise>
                            </c:choose>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
        <!-- Start Side Menu -->
        <div class="side">
            <a href="#" class="close-side"><i class="fa fa-times"></i></a>
            <li class="cart-box">
                <ul class="cart-list" id="cartSmall">
                    <c:forEach items="${cart}" var="item" varStatus="index">
                        <c:set var="check"
                               value="${item.getProduct().getDiscountedPrice()==0||item.getProduct().getDiscountedPrice()==item.getProduct().getPrice()}"/>
                        <c:set var="price" value="0"/>
                        <c:if test="${check}"><c:set var="price"
                                                     value="${item.getProduct().getPrice()}"/></c:if>
                        <c:if test="${!check}"><c:set var="price"
                                                      value="${item.getProduct().getDiscountedPrice()}"/></c:if>
                        <li>
                            <a class="photo"><img src="${item.getProduct().getImages()[0]}" class="cart-thumb" alt=""/></a>
                            <h6><a href="#">${item.getProduct().getName()} </a></h6>
                            <p>${item.getQuantity()}x - <span class="price">${price}</span></p>
                        </li>
                    </c:forEach>
                    <%--                    <li class="total">--%>
                                            <a href="cart" class="btn btn-default hvr-hover btn-cart">VIEW CART</a>
                    <%--                        <span class="float-right"><strong>Total</strong>: $180.00</span>--%>
                    <%--                    </li>--%>
                </ul>
            </li>
        </div>
        <!-- End Side Menu -->
    </nav>
    <!-- End Navigation -->
</header>
<!-- End Main Header -->

<!-- Start Top Search -->
<div class="top-search">
    <div class="container">
        <div class="input-group">
            <span class="input-group-addon"><i class="fa fa-search"></i></span>
            <input type="text" class="form-control" placeholder="Tìm kiếm">
            <span class="input-group-addon close-search"><i class="fa fa-times"></i></span>
        </div>
    </div>
</div>
<!-- End Top Search -->
