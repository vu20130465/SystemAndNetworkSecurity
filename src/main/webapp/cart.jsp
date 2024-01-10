<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>

<jsp:include page="header.jsp"></jsp:include>
<!-- Start All Title Box -->
<div class="all-title-box">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <h2>Giỏ Hàng</h2>
                <ul class="breadcrumb">
                    <li class="breadcrumb-item"><a href="#">Cửa Hàng</a></li>
                    <li class="breadcrumb-item active">Giỏ Hàng</li>
                </ul>
            </div>
        </div>
    </div>
</div>
<!-- End All Title Box -->

<!-- Start Cart -->
<c:set var="totals"/>
<div class="cart-box-main">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="table-main table-responsive">
                    <table class="table">
                        <thead>
                        <tr>
                            <th style="width: 10%;">Ảnh</th>
                            <th style="width: 50%;">Tên Sản Phẩm</th>
                            <th style="width: 12%;">Giá</th>
                            <th style="width: 10%;">Số lượng</th>
                            <th style="width: 13%;">Tổng</th>
                            <th style="width: 5%;">Xóa</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${cart}" var="item" varStatus="index">

                            <c:set var="product" value="${item.getProduct()}"/>
                            <c:set var="url" value="product-detail?id=${product.getId()}"/>
                            <tr id="item${index.index}">
                                <td class="thumbnail-img">
                                    <a href="${url}">
                                        <img class="img-fluid" src="${product.getImages()[0]}" alt=""/>
                                    </a>
                                </td>
                                <td class="name-pr">
                                    <a href="${url}">
                                            ${product.getName()}
                                    </a>
                                </td>
                                <td class="price-pr">
                                    <p>
                                        <c:set var="check"
                                               value="${product.getDiscountedPrice()==0||product.getDiscountedPrice()==product.getPrice()}"/>
                                        <c:set var="price" value="0"/>
                                        <c:if test="${check}">${product.getPrice()}đ<c:set var="price"
                                                                                           value="${product.getPrice()}"/></c:if>
                                        <c:if test="${!check}">${product.getDiscountedPrice()}đ<c:set var="price"
                                                                                                      value="${product.getDiscountedPrice()}"/></c:if>
                                    </p>
                                </td>
                                <td class="quantity-box"><input id="${index.index}" type="number" size="4"
                                                                value="${item.getQuantity()}"
                                                                min="1" step="1" max="${product.getQuantity()}"
                                                                class="c-input-text qty text"
                                                                onchange="addItems(${product.getId()},${price},${cart.size()},this,false)">
                                </td>
                                <td class="total-pr">
                                    <p id="total-pr${index.index}"
                                       data-value="${price * item.getQuantity()}">${price * item.getQuantity()}đ</p>
                                    <c:set var="tmp" value="${totals = totals + (price * item.getQuantity())}"/>
                                </td>
                                <td>
                                    <button style="border: none; background: none; cursor: pointer;"
                                            onclick="removeItem(${product.getId()},${index.index}, ${cart.size()})"><i
                                            class="fas fa-times"></i></button>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <div class="row my-5">
            <div class="col-lg-8 col-sm-12"></div>
            <div class="col-lg-4 col-sm-12">
                <div class="order-box">
                    <div class="d-flex">
                        <h4>Tổng cộng</h4>
                        <div id="total-bill"
                             class="ml-auto font-weight-bold">${totals}đ
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-12 d-flex shopping-box">
                <c:choose>
                    <c:when test="${cart.size() gt 0}">
                        <a href="order.jsp" class="ml-auto btn hvr-hover">Thanh Toán</a>
                    </c:when>
                    <c:otherwise>
                        <p class="ml-auto text-danger">Giỏ hàng trống. Vui lòng thêm sản phẩm vào giỏ hàng trước khi thanh toán.</p>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>

    </div>
</div>
<!-- End Cart -->
<jsp:include page="footer.jsp"></jsp:include>
