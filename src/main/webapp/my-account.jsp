<%--
  Created by IntelliJ IDEA.
  User: NVQ
  Date: 10/11/2022
  Time: 22:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>

<%@include file="header.jsp" %>

<!-- Start All Title Box -->
<div class="all-title-box">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <h2>Tài khoản của tôi</h2>
                <ul class="breadcrumb">
                    <li class="breadcrumb-item"><a href="#">Cửa hàng</a></li>
                    <li class="breadcrumb-item active">Tài khoản của tôi</li>
                </ul>
            </div>
        </div>
    </div>
</div>
<!-- End All Title Box -->

<!-- Start My Account  -->
<div class="my-account-box-main">
    <div class="container">
        <div class="my-account-page">
            <div class="row">
                <div class="col-lg-4 col-md-12">
                    <div class="account-box">
                        <div class="service-box">
                            <div class="service-icon">
                                <a href="#"> <i class="fa fa-gift"></i> </a>
                            </div>
                            <div class="service-desc">
                                <h4>Các đơn của bạn</h4>
                                <p>Theo dõi, đổi trả, mua lại</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-12">
                    <div class="account-box">
                        <div class="service-box">
                            <div class="service-icon">
                                <a href="#"><i class="fa fa-lock"></i> </a>
                            </div>
                            <div class="service-desc">
                                <h4>Đăng nhập & bảo mật</h4>
                                <p>Chỉnh sửa tên, số di động</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-12">
                    <div class="account-box">
                        <div class="service-box">
                            <div class="service-icon">
                                <a href="#"> <i class="fa fa-location-arrow"></i> </a>
                            </div>
                            <div class="service-desc">
                                <h4>Địa chỉ</h4>
                                <p>Chỉnh sửa địa chỉ cho đơn hàng và quà tặng</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-12">
                    <div class="account-box">
                        <div class="service-box">
                            <div class="service-icon">
                                <a href="#"> <i class="fa fa-credit-card"></i> </a>
                            </div>
                            <div class="service-desc">
                                <h4>Phương thức thanh toán</h4>
                                <p>Chỉnh sửa hoặc thêm phương thức thanh toán</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-12">
                    <div class="account-box">
                        <div class="service-box">
                            <div class="service-icon">
                                <a href="#"> <i class="fab fa-paypal"></i> </a>
                            </div>
                            <div class="service-desc">
                                <h4>PayPal</h4>
                                <p>Xem các lợi ích và cài đặt thanh toán</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-12">
                    <div class="account-box">
                        <div class="service-box">
                            <div class="service-icon">
                                <a href="#"> <i class="fab fa-amazon"></i> </a>
                            </div>
                            <div class="service-desc">
                                <h4>Số dư trên Amazon Pay</h4>
                                <p>Thêm tiền vào số dư của bạn</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--                <div class="bottom-box">-->
            <!--                    <div class="row">-->
            <!--                        <div class="col-lg-4 col-md-12">-->
            <!--                            <div class="account-box">-->
            <!--                                <div class="service-box">-->
            <!--                                    <div class="service-desc">-->
            <!--                                        <h4>Đồ trang sức bằng vàng và kim cương</h4>-->
            <!--                                        <ul>-->
            <!--                                            <li> <a href="#">Ứng dụng và hơn thế nữa</a> </li>-->
            <!--                                            <li> <a href="#">Nội dung và thiết bị</a> </li>-->
            <!--                                            <li> <a href="#">Cài đặt âm nhạc</a> </li>-->
            <!--                                        </ul>-->
            <!--                                    </div>-->
            <!--                                </div>-->
            <!--                            </div>-->
            <!--                        </div>-->
            <!--                        <div class="col-lg-4 col-md-12">-->
            <!--                            <div class="account-box">-->
            <!--                                <div class="service-box">-->
            <!--                                    <div class="service-desc">-->
            <!--                                        <h4>Cửa hàng thủ công mỹ nghệ & hàng thủ công</h4>-->
            <!--                                        <ul>-->
            <!--                                            <li> <a href="#">Tùy chọn quảng cáo</a> </li>-->
            <!--                                            <li> <a href="#">Sở thích giao tiếp</a> </li>-->
            <!--                                            <li> <a href="#">Tùy chọn cảnh báo SMS</a> </li>-->
            <!--                                            <li> <a href="#">Trung tâm tin nhắn</a> </li>-->
            <!--                                        </ul>-->
            <!--                                    </div>-->
            <!--                                </div>-->
            <!--                            </div>-->
            <!--                        </div>-->
            <!--                        <div class="col-lg-4 col-md-12">-->
            <!--                            <div class="account-box">-->
            <!--                                <div class="service-box">-->
            <!--                                    <div class="service-desc">-->
            <!--                                        <h4>The Designer Boutique</h4>-->
            <!--                                        <ul>-->
            <!--                                            <li> <a href="#">Amazon Pay</a> </li>-->
            <!--                                            <li> <a href="#">Bank accounts for refunds</a> </li>-->
            <!--                                            <li> <a href="#">Coupons</a> </li>-->
            <!--                                        </ul>-->
            <!--                                    </div>-->
            <!--                                </div>-->
            <!--                            </div>-->
            <!--                        </div>-->
            <!--                        <div class="col-lg-4 col-md-12">-->
            <!--                            <div class="account-box">-->
            <!--                                <div class="service-box">-->
            <!--                                    <div class="service-desc">-->
            <!--                                        <h4>Gift Boxes, Gift Tags, Greeting Cards</h4>-->
            <!--                                        <ul>-->
            <!--                                            <li> <a href="#">Leave delivery feedback</a> </li>-->
            <!--                                            <li> <a href="#">Lists</a> </li>-->
            <!--                                            <li> <a href="#">Photo ID proofs</a> </li>-->
            <!--                                            <li> <a href="#">Profile</a> </li>-->
            <!--                                        </ul>-->
            <!--                                    </div>-->
            <!--                                </div>-->
            <!--                            </div>-->
            <!--                        </div>-->
            <!--                        <div class="col-lg-4 col-md-12">-->
            <!--                            <div class="account-box">-->
            <!--                                <div class="service-box">-->
            <!--                                    <div class="service-desc">-->
            <!--                                        <h4>Other accounts</h4>-->
            <!--                                        <ul>-->
            <!--                                            <li> <a href="#">Amazon Business registration</a> </li>-->
            <!--                                            <li> <a href="#">Seller account</a> </li>-->
            <!--                                            <li> <a href="#">Amazon Web Services</a> </li>-->
            <!--                                            <li> <a href="#">Login with Amazon</a> </li>-->
            <!--                                        </ul>-->
            <!--                                    </div>-->
            <!--                                </div>-->
            <!--                            </div>-->
            <!--                        </div>-->
            <!--                        <div class="col-lg-4 col-md-12">-->
            <!--                            <div class="account-box">-->
            <!--                                <div class="service-box">-->
            <!--                                    <div class="service-desc">-->
            <!--                                        <h4>Shopping programs and rentals</h4>-->
            <!--                                        <ul>-->
            <!--                                            <li> <a href="#">Subscribe &amp; Save</a> </li>-->
            <!--                                        </ul>-->
            <!--                                    </div>-->
            <!--                                </div>-->
            <!--                            </div>-->
            <!--                        </div>-->
            <!--                    </div>-->
            <!--                </div>-->
        </div>
    </div>
</div>
<!-- End My Account -->

<%@include file="footer.jsp"%>
