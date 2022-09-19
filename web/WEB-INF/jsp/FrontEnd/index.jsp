<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html class="no-js" lang="en">
    <jsp:include page="Header.jsp"></jsp:include>
        <body>
           
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
                                            <img src="<c:url value="/resources/images/product-2/sm-smg/1.jpg"/>" alt="product images">
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

                        </div>
                        <ul class="shoping__total">
                            <li class="subtotal">Subtotal:</li>
                            <li class="total__price">$130.00</li>
                        </ul>
                        <ul class="shopping__btn">
                            <li><a href="/Project4/cart">View Cart</a></li>
                            <li class="shp__checkout"><a href="checkout.html">Checkout</a></li>
                        </ul>
                    </div>
                </div>
                <!-- End Cart Panel -->
            </div>
            <!-- End Offset Wrapper -->
            <!-- Start Slider Area -->
            <jsp:include page="Slider.jsp"></jsp:include>

                <!-- Start Slider Area -->
                <!-- Start Category Area -->


            <jsp:include page="Product.jsp"></jsp:include>

        
            <%--<jsp:include page="CheapPC.jsp"></jsp:include>--%>
               
            <jsp:include page="Brand.jsp"></jsp:include>

            <jsp:include page="Footer.jsp"></jsp:include>



    </body>

</html>