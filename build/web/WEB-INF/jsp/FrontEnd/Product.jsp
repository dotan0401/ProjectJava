<%-- 
    Document   : Product
    Created on : Jul 28, 2022, 3:38:48 PM
    Author     : bahop
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!doctype html>
<html class="no-js" lang="zxx">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Product Grid || Asbab - eCommerce HTML5 Template</title>
        <style>
            .product{
                text-align: left;
                margin: 15px 0 0 0 ;
            }
            .listsup {
                display: block;
                display: -webkit-box;
                -webkit-line-clamp: 1;  
                -webkit-box-orient: vertical;
                overflow: hidden;
                text-overflow: ellipsis;
            }
            .lispPro{
                /*margin-left: 30px;*/
                display: grid;
                grid-template-columns: 2fr 4fr;
                line-height: 27px;
            }
            .lispPro td{
                padding:  0 15px 0 15px;

            }
            .ht__select1 {
                background: #f7f6f8; ; padding: 10px; color: #fff; cursor: pointer; border-radius: 40px; margin: 0 10px;
            }
            .ht__select1:hover{
                background: #DDDDDD;
            }
            .item{
                display: flex;
                align-items: center;
            }
            .option{
                background: red;
            }
            .ht__select option{
                background: red;
                padding: 15px;
            }
            .leaderboard {
                max-width: 490px;
                width: 100%;
                border-radius: 12px;
                margin-bottom: 15px;
            }
            .leaderboard header {
                --start: 15%;
                height: 130px;
                background-image: repeating-radial-gradient(circle at var(--start), transparent 0%, transparent 10%, rgba(54, 89, 219, 0.33) 10%, rgba(54, 89, 219, 0.33) 17%), linear-gradient(to right, #5b7cfa, #3659db);
                color: #fff;
                position: relative;
                border-radius: 12px 12px 0 0;
                overflow: hidden;
            }
            .leaderboard header .leaderboard__title {
                position: absolute;
                z-index: 2;
                top: 50%;
                right: calc(var(--start) * 0.75);
                transform: translateY(-50%);
                text-transform: uppercase;
                margin: 0;
            }
            .leaderboard header .leaderboard__title span {
                display: block;
            }
            .leaderboard header .leaderboard__title--top {
                font-size: 24px;
                font-weight: 700;
                letter-spacing: 6.5px;
            }
            .leaderboard header .leaderboard__title--bottom {
                font-size: 13px;
                font-weight: 500;
                letter-spacing: 3.55px;
                opacity: 0.65;
                transform: translateY(-2px);
            }
            .leaderboard header .leaderboard__icon {
                fill: #fff;
                opacity: 0.35;
                width: 50px;
                position: absolute;
                top: 50%;
                left: var(--start);
                transform: translate(-50%, -50%);
            }

            .leaderboard__profile {
                display: grid;
                grid-template-columns: 1fr 3fr 1fr;
                align-items: center;
                padding: 10px 30px 10px 10px;
                overflow: hidden;
                border-radius: 10px;
                box-shadow: 0 5px 7px -1px rgba(51, 51, 51, 0.23);
                cursor: pointer;
                transition: transform 0.25s cubic-bezier(0.7, 0.98, 0.86, 0.98), box-shadow 0.25s cubic-bezier(0.7, 0.98, 0.86, 0.98);
                background-color: #fff;
            }
            .leaderboard__profile:hover {
                transform: scale(1.2);
                box-shadow: 0 9px 47px 0px rgba(51, 51, 51, 0.18);
            }
            .leaderboard__picture {
                max-width: 100%;
                width: 60px;
                border-radius: 50%;
                box-shadow: 0 0 0 10px #ebeef3, 0 0 0 22px #f3f4f6;
            }
            .leaderboard__name {
                color: #979cb0;
                font-weight: 600;
                font-size: 20px;
                letter-spacing: 0.64px;
                margin-left: 12px;
            }
            .leaderboard__value {
                color: #35d8ac;
                font-weight: 700;
                font-size: 34px;
                text-align: right;
            }
            .leaderboard__value > span {
                opacity: 0.8;
                font-weight: 600;
                font-size: 13px;
                margin-left: 3px;
            }
            .list-group-item-action{
                width: 200px;
                margin:  10px 0;           

            }

        </style>
    </head>
    <body>
        <section class="htc__product__grid bg__white ptb--100">
            <div class="container">
                <div class="row">
                    <div class="col-lg-9 col-lg-push-3 col-md-9 col-md-push-3 col-sm-12 col-xs-12">
                        <div class="htc__product__rightidebar">
                            <div class="htc__grid__top">
                                <div class="htc__select__option" style="margin-bottom: 50px;">
                                    <div class="item">Sắp xếp theo :</div>
                                    <!--                                    <div class="ht__select1">
                                                                            <a href="">Mới nhất</a> 
                                                                        </div>-->
                                    <div class="ht__select1 ">
                                        <a href="/Project4/tangDan" >Giá tăng dần </a> 
                                    </div>
                                    <div class="ht__select1">
                                        <a href="/Project4/giamDan" >Giá giảm dần </a> 
                                    </div>
                                </div>


                            </div>
                            <!-- Start Product View -->
                            <div class="row">
                                <div class="shop__grid__view__wrap">
                                    <div role="tabpanel" id="grid-view" class="single-grid-view tab-pane fade in active clearfix">
                                        <!-- Start Single Product -->
                                        <c:forEach items="${c}" var="c">
                                            <div class="col-md-4 col-lg-4 col-sm-6 col-xs-12" >
                                                <div class="category" style="border: 1px solid #000000; background: #f8f9fa;">
                                                    <div class="ht__cat__thumb">
                                                        <a href="/Project4/productdetails?id=${c.id}&${c.maHangSanXuat.id}">
                                                            <c:forEach items="${c.anhCollection}" var="itemAnh" varStatus="ingPro">
                                                                <c:if test="${ingPro.count == 1}">
                                                                    <img src="<c:url value="/resources/images/product/${itemAnh.url}"/> " alt="product images" 
                                                                         style="height: 200px;
                                                                         width: 100%;
                                                                         object-fit: cover;"/>
                                                                </c:if>

                                                            </c:forEach>

                                                        </a>
                                                    </div>
                                                    <div class="fr__hover__info">
                                                        <ul class="product__action">
                                                            <li>
                                                                <a style="background: yellow;" href="<c:url value="/addToCart?id=${c.id}"/>">
                                                                    <i style="color: #000000" class="icon-handbag icons"></i>
                                                                </a>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                    <div class="fr__product__inner">
                                                        <h4><a href="/Project4/productdetails?id=${c.id}">${c.ten}</a></h4>
                                                        <div class="product">
                                                            <table >
                                                                <tbody class="proList">
                                                                    <tr class="lispPro">
                                                                        <td>CPU:</td>
                                                                        <td class="listsup">${c.cpu}</td>
                                                                    </tr>
                                                                    <tr class="lispPro">
                                                                        <td>RAM:</td>
                                                                        <td class="listsup">${c.ram}</td>
                                                                    </tr>
                                                                    <tr class="lispPro">
                                                                        <td>Ổ Cứng:</td>
                                                                        <td class="listsup">${c.hdd}</td>
                                                                    </tr>
                                                                    <tr class="lispPro">
                                                                        <td>Card:</td>
                                                                        <td class="listsup">${c.vga}</td>
                                                                    </tr>
                                                                    <tr class="lispPro">
                                                                        <td>M.Hình:</td>
                                                                        <td class="listsup">${c.manHinh}</td>
                                                                    </tr>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                        <div style="text-decoration: line-through;">
                                                            <fmt:formatNumber type = "number" maxFractionDigits = "3" value="${c.donViBan}" />đ
                                                        </div>
                                                        <div style="font-size: 15px ; padding: 10px ; border-radius: 10px;background-color: #ff9300; margin: 0 33px; color: #fff ; margin-bottom: 15px" >  
                                                            <fmt:formatNumber type = "number" maxFractionDigits = "3" value="${c.donGia}" /> đ
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                        </c:forEach>

                                        <!-- End Single Product -->
                                    </div>

                                </div>
                            </div>
                            <!-- End Product View -->
                        </div>
                        <!-- Start Pagenation -->
                        <div class="row">
                            <div class="col-xs-12">
                                <%--<c:set var="page" value="${page}" />--%>
                                <ul class="htc__pagenation">
                                    <li><a href="#"><i class="zmdi zmdi-chevron-left"></i></a></li> 
                                            <c:forEach begin="1" end="${num}" var="i"> 
                                        <li class=""><a href="/Project4?page=${i}">${i}</a></li>   
                                        </c:forEach>

                                    <li><a href="#"><i class="zmdi zmdi-chevron-right"></i></a></li> 
                                </ul>
                            </div>
                        </div>
                        <!-- End Pagenation -->
                    </div>
                    <div class="col-lg-3 col-lg-pull-9 col-md-3 col-md-pull-9 col-sm-12 col-xs-12 smt-40 xmt-40">
                        <div class="htc__product__leftsidebar">
                            <!-- Start Prize Range -->
                            <div class="htc-grid-range">
                                <h4 class="title__line--4">Price</h4>
                                <div class="content-shopby">
                                    <div class="price_filter s-filter clear">
                                        <form action="/Project4/filter" method="GET">
                                            <div id="slider-range"></div>
                                            <div class="slider__range--output">
                                                <div class="price__output--wrap">
                                                    <div class="price--output">
                                                        <span>Price :</span>
                                                        <input type="text" id="amount" readonly name="filterPrice">
                                                    </div>
                                                    <div class="price--filter">
                                                        <button type="submit">Filter</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            <!-- End Prize Range -->
                            <!-- Start Category Area -->
                            <div class="htc__category">
                                <h4 class="title__line--4">Hãng sản xuất</h4>
                                <div class="htc__select__option HSX1">

                                    <!--                                    <form action="/Project4/searchId" id="f1" style="width: 100%;">
                                                                            <select class="ht__select" name="key" onchange="change()">
                                                                                <option  value="0">All</option>
                                    <c:forEach items="${hsx}" var="c">
                                        <option  value="${c.id}" href="hangSanXuat?id=${c.id}">${c.ten}</option>
                                    </c:forEach>
                                </select>
                            </form>-->
                                    <div class="list-group">
                                        <a href="/Project4"  class=" leaderboard__profile list-group-item list-group-item-action ">All</a>
                                        <c:forEach items="${hsx}" var="c">
                                            <!--                                            <div class="leaderboard">
                                                                                            <div class="leaderboard__profile ">-->
                                            <!--<img src="https://randomuser.me/api/portraits/men/32.jpg" alt="Mark Zuckerberg" class="leaderboard__picture">-->
                                            <a href="/Project4/hangSX?id=${c.id}"  class=" leaderboard__profile list-group-item list-group-item-action ${tag == c.id ? "active" : ""}">${c.ten}</a>
                                            <!--                                                </div>
                                                                                        </div>-->
                                        </c:forEach>
                                    </div>

                                </div>



                            </div>




                            <!-- End Category Area -->

                        </div>
                    </div>
                </div>
        </section>
        <script type="text/javascript">
            function change() {
                document.getElementById("f1").submit();
            }

//            function addTocart(id) {
////                alert();
//                $.post("addToCart", {
//                    id: id
//                }, function (data, status) {
//                    alert(data);
//                });
//            }

        </script>
    </body>

</html>
