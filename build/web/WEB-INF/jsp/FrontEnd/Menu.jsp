<%-- 
    Document   : Menu
    Created on : Jul 28, 2022, 3:37:18 PM
    Author     : bahop
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<style>
    .dropdown-item{
        display: block;
        width: 100%;
        padding: 0.25rem 1.5rem;
        clear: both;
        font-weight: 300;
        color: #3a3b45;
        text-align: inherit;
        white-space: nowrap;
        background-color: transparent;
        border: 0;
        color: #000;
    }
    .nav-item{
        transform: translate3d(16px, 12px, 0px);
    }
    .dropdown-menu a{ 
        font-size: 15px;
        position: relative;

    }
    .dropdown-menu a:hover{
        background: #f8f9fc;
    }
    .dropdown-divider{
        height: 0;
        margin: 0.5rem 0;
        overflow: hidden;
        border-top: 1px solid #eaecf4;
    }
    .img-profile {
        border-radius: 50%;width: 40px;height: 40px; margin-left: 25px; background: #898989;
    }
    .htc__header__area{
        border-bottom: 1px solid;
    }
</style>
<header id="htc__header" class="htc__header__area header--one">
    <!-- Start Mainmenu Area -->
    <div id="sticky-header-with-topbar" class="mainmenu__wrap sticky__header" style="background: #fff;">
        <div class="container">
            <div class="row">
                <div class="menumenu__container clearfix">
                    <div class="col-lg-2 col-md-2 col-sm-3 col-xs-5"> 
                        <div class="logo" style="width: 65px;">
                            <a href="">
                                <img src="<c:url value="/resources/images/logo/logo1.png"/>" alt="logo images">
                            </a>
                        </div>
                    </div>
                    <div class="col-md-7 ">
                        <nav class="main__menu__nav hidden-xs hidden-sm">
                            <ul class="main__menu">
                                <li class="drop"><a href="/Project4">Home</a></li>
                                <li class="drop"><a href="#">Pages</a>
                                    <ul class="dropdown">
                                        <li><a href="/Project4/cart">Cart page</a></li>
                                        <li><a href="/Project4/checkout">checkout</a></li>
                                        <li><a href="/Project4/wishlist">wishlist</a></li>
                                        <li><a href="/Project4/contact">contact</a></li>

                                    </ul>
                                </li>
                                <li class="drop">
                                    <a href="">Cart</a>
                                    <ul class="dropdown">
                                        <li><a href="/Project4/cart">Cart</a></li>
                                        <li><a href="/Project4/checkout">checkout</a></li>
                                        <li><a href="/Project4/wishlist">Wishlist</a></li>
                                    </ul>
                                </li>

                                <li><a href="/Project4/contact">contact</a></li>
                            </ul>
                        </nav>

                        <div class="mobile-menu clearfix visible-xs visible-sm">
                            <nav id="mobile_dropdown">
                                <ul>
                                    <li><a href="/Project4">Home</a></li>
                                    <li><a href="#">pages</a>
                                        <ul>
                                            <li><a href="/Project4/cart">Cart page</a></li>
                                            <li><a href="/Project4/checkout">checkout</a></li>
                                            <li><a href="/Project4/wishlist">wishlist</a></li>
                                            <li><a href="/Project4/contact">contact</a></li>

                                        </ul>
                                    </li>
                                    <li class="drop">
                                        <a href="">Cart</a>
                                        <ul class="dropdown">
                                            <li><a href="/Project4/cart">Cart</a></li>
                                            <li><a href="/Project4/checkout">checkout</a></li>
                                            <li><a href="/Project4/wishlist">Wishlist</a></li>
                                        </ul>
                                    </li>

                                    <li><a href="/Project4/contact">contact</a></li>
                                </ul>
                            </nav>
                        </div>  
                    </div>
                    <div class="col-md-3">
                        <div class="header__right" style="padding: 0;">
                            <div class="header__search search search__open">
                                <a href="#">
                                    <i class="icon-magnifier icons"></i>
                                </a>
                            </div>
                            <div class="htc__shopping__cart">
                                <a  href="/Project4/cart"><i class="icon-handbag icons"></i></a>
                                <a href="/Project4/cart" name="num" >
                                    <span class="htc__qua" >${cart.size() > 0 ? cart.size() : 0}</span>
                                </a>
                            </div>

                            <div class="header__account" >
                                <%-- <c:if test="${email == null }">--%>
                                <a ${hoten== null ? "show" : "hidden"}   href="<c:url value="/login"/>">
                                    <i class="icon-user icons"></i>
                                </a>
                                <%--</c:if>--%>

                            </div>
                            <div  class="nav-item dropdown" style="z-index: 5000;">
                                <%-- <c:if test="${email != null }">--%>
                                <a   class="nav-link dropdown-toggle" href="" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <!--<img class="img-profile  rounded-circle" src="<c:url value="/resources/images/nguoidung/${anh}"/>" ${anh != null ? "show" : "hidden"}>-->
                                    <p  >${hoten}</p>

                                </a>
                               

<!--                                                <a ${anh == null ? "show" : "hidden"}>
        <img class="img-profile  rounded-circle" src="<c:url value="/resources/images/nguoidung/macdinh.png"/>">
    </a>-->
                                <%--   </c:if>--%>
                                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink">
                                    <a class="dropdown-item" style="" href="/Project4/profile">
                                        Profile
                                    </a>
                                    <a class="dropdown-item" href="#">
                                        Settings
                                    </a>
                                    <a class="dropdown-item" href="<c:url value="/logout"/>">
                                        Log Out
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="mobile-menu-area"></div>
    </div>
</div>
<!-- End Mainmenu Area -->
</header>
