<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="header.jsp"></jsp:include>
<!-- Start All Title Box -->
<div class="all-title-box">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <h2>Thanh Toán</h2>
                <ul class="breadcrumb">
                    <li class="breadcrumb-item"><a href="#">Cửa Hàng</a></li>
                    <li class="breadcrumb-item active">Thanh Toán</li>
                </ul>
            </div>
        </div>
    </div>
</div>
<!-- End All Title Box -->

<!-- Start Cart -->
<div class="cart-box-main">
    <div class="container">
        <form class="needs-validation d-flex" novalidate action="create-order" method="post">
            <div class="col-sm-6 col-lg-6 mb-3">
                <div class="checkout-address">
                    <div class="title-left">
                        <h3>Địa chỉ thanh toán</h3>
                    </div>

                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label for="lastName">Họ *</label>
                            <input name="lastName" type="text" class="form-control" id="lastName" placeholder=""
                                   value="" required>
                            <div class="invalid-feedback"> Họ hợp lệ là bắt buộc.</div>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label for="firstName">Tên *</label>
                            <input name="firstName" type="text" class="form-control" id="firstName" placeholder=""
                                   value="" required>
                            <div class="invalid-feedback"> Tên hợp lệ là bắt buộc.</div>
                        </div>

                    </div>
                    <div class="mb-3">
                        <label for="phone">Số điện thoại *</label>
                        <input name="phone" type="text" class="form-control" id="phone" placeholder="" required>
                        <div class="invalid-feedback"> Vui lòng nhập số điện thoại hợp lệ để cập nhật thông tin vận
                            chuyển.
                        </div>
                    </div>
                    <div class="mb-3">
                        <label for="email">Địa chỉ email</label>
                        <input name="email" type="email" class="form-control" id="email" placeholder="">
                        <div class="invalid-feedback"> Vui lòng nhập địa chỉ email hợp lệ để cập nhật thông tin vận
                            chuyển.
                        </div>
                    </div>
                    <div class="mb-3">
                        <label for="address">Địa chỉ *</label>
                        <input name="address" class="form-control" id="address" placeholder="" required>
                        <div class="invalid-feedback"> Vui lòng nhập địa chỉ giao hàng của bạn.</div>
                    </div>
<%--                    <div class="col-md-5 mb-3">--%>
<%--                        <label for="province">Tỉnh *</label>--%>
<%--                        <select class="wide w-100" id="province" name="province">--%>
<%--                            <option value="An Giang">An Giang--%>
<%--                            <option value="Bà Rịa - Vũng Tàu">Bà Rịa - Vũng Tàu--%>
<%--                            <option value="Bắc Giang">Bắc Giang--%>
<%--                            <option value="Bắc Kạn">Bắc Kạn--%>
<%--                            <option value="Bạc Liêu">Bạc Liêu--%>
<%--                            <option value="Bắc Ninh">Bắc Ninh--%>
<%--                            <option value="Bến Tre">Bến Tre--%>
<%--                            <option value="Bình Định">Bình Định--%>
<%--                            <option value="Bình Dương">Bình Dương--%>
<%--                            <option value="Bình Phước">Bình Phước--%>
<%--                            <option value="Bình Thuận">Bình Thuận--%>
<%--                            <option value="Bình Thuận">Bình Thuận--%>
<%--                            <option value="Cà Mau">Cà Mau--%>
<%--                            <option value="Cao Bằng">Cao Bằng--%>
<%--                            <option value="Đắk Lắk">Đắk Lắk--%>
<%--                            <option value="Đắk Nông">Đắk Nông--%>
<%--                            <option value="Điện Biên">Điện Biên--%>
<%--                            <option value="Đồng Nai">Đồng Nai--%>
<%--                            <option value="Đồng Tháp">Đồng Tháp--%>
<%--                            <option value="Đồng Tháp">Đồng Tháp--%>
<%--                            <option value="Gia Lai">Gia Lai--%>
<%--                            <option value="Hà Giang">Hà Giang--%>
<%--                            <option value="Hà Nam">Hà Nam--%>
<%--                            <option value="Hà Tĩnh">Hà Tĩnh--%>
<%--                            <option value="Hải Dương">Hải Dương--%>
<%--                            <option value="Hậu Giang">Hậu Giang--%>
<%--                            <option value="company" selected="selected">--%>
<%--                                TP.Hồ Chí Minh--%>
<%--                            </option>--%>
<%--                            <option value="Hòa Bình">Hòa Bình--%>
<%--                            <option value="Hưng Yên">Hưng Yên--%>
<%--                            <option value="Khánh Hòa">Khánh Hòa--%>
<%--                            <option value="Kiên Giang">Kiên Giang--%>
<%--                            <option value="Kon Tum">Kon Tum--%>
<%--                            <option value="Lai Châu">Lai Châu--%>
<%--                            <option value="Lâm Đồng">Lâm Đồng--%>
<%--                            <option value="Lạng Sơn">Lạng Sơn--%>
<%--                            <option value="Lào Cai">Lào Cai--%>
<%--                            <option value="Long An">Long An--%>
<%--                            <option value="Nam Định">Nam Định--%>
<%--                            <option value="Nghệ An">Nghệ An--%>
<%--                            <option value="Ninh Bình">Ninh Bình--%>
<%--                            <option value="Ninh Thuận">Ninh Thuận--%>
<%--                            <option value="Phú Thọ">Phú Thọ--%>
<%--                            <option value="Quảng Bình">Quảng Bình--%>
<%--                            <option value="Quảng Bình">Quảng Bình--%>
<%--                            <option value="Quảng Ngãi">Quảng Ngãi--%>
<%--                            <option value="Quảng Ninh">Quảng Ninh--%>
<%--                            <option value="Quảng Trị">Quảng Trị--%>
<%--                            <option value="Sóc Trăng">Sóc Trăng--%>
<%--                            <option value="Sơn La">Sơn La--%>
<%--                            <option value="Tây Ninh">Tây Ninh--%>
<%--                            <option value="Thái Bình">Thái Bình--%>
<%--                            <option value="Thái Nguyên">Thái Nguyên--%>
<%--                            <option value="Thanh Hóa">Thanh Hóa--%>
<%--                            <option value="Thừa Thiên Huế">Thừa Thiên Huế--%>
<%--                            <option value="Tiền Giang">Tiền Giang--%>
<%--                            <option value="Trà Vinh">Trà Vinh--%>
<%--                            <option value="Tuyên Quang">Tuyên Quang--%>
<%--                            <option value="Vĩnh Long">Vĩnh Long--%>
<%--                            <option value="Vĩnh Phúc">Vĩnh Phúc--%>
<%--                            <option value="Yên Bái">Yên Bái--%>
<%--                            <option value="Phú Yên">Phú Yên--%>
<%--                            <option value="Tp.Cần Thơ">Tp.Cần Thơ--%>
<%--                            <option value="Tp.Đà Nẵng">Tp.Đà Nẵng--%>
<%--                            <option value="Tp.Hải Phòng">Tp.Hải Phòng--%>
<%--                            <option value="Tp.Hà Nội">Tp.Hà Nội--%>
<%--                        </select>--%>
<%--                    </div>--%>
<%--                    <div class="col-md-3 mb-3">--%>
<%--                        <label for="zip">Zip *</label>--%>
<%--                        <input name="zip" class="form-control" id="zip" placeholder="" required>--%>
<%--                        <div class="invalid-feedback"> Yêu cầu mã zip.</div>--%>
<%--                    </div>--%>
                </div>
                <hr class="mb-1">

            </div>
            <div class="col-sm-6 col-lg-6 mb-3">
                <div class="row">
                    <div class="col-md-12 col-lg-12">
                        <div class="shipping-method-box">
                            <div class="title-left">
                                <h3>Phương thức vận chuyển</h3>
                            </div>
                            <div class="mb-4">
                                <div class="custom-control custom-radio">
                                    <input id="shippingOption1" name="shipping-option" class="custom-control-input"
                                           checked="checked" type="radio" onclick="changePrice()">
                                    <label class="custom-control-label" for="shippingOption1">Giao hàng tiêu
                                        chuẩn</label> <span class="float-right font-weight-bold">25.000 đ</span>
                                </div>
                                <div class="ml-4 mb-2 small">(3-7 ngày làm việc)</div>
                                <div class="custom-control custom-radio">
                                    <input id="shippingOption2" name="shipping-option" class="custom-control-input"
                                           type="radio" onclick="changePrice()">
                                    <label class="custom-control-label" for="shippingOption2">Chuyển phát
                                        nhanh</label>
                                    <span class="float-right font-weight-bold">70.000 đ</span></div>
                                <div class="ml-4 mb-2 small">(2-4 ngày làm việc)</div>
                                <div class="custom-control custom-radio">
                                    <input id="shippingOption3" name="shipping-option" class="custom-control-input"
                                           type="radio" onclick="changePrice()">
                                    <label class="custom-control-label" for="shippingOption3">Ngày làm việc tiếp
                                        theo</label> <span class="float-right font-weight-bold">100.000 đ</span></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12 col-lg-12">
                        <div class="odr-box">
                            <div class="title-left">
                                <h3>Giỏ hàng</h3>
                            </div>
                            <c:set var="totals"/>
                            <div class="rounded p-2 bg-light">
                                <c:forEach items="${cart}" var="item" varStatus="index">
                                    <c:set var="check"
                                           value="${item.getProduct().getDiscountedPrice()==0||item.getProduct().getDiscountedPrice()==item.getProduct().getPrice()}"/>
                                    <c:set var="price" value="0"/>
                                    <c:if test="${check}"><c:set var="price"
                                                                 value="${item.getProduct().getPrice()}"/></c:if>
                                    <c:if test="${!check}"><c:set var="price"
                                                                  value="${item.getProduct().getDiscountedPrice()}"/></c:if>
                                    <div class="media mb-2 border-bottom">
                                        <div class="media-body"><a
                                                href="detail.html"> ${item.getProduct().getName()}</a>
                                            <div class="small text-muted">Price: ${price} <span
                                                    class="mx-2">|</span>
                                                Qty: ${item.getQuantity()}
                                                <span class="mx-2">|</span> Subtotal: ${price * item.getQuantity()}đ
                                                <c:set var="tmp"
                                                       value="${totals = totals + (price * item.getQuantity())}"/>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>

                            </div>
                        </div>
                    </div>
                    <div class="col-md-12 col-lg-12">
                        <div class="order-box">
                            <div class="title-left">
                                <h3>Đơn đặt hàng của bạn</h3>
                            </div>
                            <div class="d-flex">
                                <div class="font-weight-bold">Sản Phẩm</div>
                                <div class="ml-auto font-weight-bold">Tổng</div>
                            </div>
                            <hr class="my-1">
                            <div class="d-flex">
                                <h4>Tổng</h4>
                                <div class="ml-auto font-weight-bold">${totals}</div><div class="font-weight-bold">đ</div>
                            </div>
                            <div class="d-flex">
                                <h4>Chi phí vận chuyển</h4>
                                <div id="ship-cost" class="ml-auto font-weight-bold">25000</div><div class="font-weight-bold">đ</div>
                            </div>
                            <hr>
                            <div class="d-flex gr-total">
                                <h5>Tổng Cộng</h5>
                                <div id="total" class="ml-auto h5"></div><div class="font-weight-bold">đ</div>
                            </div>
                            <hr>
                        </div>
                    </div>
                    <input type="hidden" name="selectedShippingOption" id="selectedShippingOption" value="">

                    <button class="col-12 d-flex shopping-box" style="border: none;background: none;" type="submit">
                        <a
                                class="ml-auto btn hvr-hover">Đặt hàng</a></button>
                </div>
            </div>
        </form>
    </div>
</div>
<script>
    document.getElementById('total').innerHTML = ${totals} + 25000;
    document.getElementById('selectedShippingOption').value = 25000;
    // Example starter JavaScript for disabling form submissions if there are invalid fields
    (function () {
        'use strict';
        window.addEventListener('load', function () {
            let forms = document.getElementsByClassName('needs-validation');
            Array.prototype.filter.call(forms, function (form) {
                form.addEventListener('submit', function (event) {
                    if (form.checkValidity() === false) {
                        event.preventDefault();
                        event.stopPropagation();
                    }
                    form.classList.add('was-validated');
                }, false);
            });
        }, false);
    })();
    //Hàm xử lý giá vận chuuyển khi chọn phương thức vận chuyển
    function changePrice() {
        let price = 0;
        let total = 0;
        let check = false;
        let radios = document.getElementsByName('shipping-option');
        for (let i = 0; i < radios.length; i++) {
            if (radios[i].checked) {
                if (i === 0) {
                    price = 25000;
                } else if (i === 1) {
                    price = 70000;
                } else {
                    price = 100000;
                }
                check = true;
                document.getElementById('selectedShippingOption').value = price;
                break;
            }
        }
        if (check) {
            document.getElementById('ship-cost').innerHTML = price;
            total = ${totals} + price;
            document.getElementById('total').innerHTML = total;
        }
    }
</script>
<!-- End Cart -->
<jsp:include page="footer.jsp"></jsp:include>
