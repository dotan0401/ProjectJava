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

                <!-- End Bradcaump area -->
                <!-- wishlist-area start -->
                <div class="wishlist-area ptb--100 bg__white">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-12 col-sm-12 col-xs-12">
                                <div class="wishlist-content">
                                    <form action="#">
                                        <div class="wishlist-table table-responsive">
                                            <table>
                                                <thead>
                                                    <tr>
                                                        <th class="product-thumbnail">Image</th>
                                                        <th class="product-name"><span class="nobr">Product Name</span></th>
                                                        <th class="product-price"><span class="nobr"> Unit Price </span></th>
                                                        <!--<th class="product-stock-stauts"><span class="nobr"> Stock Status </span></th>-->
                                                        <th class="product-add-to-cart"><span class="nobr">Add To Cart</span></th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                <c:forEach items="${sanPhams}" var="c">
                                                    <tr>
                                                        <td>
                                                            <c:forEach items="${c.anhCollection}" var="itemAnh" varStatus="loop" >
                                                                <c:if test="${loop.count == 1}">                                                                
                                                                    <a href="#"  >
                                                                        <img src="<c:url value="/resources/images/product/${itemAnh.url}"/>" alt="img" style="height: 100px;width: 100px;object-fit: cover;"/>
                                                                    </a>
                                                                </c:if>

                                                            </c:forEach>
                                                        </td>
                                                        <td class="product-name"><a href="#">${c.ten}</a></td>
                                                        <td class="product-price"><span class="amount">${c.donGia}</span></td>
                                                        <!--<td class="product-stock-status"><span class="wishlist-in-stock">In Stock</span></td>-->
                                                        <td class="product-add-to-cart"><a href="/Project4/addToCartWishlist?id=${c.id}"> Add to Cart</a></td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                            <tfoot>
                                                <tr>
                                                    <td colspan="6">
                                                        <div class="wishlist-share">
                                                            <h4 class="wishlist-share-title">Share on:</h4>
                                                            <div class="social-icon">
                                                                <ul>
                                                                    <li><a href="#"><i class="zmdi zmdi-rss"></i></a></li>
                                                                    <li><a href="#"><i class="zmdi zmdi-vimeo"></i></a></li>
                                                                    <li><a href="#"><i class="zmdi zmdi-tumblr"></i></a></li>
                                                                    <li><a href="#"><i class="zmdi zmdi-pinterest"></i></a></li>
                                                                    <li><a href="#"><i class="zmdi zmdi-linkedin"></i></a></li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </tfoot>
                                        </table>
                                    </div>  
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- wishlist-area end -->
            <!-- Start Brand Area -->
            <jsp:include page="Brand.jsp"></jsp:include>
                <!-- End Banner Area -->
                <!-- End Banner Area -->
                <!-- Start Footer Area -->
            <jsp:include page="Footer.jsp"></jsp:include>


    </body>

</html>