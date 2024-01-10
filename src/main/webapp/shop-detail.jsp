<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="header.jsp"></jsp:include>
<!-- Start All Title Box -->
<div class="all-title-box">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <h2>Thông tin sản phẩm</h2>
                <ul class="breadcrumb">
                    <li class="breadcrumb-item"><a href="#">Cửa hàng</a></li>
                    <li class="breadcrumb-item active">Thông tin sản phẩm</li>
                </ul>
            </div>
        </div>
    </div>
</div>
<!-- End All Title Box -->

<!-- Start Shop Detail -->
<c:set var="product" value="${product}"/>
<div class="shop-detail-box-main">
    <div class="container">
        <div class="row">
            <div class="col-xl-5 col-lg-5 col-md-6">
                <div id="carousel-example-1" class="single-product-slider carousel slide" data-ride="carousel">
                    <div class="carousel-inner" role="listbox">
                        <c:forEach var="url" items="${product.getImages()}" varStatus="loop">
                            <div class="carousel-item <c:if test="${loop.index == 0}">active</c:if>">
                                <img class="d-block w-100" src="${url}"
                                     alt="Image"></div>
                        </c:forEach>
                    </div>
                    <a class="carousel-control-prev" href="#carousel-example-1" role="button" data-slide="prev">
                        <i class="fa fa-angle-left" aria-hidden="true"></i>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="carousel-control-next" href="#carousel-example-1" role="button" data-slide="next">
                        <i class="fa fa-angle-right" aria-hidden="true"></i>
                        <span class="sr-only">Next</span>
                    </a>
                    <ol class="carousel-indicators">
                        <c:forEach var="url" items="${product.getImages()}" varStatus="loop">
                            <li data-target="#carousel-example-1" data-slide-to="${loop.index}"
                                class="<c:if test="${loop.index == 0}">active</c:if>">
                                <img class="d-block w-100 img-fluid" src="${url}" alt=""/>
                            </li>
                        </c:forEach>
                    </ol>
                </div>
            </div>
            <div class="col-xl-7 col-lg-7 col-md-6">
                <div class="single-product-details">
                    <h2>${product.getName()}</h2>
                    <h5>
                        <c:set var="check"
                               value="${product.getDiscountedPrice()==0||product.getDiscountedPrice()==product.getPrice()}"/>
                        <c:if test="${check}">${product.getPrice()}đ<c:set var="price"
                                                                           value="${product.getPrice()}"/></c:if>
                        <c:if test="${!check}">
                            <del>${product.getPrice()}đ</del>

                            ${product.getDiscountedPrice()}đ
                            <c:set var="price"
                                   value="${product.getDiscountedPrice()}"/>
                        </c:if>
                    </h5>
                    <p class="available-stock"><span>${product.getQuantity()} có sẵn / <a href="#">8 đã bán </a></span>
                    <p>
                    <h4>Mô tả:</h4>
                    <p>${product.getDescription()} </p>
                    <ul>
                        <li>
                            <div class="form-group quantity-box">
                                <label class="control-label">Số lượng</label>
                                <input class="form-control" value="1" min="1" max="${product.getQuantity()}"
                                       type="number">
                            </div>
                        </li>
                    </ul>
                    <c:set var="indexItem" value="0"/>
                    <c:forEach items="${cart}" var="item" varStatus="index">
                        <c:if test="${item.getProduct().getId() == product.getId()}"><c:set var="indexItem"
                                                                                            value="${index.index}"/></c:if>
                    </c:forEach>
                    <div class="price-box-bar">
                        <div class="cart-and-bay-btn">
                            <a class="btn hvr-hover" data-fancybox-close="" href="cart"
                               onclick="addItem(${product.getId()},${price},<c:out value="${cart.size()}"
                                                                                   default="0"/>,${indexItem},true)">Mua
                                ngay</a>
                            <a class="btn hvr-hover" data-fancybox-close="" style="color: white"
                               onclick="addItem(${product.getId()},${price},<c:out value="${cart.size()}"
                                                                                   default="0"/>,${indexItem},true);
                               <c:if test="${username!=null}">Swal.fire({
                                       icon: 'success',
                                       title: 'Đã thêm sản phẩm',
                                       showConfirmButton: false,
                                       timer: 1000
                                       });</c:if>;<c:if test="${username==null}">window.location.href = 'cart'</c:if>">Thêm
                                vào giỏ hàng</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="row my-5">
            <div class="card card-outline-secondary my-4">
                <div class="card-header">
                    <h2>Đánh giá sản phẩm</h2>
                </div>
                <div class="card-body">
                    <div class="media mb-3">
                        <div class="mr-2">
                            <img class="rounded-circle border p-1"
                                 src="data:image/svg+xml;charset=UTF-8,%3Csvg%20width%3D%2264%22%20height%3D%2264%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%2064%2064%22%20preserveAspectRatio%3D%22none%22%3E%3Cdefs%3E%3Cstyle%20type%3D%22text%2Fcss%22%3E%23holder_160c142c97c%20text%20%7B%20fill%3Argba(255%2C255%2C255%2C.75)%3Bfont-weight%3Anormal%3Bfont-family%3AHelvetica%2C%20monospace%3Bfont-size%3A10pt%20%7D%20%3C%2Fstyle%3E%3C%2Fdefs%3E%3Cg%20id%3D%22holder_160c142c97c%22%3E%3Crect%20width%3D%2264%22%20height%3D%2264%22%20fill%3D%22%23777%22%3E%3C%2Frect%3E%3Cg%3E%3Ctext%20x%3D%2213.5546875%22%20y%3D%2236.5%22%3E64x64%3C%2Ftext%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E"
                                 alt="Generic placeholder image">
                        </div>
                        <div class="media-body">
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Omnis et enim aperiam
                                inventore, similique necessitatibus neque non! Doloribus, modi sapiente laboriosam
                                aperiam fugiat laborum. Sequi mollitia, necessitatibus quae sint natus.</p>
                            <small class="text-muted">Đăng bởi Anonymous on 3/1/18</small>
                        </div>
                    </div>
                    <hr>
                    <div class="media mb-3">
                        <div class="mr-2">
                            <img class="rounded-circle border p-1"
                                 src="data:image/svg+xml;charset=UTF-8,%3Csvg%20width%3D%2264%22%20height%3D%2264%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%2064%2064%22%20preserveAspectRatio%3D%22none%22%3E%3Cdefs%3E%3Cstyle%20type%3D%22text%2Fcss%22%3E%23holder_160c142c97c%20text%20%7B%20fill%3Argba(255%2C255%2C255%2C.75)%3Bfont-weight%3Anormal%3Bfont-family%3AHelvetica%2C%20monospace%3Bfont-size%3A10pt%20%7D%20%3C%2Fstyle%3E%3C%2Fdefs%3E%3Cg%20id%3D%22holder_160c142c97c%22%3E%3Crect%20width%3D%2264%22%20height%3D%2264%22%20fill%3D%22%23777%22%3E%3C%2Frect%3E%3Cg%3E%3Ctext%20x%3D%2213.5546875%22%20y%3D%2236.5%22%3E64x64%3C%2Ftext%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E"
                                 alt="Generic placeholder image">
                        </div>
                        <div class="media-body">
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Omnis et enim aperiam
                                inventore, similique necessitatibus neque non! Doloribus, modi sapiente laboriosam
                                aperiam fugiat laborum. Sequi mollitia, necessitatibus quae sint natus.</p>
                            <small class="text-muted">Đăng bởi Anonymous on 3/1/18</small>
                        </div>
                    </div>
                    <hr>
                    <div class="media mb-3">
                        <div class="mr-2">
                            <img class="rounded-circle border p-1"
                                 src="data:image/svg+xml;charset=UTF-8,%3Csvg%20width%3D%2264%22%20height%3D%2264%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%2064%2064%22%20preserveAspectRatio%3D%22none%22%3E%3Cdefs%3E%3Cstyle%20type%3D%22text%2Fcss%22%3E%23holder_160c142c97c%20text%20%7B%20fill%3Argba(255%2C255%2C255%2C.75)%3Bfont-weight%3Anormal%3Bfont-family%3AHelvetica%2C%20monospace%3Bfont-size%3A10pt%20%7D%20%3C%2Fstyle%3E%3C%2Fdefs%3E%3Cg%20id%3D%22holder_160c142c97c%22%3E%3Crect%20width%3D%2264%22%20height%3D%2264%22%20fill%3D%22%23777%22%3E%3C%2Frect%3E%3Cg%3E%3Ctext%20x%3D%2213.5546875%22%20y%3D%2236.5%22%3E64x64%3C%2Ftext%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E"
                                 alt="Generic placeholder image">
                        </div>
                        <div class="media-body">
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Omnis et enim aperiam
                                inventore, similique necessitatibus neque non! Doloribus, modi sapiente laboriosam
                                aperiam fugiat laborum. Sequi mollitia, necessitatibus quae sint natus.</p>
                            <small class="text-muted">Đăng bởi Anonymous on 3/1/18</small>
                        </div>
                    </div>
                    <hr>
                    <a href="#" class="btn hvr-hover">Thêm đánh giá</a>
                </div>
            </div>
        </div>

        <div class="row my-5">
            <div class="col-lg-12">
                <div class="title-all text-center">
                    <h1>Sản phẩm nổi bật</h1>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed sit amet lacus enim.</p>
                </div>
                <div class="featured-products-box owl-carousel owl-theme">
                    <div class="item">
                        <div class="products-single fix">
                            <div class="box-img-hover">
                                <img src="images/img-pro-01.jpg" class="img-fluid" alt="Image">
                                <div class="mask-icon">
                                    <ul>
                                        <li><a href="#" data-toggle="tooltip" data-placement="right" title="Xem"><i
                                                class="fas fa-eye"></i></a></li>
                                        <li><a href="#" data-toggle="tooltip" data-placement="right" title="So sánh"><i
                                                class="fas fa-sync-alt"></i></a></li>
                                        <li><a href="#" data-toggle="tooltip" data-placement="right"
                                               title="Thêm vào danh sách ước"><i class="far fa-heart"></i></a></li>
                                    </ul>
                                    <a class="cart" href="#">Thêm vào giỏ hàng</a>
                                </div>
                            </div>
                            <div class="why-text">
                                <h4>Lorem ipsum dolor sit amet</h4>
                                <h5> $9.79</h5>
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="products-single fix">
                            <div class="box-img-hover">
                                <img src="images/img-pro-02.jpg" class="img-fluid" alt="Image">
                                <div class="mask-icon">
                                    <ul>
                                        <li><a href="#" data-toggle="tooltip" data-placement="right" title="Xem"><i
                                                class="fas fa-eye"></i></a></li>
                                        <li><a href="#" data-toggle="tooltip" data-placement="right" title="So sánh"><i
                                                class="fas fa-sync-alt"></i></a></li>
                                        <li><a href="#" data-toggle="tooltip" data-placement="right"
                                               title="Thêm vào danh sách ước"><i class="far fa-heart"></i></a></li>
                                    </ul>
                                    <a class="cart" href="#">Thêm vào giỏ hàng</a>
                                </div>
                            </div>
                            <div class="why-text">
                                <h4>Lorem ipsum dolor sit amet</h4>
                                <h5> $9.79</h5>
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="products-single fix">
                            <div class="box-img-hover">
                                <img src="images/img-pro-03.jpg" class="img-fluid" alt="Image">
                                <div class="mask-icon">
                                    <ul>
                                        <li><a href="#" data-toggle="tooltip" data-placement="right" title="Xem"><i
                                                class="fas fa-eye"></i></a></li>
                                        <li><a href="#" data-toggle="tooltip" data-placement="right" title="So sánh"><i
                                                class="fas fa-sync-alt"></i></a></li>
                                        <li><a href="#" data-toggle="tooltip" data-placement="right"
                                               title="Thêm vào danh sách ước"><i class="far fa-heart"></i></a></li>
                                    </ul>
                                    <a class="cart" href="#">Thêm vào giỏ hàng</a>
                                </div>
                            </div>
                            <div class="why-text">
                                <h4>Lorem ipsum dolor sit amet</h4>
                                <h5> $9.79</h5>
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="products-single fix">
                            <div class="box-img-hover">
                                <img src="images/img-pro-04.jpg" class="img-fluid" alt="Image">
                                <div class="mask-icon">
                                    <ul>
                                        <li><a href="#" data-toggle="tooltip" data-placement="right" title="Xem"><i
                                                class="fas fa-eye"></i></a></li>
                                        <li><a href="#" data-toggle="tooltip" data-placement="right" title="So sánh"><i
                                                class="fas fa-sync-alt"></i></a></li>
                                        <li><a href="#" data-toggle="tooltip" data-placement="right"
                                               title="Thêm vào danh sách ước"><i class="far fa-heart"></i></a></li>
                                    </ul>
                                    <a class="cart" href="#">Thêm vào giỏ hàng</a>
                                </div>
                            </div>
                            <div class="why-text">
                                <h4>Lorem ipsum dolor sit amet</h4>
                                <h5> $9.79</h5>
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="products-single fix">
                            <div class="box-img-hover">
                                <img src="images/img-pro-01.jpg" class="img-fluid" alt="Image">
                                <div class="mask-icon">
                                    <ul>
                                        <li><a href="#" data-toggle="tooltip" data-placement="right" title="Xem"><i
                                                class="fas fa-eye"></i></a></li>
                                        <li><a href="#" data-toggle="tooltip" data-placement="right" title="So sánh"><i
                                                class="fas fa-sync-alt"></i></a></li>
                                        <li><a href="#" data-toggle="tooltip" data-placement="right"
                                               title="Thêm vào danh sách ước"><i class="far fa-heart"></i></a></li>
                                    </ul>
                                    <a class="cart" href="#">Thêm vào giỏ hàng</a>
                                </div>
                            </div>
                            <div class="why-text">
                                <h4>Lorem ipsum dolor sit amet</h4>
                                <h5> $9.79</h5>
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="products-single fix">
                            <div class="box-img-hover">
                                <img src="images/img-pro-02.jpg" class="img-fluid" alt="Image">
                                <div class="mask-icon">
                                    <ul>
                                        <li><a href="#" data-toggle="tooltip" data-placement="right" title="Xem"><i
                                                class="fas fa-eye"></i></a></li>
                                        <li><a href="#" data-toggle="tooltip" data-placement="right" title="So sánh"><i
                                                class="fas fa-sync-alt"></i></a></li>
                                        <li><a href="#" data-toggle="tooltip" data-placement="right"
                                               title="Thêm vào danh sách ước"><i class="far fa-heart"></i></a></li>
                                    </ul>
                                    <a class="cart" href="#">Thêm vào giỏ hàng</a>
                                </div>
                            </div>
                            <div class="why-text">
                                <h4>Lorem ipsum dolor sit amet</h4>
                                <h5> $9.79</h5>
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="products-single fix">
                            <div class="box-img-hover">
                                <img src="images/img-pro-03.jpg" class="img-fluid" alt="Image">
                                <div class="mask-icon">
                                    <ul>
                                        <li><a href="#" data-toggle="tooltip" data-placement="right" title="Xem"><i
                                                class="fas fa-eye"></i></a></li>
                                        <li><a href="#" data-toggle="tooltip" data-placement="right" title="So sánh"><i
                                                class="fas fa-sync-alt"></i></a></li>
                                        <li><a href="#" data-toggle="tooltip" data-placement="right"
                                               title="Thêm vào danh sách ước"><i class="far fa-heart"></i></a></li>
                                    </ul>
                                    <a class="cart" href="#">Thêm vào giỏ hàng</a>
                                </div>
                            </div>
                            <div class="why-text">
                                <h4>Lorem ipsum dolor sit amet</h4>
                                <h5> $9.79</h5>
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="products-single fix">
                            <div class="box-img-hover">
                                <img src="images/img-pro-04.jpg" class="img-fluid" alt="Image">
                                <div class="mask-icon">
                                    <ul>
                                        <li><a href="#" data-toggle="tooltip" data-placement="right" title="Xem"><i
                                                class="fas fa-eye"></i></a></li>
                                        <li><a href="#" data-toggle="tooltip" data-placement="right" title="So sánh"><i
                                                class="fas fa-sync-alt"></i></a></li>
                                        <li><a href="#" data-toggle="tooltip" data-placement="right"
                                               title="Thêm vào danh sách ước"><i class="far fa-heart"></i></a></li>
                                    </ul>
                                    <a class="cart" href="#">Thêm vào giỏ hàng</a>
                                </div>
                            </div>
                            <div class="why-text">
                                <h4>Lorem ipsum dolor sit amet</h4>
                                <h5> $9.79</h5>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- End Cart -->
<jsp:include page="footer.jsp"></jsp:include>
