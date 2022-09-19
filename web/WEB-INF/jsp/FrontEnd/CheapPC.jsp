<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<section class="ftr__product__area ptb--100">
    <div class="container">
        <div class="row">
            <div class="col-xs-12">
                <div class="section__title--2 text-center">
                    <h2 class="title__line"> PC GIÁ RẺ </h2>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="product__wrap clearfix">
                <!-- Start Single Category -->
                <c:forEach items="${c}" var="c">
                    <div class="col-md-4 col-lg-3 col-sm-4 col-xs-12" >
                        <div class="category" style="border: 1px solid #000000;" >
                            <div class="ht__cat__thumb">
                                <a href="/Project4/productdetails?id=${c.id}">
                                    <c:forEach items="${c.anhCollection}" var="itemAnh">
                                        <img src="<c:url value="/resources/images/product/${itemAnh.url}"/> " alt="product images" 
                                             style="height: 200px;
                                             width: 100%;
                                             object-fit: cover;"/>
                                    </c:forEach>

                                </a>
                            </div>
                            <div class="fr__hover__info">
                                <ul class="product__action">
                                    <li >
                                        <a style="background: yellow;" href="/Project4/cart">
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
            </div>
        </div>
    </div>
</section>