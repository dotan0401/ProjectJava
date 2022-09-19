<!DOCTYPE html>
<html lang="en">
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%@page contentType="text/html" pageEncoding="UTF-8"%>
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
    <style>
        *{
            box-sizing: border-box;
            padding: 0;
            margin: 0;
        }   


        .sponsor_img img{
            width: 100%;
            height: 100%;
            object-fit: cover;

        }

        /* .sponsor_container{
            display: grid;
            grid-template-columns: repeat(4 ,1fr);
            grid-gap: 20px;
        } */
        .slick-prev{
            position: absolute;
            top: 50%;
            left: 0;
            transform: translateY(-50%);
            z-index: 2;
        } 
        .slick-next{
            position: absolute;
            top: 50%;
            right: 0;
            transform: translateY(-50%);
            z-index: 2;
        } 

        .slick-dots{
            position: absolute;
            bottom: 0;
            left: 50%;
            transform: translate(-50%, 0px);
            display: flex !important;
            align-items: center;
            justify-content: center;
            gap: 0 20px;
        }

        .slick-dots button{
            font-size: 0;
            width: 15px;
            height: 15px;
            border-radius: 50%;
            background-color: #fff;
            border: none;
            outline: none;
        }
        .slick-dots .slick-active button{
            background-color: red;
        }


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
    </style>
    <body>
        <section class="htc__product__area--2 pb--100 product-details-res">
            <div class="container">
                <div class="row">
                    <div class="col-xs-12">
                        <div class="section__title--2 text-center">
                            <h2 class="title__line " style="padding: 30px;">Sản phẩm liên quan</h2>
                        </div>
                    </div>
                </div>

                <section class="sponsor section">
                    <div class="sponsor_container">
                        <c:forEach items="${s}" var="c">
                            <div class="category" style="border: 1px solid #000000; background: #f8f9fa; margin:  0 15px;">
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
                                            <a style="background: yellow;" href="">
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
                        </c:forEach>
                    </div>
                </section>
            </div>
        </section >
        <script type="text/javascript" src="https://code.jquery.com/jquery-1.11.0.min.js"></script>
        <script type="text/javascript" src="https://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
        <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
        <script>

            $(document).ready(function () {
                $(".sponsor_container").slick({
                    infinite: true, // chay vo tan
                    slidesToShow: 5, //so phan tu muon hien
                    slidesToScroll: 1, // so luong dich chuyen
                    arrows: true, // tat mui ten 2 ben
                    autoplay: true, // tu dong chay
                    autoplaySpeed: 1000,
                    dots: false, //dau cham o duoi
                    responsive: [
                        {
                            breakpoint: 1025,
                            settings: {
                                slidesToShow: 3,
                            }
                        },
                        {
                            breakpoint: 480,
                            settings: {
                                slidesToShow: 1,
                                autoplay: false,
                                arrows: false,
                                infinite: false,
                            },
                        },
                    ]
                });
            });

        </script>
    </body>