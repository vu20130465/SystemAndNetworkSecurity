<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>

<jsp:include page="header.jsp"></jsp:include>
<!-- Start All Title Box -->
<div class="all-title-box">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <h2>Liên hệ chúng tôi</h2>
                <ul class="breadcrumb">
                    <li class="breadcrumb-item"><a href="home">Trang chủ</a></li>
                    <li class="breadcrumb-item active"> Liên hệ </li>
                </ul>
            </div>
        </div>
    </div>
</div>
<!-- End All Title Box -->

<!-- Start Contact Us  -->
<div class="contact-box-main">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 col-sm-12">
                <div class="contact-form-right">
                    <h2>LIÊN HỆ</h2>
                    <p>Liên hệ với chúng tôi</p>
                    <form id="contactForm">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <input type="text" class="form-control" id="name" name="name" placeholder="Họ và tên" required data-error="Vui lòng nhập tên">
                                    <div class="help-block with-errors"></div>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="form-group">
                                    <input type="text" placeholder="Email" id="email" class="form-control" name="name" required data-error="Vui lòng nhập email">
                                    <div class="help-block with-errors"></div>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="form-group">
                                    <input type="text" class="form-control" id="subject" name="name" placeholder="Chủ đề" required data-error="Vui lòng nhập tiêu đề">
                                    <div class="help-block with-errors"></div>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="form-group">
                                    <textarea class="form-control" id="message" placeholder="Viết gì đó..." rows="4" data-error="Nhập nội dung" required></textarea>
                                    <div class="help-block with-errors"></div>
                                </div>
                                <div class="submit-button text-center">
                                    <button class="btn hvr-hover" id="submit" type="submit">Gửi</button>
                                    <div id="msgSubmit" class="h3 text-center hidden"></div>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <div class="col-lg-4 col-sm-12">
                <div class="contact-info-left">
                    <h2>Thông tin liên hệ</h2>
                    <p>Liên hệ với chúng tôi </p>
                    <ul>
                        <li>
                            <p><i class="fas fa-map-marker-alt"></i>Địa chỉ: Trường Đại học Nông Lâm TPHCM</p>
                        </li>
                        <li>
                            <p><i class="fas fa-phone-square"></i>Điện thoại: <a href="tel:19005555">1900 5555</a></p>
                        </li>
                        <li>
                            <p><i class="fas fa-envelope"></i>Email: <a href="mailto:nguyenvana@gmail.com">nguyenvana@gmail.com</a></p>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- End Cart -->
<jsp:include page="footer.jsp"></jsp:include>
