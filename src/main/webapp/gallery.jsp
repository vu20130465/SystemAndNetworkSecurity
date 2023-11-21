<%--
  Created by IntelliJ IDEA.
  User: NVQ
  Date: 10/11/2022
  Time: 21:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>

<%@include file="header.jsp" %>

<!-- Start All Title Box -->
<div class="all-title-box">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <h2>Bộ sự tập</h2>
                <ul class="breadcrumb">
                    <li class="breadcrumb-item"><a href="#">Trang chủ</a></li>
                    <li class="breadcrumb-item active">Bộ sự tập</li>
                </ul>
            </div>
        </div>
    </div>
</div>
<!-- End All Title Box -->

<!-- Start Gallery  -->
<div class="products-box">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="title-all text-center">
                    <h1>Bộ sưu tập</h1>
                    <p>Sản phẩm Bộ sự tập của bạn</p>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="special-menu text-center">
                    <div class="button-group filter-button-group">
                        <button class="active" data-filter="*">Tất cả</button>
                        <button data-filter=".bulbs">Củ</button>
                        <button data-filter=".fruits">Trái cây</button>
                        <button data-filter=".podded-vegetables">Rau củ quả</button>
                        <button data-filter=".root-and-tuberous">Rễ và củ</button>
                    </div>
                </div>
            </div>
        </div>

        <div class="row special-list">
            <div class="col-lg-3 col-md-6 special-grid bulbs">
                <div class="products-single fix">
                    <div class="box-img-hover">
                        <div class="type-lb">
                            <p class="sale">Bán</p>
                        </div>
                        <img src="images/gallery-img-01.jpg" class="img-fluid" alt="Image">
                        <div class="mask-icon">
                            <ul>
                                <li><a href="#" data-toggle="tooltip" data-placement="right" title="Xem"><i
                                        class="fas fa-eye"></i></a></li>
                                <li><a href="#" data-toggle="tooltip" data-placement="right" title="So sánh"><i
                                        class="fas fa-sync-alt"></i></a></li>
                                <li><a href="#" data-toggle="tooltip" data-placement="right" title="Thêm vào Bộ sự tập"><i
                                        class="far fa-heart"></i></a></li>
                            </ul>
                            <a class="cart" href="#">Thêm vào giỏ</a>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-lg-3 col-md-6 special-grid fruits">
                <div class="products-single fix">
                    <div class="box-img-hover">
                        <img src="images/gallery-img-02.jpg" class="img-fluid" alt="Image">
                        <div class="mask-icon">
                            <ul>
                                <li><a href="#" data-toggle="tooltip" data-placement="right" title="Xem"><i
                                        class="fas fa-eye"></i></a></li>
                                <li><a href="#" data-toggle="tooltip" data-placement="right" title="So sánh"><i
                                        class="fas fa-sync-alt"></i></a></li>
                                <li><a href="#" data-toggle="tooltip" data-placement="right" title="Thêm vào Bộ sự tập"><i
                                        class="far fa-heart"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-lg-3 col-md-6 special-grid bulbs">
                <div class="products-single fix">
                    <div class="box-img-hover">
                        <img src="images/gallery-img-03.jpg" class="img-fluid" alt="Image">
                        <div class="mask-icon">
                            <ul>
                                <li><a href="#" data-toggle="tooltip" data-placement="right" title="Xem"><i
                                        class="fas fa-eye"></i></a></li>
                                <li><a href="#" data-toggle="tooltip" data-placement="right" title="So sánh"><i
                                        class="fas fa-sync-alt"></i></a></li>
                                <li><a href="#" data-toggle="tooltip" data-placement="right" title="Thêm vào Bộ sự tập"><i
                                        class="far fa-heart"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-lg-3 col-md-6 special-grid fruits">
                <div class="products-single fix">
                    <div class="box-img-hover">
                        <img src="images/gallery-img-04.jpg" class="img-fluid" alt="Image">
                        <div class="mask-icon">
                            <ul>
                                <li><a href="#" data-toggle="tooltip" data-placement="right" title="Xem"><i
                                        class="fas fa-eye"></i></a></li>
                                <li><a href="#" data-toggle="tooltip" data-placement="right" title="So sánh"><i
                                        class="fas fa-sync-alt"></i></a></li>
                                <li><a href="#" data-toggle="tooltip" data-placement="right" title="Thêm vào Bộ sự tập"><i
                                        class="far fa-heart"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-lg-3 col-md-6 special-grid bulbs">
                <div class="products-single fix">
                    <div class="box-img-hover">
                        <img src="images/gallery-img-05.jpg" class="img-fluid" alt="Image">
                        <div class="mask-icon">
                            <ul>
                                <li><a href="#" data-toggle="tooltip" data-placement="right" title="Xem"><i
                                        class="fas fa-eye"></i></a></li>
                                <li><a href="#" data-toggle="tooltip" data-placement="right" title="So sánh"><i
                                        class="fas fa-sync-alt"></i></a></li>
                                <li><a href="#" data-toggle="tooltip" data-placement="right" title="Thêm vào Bộ sự tập"><i
                                        class="far fa-heart"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-lg-3 col-md-6 special-grid fruits">
                <div class="products-single fix">
                    <div class="box-img-hover">
                        <img src="images/gallery-img-06.jpg" class="img-fluid" alt="Image">
                        <div class="mask-icon">
                            <ul>
                                <li><a href="#" data-toggle="tooltip" data-placement="right" title="Xem"><i
                                        class="fas fa-eye"></i></a></li>
                                <li><a href="#" data-toggle="tooltip" data-placement="right" title="So sánh"><i
                                        class="fas fa-sync-alt"></i></a></li>
                                <li><a href="#" data-toggle="tooltip" data-placement="right" title="Thêm vào Bộ sự tập"><i
                                        class="far fa-heart"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-lg-3 col-md-6 special-grid podded-vegetables">
                <div class="products-single fix">
                    <div class="box-img-hover">
                        <img src="images/gallery-img-07.jpg" class="img-fluid" alt="Image">
                        <div class="mask-icon">
                            <ul>
                                <li><a href="#" data-toggle="tooltip" data-placement="right" title="Xem"><i
                                        class="fas fa-eye"></i></a></li>
                                <li><a href="#" data-toggle="tooltip" data-placement="right" title="So sánh"><i
                                        class="fas fa-sync-alt"></i></a></li>
                                <li><a href="#" data-toggle="tooltip" data-placement="right" title="Thêm vào Bộ sự tập"><i
                                        class="far fa-heart"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-lg-3 col-md-6 special-grid root-and-tuberous">
                <div class="products-single fix">
                    <div class="box-img-hover">
                        <img src="images/gallery-img-08.jpg" class="img-fluid" alt="Image">
                        <div class="mask-icon">
                            <ul>
                                <li><a href="#" data-toggle="tooltip" data-placement="right" title="Xem"><i
                                        class="fas fa-eye"></i></a></li>
                                <li><a href="#" data-toggle="tooltip" data-placement="right" title="So sánh"><i
                                        class="fas fa-sync-alt"></i></a></li>
                                <li><a href="#" data-toggle="tooltip" data-placement="right" title="Thêm vào Bộ sự tập"><i
                                        class="far fa-heart"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-lg-3 col-md-6 special-grid root-and-tuberous">
                <div class="products-single fix">
                    <div class="box-img-hover">
                        <img src="images/gallery-img-09.jpg" class="img-fluid" alt="Image">
                        <div class="mask-icon">
                            <ul>
                                <li><a href="#" data-toggle="tooltip" data-placement="right" title="Xem"><i
                                        class="fas fa-eye"></i></a></li>
                                <li><a href="#" data-toggle="tooltip" data-placement="right" title="So sánh"><i
                                        class="fas fa-sync-alt"></i></a></li>
                                <li><a href="#" data-toggle="tooltip" data-placement="right" title="Thêm vào Bộ sự tập"><i
                                        class="far fa-heart"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-lg-3 col-md-6 special-grid podded-vegetables">
                <div class="products-single fix">
                    <div class="box-img-hover">
                        <img src="images/gallery-img-10.jpg" class="img-fluid" alt="Image">
                        <div class="mask-icon">
                            <ul>
                                <li><a href="#" data-toggle="tooltip" data-placement="right" title="Xem"><i
                                        class="fas fa-eye"></i></a></li>
                                <li><a href="#" data-toggle="tooltip" data-placement="right" title="So sánh"><i
                                        class="fas fa-sync-alt"></i></a></li>
                                <li><a href="#" data-toggle="tooltip" data-placement="right" title="Thêm vào Bộ sự tập"><i
                                        class="far fa-heart"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-lg-3 col-md-6 special-grid root-and-tuberous">
                <div class="products-single fix">
                    <div class="box-img-hover">
                        <img src="images/gallery-img-11.jpg" class="img-fluid" alt="Image">
                        <div class="mask-icon">
                            <ul>
                                <li><a href="#" data-toggle="tooltip" data-placement="right" title="Xem"><i
                                        class="fas fa-eye"></i></a></li>
                                <li><a href="#" data-toggle="tooltip" data-placement="right" title="So sánh"><i
                                        class="fas fa-sync-alt"></i></a></li>
                                <li><a href="#" data-toggle="tooltip" data-placement="right" title="Thêm vào Bộ sự tập"><i
                                        class="far fa-heart"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-lg-3 col-md-6 special-grid podded-vegetables">
                <div class="products-single fix">
                    <div class="box-img-hover">
                        <img src="images/gallery-img-12.jpg" class="img-fluid" alt="Image">
                        <div class="mask-icon">
                            <ul>
                                <li><a href="#" data-toggle="tooltip" data-placement="right" title="Xem"><i
                                        class="fas fa-eye"></i></a></li>
                                <li><a href="#" data-toggle="tooltip" data-placement="right" title="So sánh"><i
                                        class="fas fa-sync-alt"></i></a></li>
                                <li><a href="#" data-toggle="tooltip" data-placement="right" title="Thêm vào Bộ sự tập"><i
                                        class="far fa-heart"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- End Gallery  -->

<%@include file="footer.jsp" %>

