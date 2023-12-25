<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="header.jsp"></jsp:include>
<c:set var="productList" value="${requestScope.products}" scope="request"></c:set>
<!-- Start All Title Box -->
<div class="all-title-box">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <h2>Cửa hàng</h2>
                <ul class="breadcrumb">
                    <li class="breadcrumb-item"><a href="home">Trang chủ</a></li>
                    <li class="breadcrumb-item active">Cửa hàng</li>
                </ul>
            </div>
        </div>
    </div>
</div>
<!-- End All Title Box -->

<!-- Start Shop Page -->
<div class="shop-box-inner">
    <div class="container">
        <div class="row">
            <div class="col-xl-9 col-lg-9 col-sm-12 col-xs-12 shop-content-right">
                <div class="right-product-box">
                    <div class="product-item-filter row">
                        <div class="col-12 col-sm-8 text-center text-sm-left">
                            <div class="toolbar-sorter-right">
                                <span>Sắp xếp</span>
                                <select id="sort" class="selectpicker show-tick form-control" data-placeholder="$ USD"
                                        onchange="sort()">
                                    <option value="1">Giá thấp → Giá cao</option>
                                    <option value="2">Giá cao → Giá thấp</option>
                                    <option value="3">Mới nhất</option>
                                    <option value="4">Giảm giá</option>
                                </select>
                            </div>
                            <p id="number-of-result">Đang hiện ${productList.size()} kết quả</p>
                        </div>
                    </div>

                    <div class="product-categorie-box">
                        <div class="tab-content">
                            <div role="tabpanel" class="tab-pane fade show active" id="grid-view">
                                <div class="row" id="product-list">
                                    <c:forEach var="pro" items="${productList}">
                                        <div class="col-sm-6 col-md-6 col-lg-4 col-xl-4 product-cell">
                                            <div class="products-single fix">
                                                <div class="box-img-hover" style="height: 255px">
                                                    <div class="type-lb">
                                                        <c:if test="${pro.getStatus() != null||pro.getStatus() != ''}">
                                                            <p class="status-param sale"> ${pro.getStatus()}
                                                            </p></c:if>
                                                    </div>
                                                    <img src="${pro.getImages().get(0)}" class="img-fluid image-param"
                                                         alt="Image">
                                                    <div class="mask-icon">
                                                        <a class="cart" style="cursor: pointer"
                                                           onclick="updateCart('${pro.getId()}');
                                                           <c:if test="${username!=null}">Swal.fire({
                                                                                            icon: 'success',
                                                                                            title: 'Đã thêm sản phẩm',
                                                                                            showConfirmButton: false,
                                                                                            timer: 1000
                                                                                                    });</c:if>
                                                           <c:if test="${username==null}">alert('Vui lòng đăng nhập trước');
                                                                   window.location.href='login'</c:if>">Thêm vào giỏ
                                                            </a>
                                                    </div>
                                                </div>
                                                <a class="id-param" href="product-detail?id=${pro.getId()}"
                                                   style="cursor: pointer;">
                                                    <div class="why-text" style="height: 113px">
                                                        <h4 class="name-param">${pro.getName()}</h4>
                                                        <c:set var="check"
                                                               value="${pro.getDiscountedPrice()==0||pro.getDiscountedPrice()==pro.getPrice()}"/>
                                                        <c:set var="price" value="0"/>
                                                        <c:if test="${check}"><c:set var="price"
                                                                                     value="${pro.getPrice()}"/></c:if>
                                                        <c:if test="${!check}"><c:set var="price"
                                                                                      value="${pro.getDiscountedPrice()}"/></c:if>
                                                        <h5 class="price-param">${price}đ</h5>
                                                    </div>
                                                </a>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-lg-3 col-sm-12 col-xs-12 sidebar-shop-left">
                <div class="product-categori">
                    <div class="search-product">
                        <form action="search">
                            <input class="form-control" name="name-pattern" placeholder="Tìm kiếm..." type="text">
                            <button type="submit"><i class="fa fa-search"></i></button>
                        </form>
                    </div>
                    <div class="filter-sidebar-left">
                        <div class="title-left">
                            <h3>Phân loại</h3>
                        </div>
                        <div class="list-group list-group-collapse list-group-sm list-group-tree" id="list-group-men"
                             data-children=".sub-men" style="overflow: scroll; height: 400px">
                            <c:forEach var="category" items="${requestScope.categories}">
                                <a href="category?id=${category.getId()}">${category.getName()}
                                    <small class="text-muted"><strong>(${category.getQuantity()})</strong></small>
                                </a>
                            </c:forEach>
                        </div>
                    </div>
                    <div class="filter-price-left">
                        <div class="title-left">
                            <h3>Giá</h3>
                        </div>
                        <strong>Nhập khoảng giá</strong>
                        <form action="filter" method="get">
                            <input required type="text" name="from-price" value="" style="width: 100%">
                            <div style="text-align: center"><strong>Đến</strong></div>
                            <input required type="text" name="to-price" style="width: 100%">
                            <input type="text" name="category_id" value="${category_id}" style="display: none">
                            <div style="display: flex; justify-content: right; margin-top: 10px;">
                                <button class="btn" type="submit" style="background: #b0b435; color: white"><a
                                        href="filter?category_id=${category_id}"><strong>Lọc</strong></a>
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
<!-- End Shop Page -->
<jsp:include page="footer.jsp"></jsp:include>
