<%-- 
    Document   : Cart
    Created on : Jul 28, 2022, 10:29:44 PM
    Author     : bahop
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!doctype html>
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
                    <!-- End Search Popap -->
                    <!-- Start Cart Panel -->
                    <div class="shopping__cart">
                        <div class="shopping__cart__inner">
                            <div class="offsetmenu__close__btn">
                                <a href="#"><i class="zmdi zmdi-close"></i></a>
                            </div>
                            <div class="shp__cart__wrap">
                                <div class="shp__single__product">
                                    <div class="shp__pro__thumb">
                                        <a href="#">
                                            <img src="images/product-2/sm-smg/1.jpg" alt="product images">
                                        </a>
                                    </div>
                                    <div class="shp__pro__details">
                                        <h2><a href="product-details.html">BO&Play Wireless Speaker</a></h2>
                                        <span class="quantity">QTY: 1</span>
                                        <span class="shp__price">$105.00</span>
                                    </div>
                                    <div class="remove__btn">
                                        <a href="#" title="Remove this item"><i class="zmdi zmdi-close"></i></a>
                                    </div>
                                </div>
                                <div class="shp__single__product">
                                    <div class="shp__pro__thumb">
                                        <a href="#">
                                            <img src="images/product-2/sm-smg/2.jpg" alt="product images">
                                        </a>
                                    </div>
                                    <div class="shp__pro__details">
                                        <h2><a href="product-details.html">Brone Candle</a></h2>
                                        <span class="quantity">QTY: 1</span>
                                        <span class="shp__price">$25.00</span>
                                    </div>
                                    <div class="remove__btn">
                                        <a href="#" title="Remove this item"><i class="zmdi zmdi-close"></i></a>
                                    </div>
                                </div>
                            </div>
                            <ul class="shoping__total">
                                <li class="subtotal">Subtotal:</li>
                                <li class="total__price">$130.00</li>
                            </ul>
                            <ul class="shopping__btn">
                                <li><a href="cart.html">View Cart</a></li>
                                <li class="shp__checkout"><a href="checkout.html">Checkout</a></li>
                            </ul>
                        </div>
                    </div>
                    <!-- End Cart Panel -->
                </div>
                <!-- End Offset Wrapper -->
                <!-- Start Bradcaump area -->
<!--                <div class="ht__bradcaump__area" style="background: rgba(0, 0, 0, 0) url(<c:url value="/resources/images/bg/4.jpg"/>) no-repeat scroll center center / cover ;">
                <div class="ht__bradcaump__wrap">
                    <div class="container">
                        <div class="row">
                            <div class="col-xs-12">
                                <div class="bradcaump__inner">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>-->
            </div>
            <!-- End Bradcaump area -->
            <!-- cart-main-area start -->
            <jsp:include page="CartItem.jsp"></jsp:include>

            <jsp:include page="Brand.jsp"></jsp:include>
                <!-- End Banner Area -->
                <!-- End Banner Area -->
                <!-- Start Footer Area -->

                <!-- End Footer Style -->
            </div>
            <!-- Body main wrapper end -->

            <!-- Placed js at the end of the document so the pages load faster -->

            <!-- jquery latest version -->
        <jsp:include page="Footer.jsp"></jsp:include>

    </body>

</html>
