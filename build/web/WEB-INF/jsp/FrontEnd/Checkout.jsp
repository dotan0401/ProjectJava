<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html class="no-js" lang="en">
    <jsp:include page="Header.jsp"></jsp:include>

        <body>
            <!--[if lt IE 8]>
                <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
            <![endif]-->  

            <!-- Body main wrapper start -->
            <div class="wrapper">
                <!-- Start Header Style -->
            <jsp:include page="Menu.jsp"></jsp:include>
                <!-- End Header Area -->
                <div class="body__overlay"></div>
                <!-- Start Offset Wrapper -->
                <div class="offset__wrapper">
                    <!-- Start Search Popap -->
                <jsp:include page="Search.jsp"></jsp:include>

                </div>

                <div class="checkout-wrap ptb--100">
                    <div class="container">
                        <form action="/Project4/setCheckout" method="POST" >
                            <div class="row">
                                <div class="col-md-8">
                                    <div class="checkout__inner">
                                        <div class="accordion-list">
                                            <div class="accordion">

                                                <div class="accordion__title">
                                                    Thông tin khách hàng
                                                </div>
                                                <div class="accordion__body">
                                                    <div class="bilinfo">
                                                        <div class="row">
                                                            <div class="col-md-12">
                                                                <div class="single-input">
                                                                    <h3 class="shipinfo__title">Tên khách hàng</h3>
                                                                    <input type="text" placeholder="Họ và Tên" name="tenNguoiNhan" value="${nd.hoTen}">
                                                            </div>
                                                        </div>
                                                        <div class="col-md-12">
                                                            <div class="single-input">
                                                                <h3 class="shipinfo__title">Số điện thoại</h3>

                                                                <input type="text" placeholder="Số điện thoại" value="${nd.sdt}" name="sDTNguoiNhan">
                                                            </div>
                                                        </div>
                                                        <div class="col-md-12">
                                                            <div class="single-input">
                                                                <h3 class="shipinfo__title">Ghi chú</h3>
                                                                <input type="text" placeholder="Ghi chú" name="ghichu" name="ghiChu" >
                                                            </div>
                                                        </div>

                                                        <div class="col-md-12">
                                                            <div class="single-input">
                                                                <h3 class="shipinfo__title">ĐỊA CHỈ GIAO HÀNG</h3>
                                                                <input type="text" placeholder="Địa chỉ" value="${nd.diaChi}" name="diaChiNhan">
                                                            </div>
                                                        </div>
                                                        <div class="col-md-12">
                                                            <div class="single-input">
                                                                <a href="#" class="ship-to-another-trigger"><i class="zmdi zmdi-long-arrow-right"></i>Gửi đến địa chỉ khác</a>
                                                                <div class="ship-to-another-content">
                                                                    <div class="row">
                                                                        <div class="col-md-12">
                                                                            <div class="single-input">
                                                                                <input type="text" placeholder="Nhập địa chỉ" name="diaChiKhac">
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="order-details">
                                    <h5 class="order-details__title">Đơn hàng của bạn</h5>
                                    <c:forEach items="${cart}" var="cart">
                                        <div class="order-details__item">
                                            <div class="single-item">
                                                <div class="single-item__thumb">
                                                    <c:forEach items="${cart.sanPham.anhCollection}" var="itemAnh">
                                                        <a href="#">
                                                            <img src="<c:url value="/resources/images/product/${itemAnh.url}"/>" alt="img" style="height: 50px;width: 100px;object-fit: cover;"/>
                                                        </a>
                                                    </c:forEach>
                                                </div>
                                                <div class="single-item__content">
                                                    <a href="#">${cart.sanPham.ten}</a>
                                                    <span class="price">
                                                        <fmt:formatNumber type="number" maxFractionDigits = "3" value=" ${cart.price}"/> đ
                                                    </span>
                                                    <div style="display: flex; ">
                                                        <p>Số lượng</p>
                                                        <span class="price" style="padding: 0 0 0 15px;">${cart.quantity}</span>
                                                    </div>
                                                </div>
<!--                                                <div class="single-item__remove">
                                                    <a href="/Project4/checkout?id=${cart.sanPham.id}" onclick="return confirm('Bạn muốn xóa không!')">
                                                        <i class="zmdi zmdi-delete"></i>
                                                    </a>
                                                </div>-->
                                            </div>

                                        </div>
                                    </c:forEach>
                                    <div class="ordre-details__total" style="padding: 15px 0;">
                                        <p>Tổng số lượng <b>${totalQuan}</b></p>
                                    </div>
                                    <div class="ordre-details__total">
                                        <h5>Tổng tiền </h5>
                                        <fmt:formatNumber type = "number" maxFractionDigits = "3" value="${total}" /> đ
                                    </div>
                                    <ul class="payment__btn">
                                        <li class="active">
                                            <button style="width: 100%;" type="submit">Đặt hàng</button>
                                        </li>

                                    </ul>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>

            <jsp:include page="Brand.jsp"></jsp:include>

            <jsp:include page="Footer.jsp"></jsp:include>

    </body>

</html>