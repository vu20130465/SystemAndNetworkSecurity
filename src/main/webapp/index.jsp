<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="header.jsp"></jsp:include>
<div id="container">
    <!-- Start Slider -->
    <div id="slides-shop" class="cover-slides">
        <ul class="slides-container">
            <li class="text-center">
                <img src="images/banner-01.jpg" alt="">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <h1 class="m-b-20"><strong>Chào mừng đến với <br> cửa hàng trái cây</strong></h1>
                            <p class="m-b-40">Hãy mua theo cách của bạn</p>
                            <!--                            <p><a class="btn hvr-hover" href="#">Shop New</a></p>-->
                        </div>
                    </div>
                </div>
            </li>
            <li class="text-center">
                <img src="images/banner-02.jpg" alt="">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <h1 class="m-b-20"><strong>Chào mừng đến với <br> cửa hàng trái cây</strong></h1>
                            <p class="m-b-40">Hãy mua theo cách của bạn</p>
                            <!--                            <p><a class="btn hvr-hover" href="#">Shop New</a></p>-->
                        </div>
                    </div>
                </div>
            </li>
            <li class="text-center">
                <img src="images/banner-03.jpg" alt="">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <h1 class="m-b-20"><strong>Chào mừng đến với <br> cửa hàng trái cây</strong></h1>
                            <p class="m-b-40">Hãy mua theo cách của bạn</p>
                            <!--                            <p><a class="btn hvr-hover" href="#">Shop New</a></p>-->
                        </div>
                    </div>
                </div>
            </li>
        </ul>
        <div class="slides-navigation">
            <a href="#" class="next"><i class="fa fa-angle-right" aria-hidden="true"></i></a>
            <a href="#" class="prev"><i class="fa fa-angle-left" aria-hidden="true"></i></a>
        </div>
    </div>
    <!-- End Slider -->

    <!-- Start Categories -->
    <div class="categories-shop">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                    <div class="shop-cat-box">
                        <img class="img-fluid" src="images/categories_img_01.jpg" alt=""/>
                        <a class="btn hvr-hover" href="#">Trái cây 1</a>
                    </div>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                    <div class="shop-cat-box">
                        <img class="img-fluid" src="images/categories_img_02.jpg" alt=""/>
                        <a class="btn hvr-hover" href="#">Trái cây 2</a>
                    </div>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                    <div class="shop-cat-box">
                        <img class="img-fluid" src="images/categories_img_03.jpg" alt=""/>
                        <a class="btn hvr-hover" href="#">Trái cây 3</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Categories -->

    <div class="box-add-products">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6 col-sm-12">
                    <div class="offer-box-products">
                        <img class="img-fluid" src="images/add-img-01.jpg" alt=""/>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-sm-12">
                    <div class="offer-box-products">
                        <img class="img-fluid" src="images/add-img-02.jpg" alt=""/>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Start Products -->
    <div class="products-box">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="title-all text-center">
                        <h1>Trái cây & rau củ</h1>
                        <p>Hãy mua theo cách của bạn</p>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="special-menu text-center">
                        <div class="button-group filter-button-group">
                            <button class="active" data-filter="*">Tất cả</button>
                            <button data-filter=".top-featured">Nổi bật</button>
                            <button data-filter=".best-seller">Bán chạy nhất</button>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row special-list">
                <c:set var="listAllProduct" value="${requestScope.products}" scope="request"></c:set>
                <c:forEach items="${listAllProduct}" var="item" end="3">
                    <div class="col-lg-3 col-md-6 special-grid best-seller">
                        <div class="products-single fix">
                            <div class="box-img-hover">
                                <div class="type-lb">
                                    <p class="sale">Giảm giá</p>
                                </div>
                                <div style="width: 255px; height: 241px">
                                    <img src="<c:out value="${item.getImages().get(0)}" default=""/>" class="img-fluid"
                                         alt="Image">
                                </div>
                                <div class="mask-icon">
                                    <ul>
                                        <li><a href="#" data-toggle="tooltip" data-placement="right" title="Xem"><i
                                                class="fas fa-eye"></i></a></li>
                                        <li><a href="#" data-toggle="tooltip" data-placement="right" title="So sánh"><i
                                                class="fas fa-sync-alt"></i></a></li>
                                        <li><a href="#" data-toggle="tooltip" data-placement="right"
                                               title="Thêm vào Yêu thích"><i
                                                class="far fa-heart"></i></a></li>
                                    </ul>
                                    <a class="cart" href="#">Thêm vào giỏ</a>
                                </div>
                            </div>
                            <div class="why-text">
                                <h4>${item.getName()}</h4>
                                <h5>${item.priceToStringVND()}</h5>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</div>
<!-- End Products -->
<jsp:include page="footer.jsp"></jsp:include>