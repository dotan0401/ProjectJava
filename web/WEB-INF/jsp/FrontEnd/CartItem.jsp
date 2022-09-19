<%@page import="java.util.List"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="cart-main-area ptb--100 bg__white">
    <div class="container">
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <form action="#" method="post">               
                    <div class="table-content table-responsive">
                        <table>
                            <thead>
                                <tr>
                                    <th class="product-thumbnail">Ảnh</th>
                                    <th class="product-name">Tên Sản Phẩm</th>
                                    <th class="product-price">Giá</th>
                                    <th class="product-quantity">Số Lượng</th>
                                    <th class="product-subtotal">Tổng</th>
                                    <th class="product-remove">Xóa</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${cart}" var="cart">
                                    <tr>
                                        <td class="product-thumbnail">
                                            <c:forEach items="${cart.sanPham.anhCollection}" var="itemAnh" varStatus="imgPro">
                                                <c:if test="${imgPro.count == 1}">
                                                    <a href="#">
                                                        <img src="<c:url value="/resources/images/product/${itemAnh.url}"/>" alt="img" style="height: 100px;width: 100px;object-fit: cover;"/>
                                                    </a
                                                </c:if>
                                            </c:forEach>
                                        </td>
                                        <td class="product-name"><a href="#">${cart.sanPham.ten}</a></td>
                                        <td class="product-price">
                                            <span class="amount">
                                                <fmt:formatNumber type="number" maxFractionDigits = "3" value="${cart.sanPham.donGia}"/> đ
                                            </span>
                                        </td>
                                        <td class="product-quantity">
                                            <!--                                            <span class="input-group-btn">
                                                                                            <a href="quantity_load?actionQuan=1&quantity=${cart.quantity}&sanphamId=${cart.sanPham.id}" type="button" class="btn" data-type="minus">
                                                                                                <i class="fas fa-minus"></i>
                                                                                            </a>
                                                                                        </span>-->
                                            <input  type="text" min="1" name="soluong" id="soluong"  value="${cart.quantity}" />
                                            <!--                                            <span class="input-group-btn">
                                                                                            <a href="quantity_load?actionQuan=2&quantity=${cart.quantity}&sanphamId=${cart.sanPham.id}" type="button" class="btn" data-type="plus" >
                                                                                                <i class="fas fa-plus"></i>
                                                                                            </a>
                                                                                        </span>-->
                                        </td>
                                        <td class="product-subtotal">
                                            <fmt:formatNumber type="number" maxFractionDigits = "3" value=" ${cart.quantity * cart.price}"/> đ
                                        </td>
                                        <td class="product-remove">
                                            <a href="/Project4/delete?id=${cart.sanPham.id}" onclick="return confirm('Bạn muốn xóa không ?')">
                                                <i class="icon-trash icons"></i>
                                            </a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>

                        </table>
                    </div>
                    <div class="row">
                        <div class="col-md-12 col-sm-12 col-xs-12">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6 col-sm-12 col-xs-12">

                        </div>
                        <div class="col-md-6 col-sm-12 col-xs-12 smt-40 xmt-40">
                            <div class="htc__cart__total">

                                <div><p  style="color: red;">${ccs}</p></div>
                                <div class="" style="padding: 15px 0;">
                                    <div class="cart__total">
                                        <span>Tổng số lượng :</span>
                                        <fmt:formatNumber type="number"  maxFractionDigits = "3" value="${totalQuan}"/> 
                                    </div>


                                </div>
                                <div class="cart__total">
                                    <span>Tổng tiền</span>
                                    <fmt:formatNumber type="number"  maxFractionDigits = "3" value="${total}"/> đ
                                </div>
                                <ul class="payment__btn">
                                    <li class="active"><a href="/Project4/checkout">Thanh toán</a></li>
                                    <li><a href="/Project4">Tiếp tục mua sắm</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>

                </form> 
            </div>
        </div>
    </div>
</div>

