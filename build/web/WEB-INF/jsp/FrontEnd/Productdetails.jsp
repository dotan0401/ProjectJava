<%-- 
    Document   : Product_details
    Created on : Jul 28, 2022, 10:17:47 PM
    Author     : bahop
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html class="no-js" lang="zxx">
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


            </div>
            <!-- End Bradcaump area -->
            <!-- Start Product Details Area -->
            <section class="htc__product__details bg__white ptb--100">
                <!-- Start Product Details Top -->
                <div class="htc__product__details__top">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-5 " style="border: 1px solid #000000">
                                <div class="htc__product__details__tab__content">
                                    <!-- Start Product Big Images -->
                                    <div class="product__big__images">
                                        <div class="portfolio-full-image tab-content" >
                                        <c:forEach items="${c.anhCollection}" var="itemAnh" varStatus="listImg">
                                            <div role="tabpanel" class="tab-pane fade ${listImg.count==1? " in active" : "" } " id="img-tab-${listImg.count}">
                                                <img src="<c:url value="/resources/images/product/${itemAnh.url}"/>" alt="full-image">
                                            </div>
                                        </c:forEach>

                                    </div>
                                </div>
                                <!-- End Product Big Images -->
                                <!-- Start Small images -->


                                <ul class="product__small__images" role="tablist">
                                    <c:forEach items="${c.anhCollection}" var="itemAnh" varStatus="listImg">
                                        <li role="presentation" class="pot-small-img ${listImg.count==1? "active" : "" } " >
                                            <a href="#img-tab-${listImg.count}" role="tab" data-toggle="tab ">
                                                <img src="<c:url value="/resources/images/product/${itemAnh.url}"/>" alt="small-image">
                                            </a>
                                        </li>
                                    </c:forEach>


                                </ul>


                            </div>
                        </div>
                        <div class="col-md-7 ">
                            <div class="ht__product__dtl">
                                <h2>${c.ten}</h2>
                                <div class="ht__pro__desc">
                                    <li style="color: red ; font-size: 23px">
                                        <fmt:formatNumber type="number" value="${c.donGia}" />??
                                    </li>

                                    <div class="sin__desc align--left">
                                        <p><span>Gi?? g???c : </span></p>
                                        <ul class="pro__cat__list">
                                            <div style="text-decoration: line-through;">
                                                <fmt:formatNumber type = "number" maxFractionDigits = "3" value="${c.donViBan}" />??
                                            </div>
                                        </ul>
                                    </div>

                                    <div class="content">

                                        <table class="table table-striped table-bordered" style="height: 383px;" width="449">
                                            <tbody>
                                                <tr>
                                                    <td scope="row" style="width:  28%"><strong>CPU</strong></td>
                                                    <td scope="row">${c.cpu}</td>
                                                </tr>
                                                <tr>
                                                    <td scope="row"><strong>RAM</strong></td>
                                                    <td scope="row">${c.ram}</td>
                                                </tr>
                                                <tr>
                                                    <td scope="row"><strong>??? c???ng</strong></td>
                                                    <td scope="row">${c.hdd}</td>
                                                </tr>
                                                <tr>
                                                    <td scope="row"><strong>Card VGA</strong></td>
                                                    <td scope="row">${c.vga}</td>
                                                </tr>
                                                <tr>
                                                    <td scope="row"><strong>M??n h??nh</strong></td>
                                                    <td scope="row">${c.manHinh}</td>
                                                </tr>
                                                <tr>
                                                    <td scope="row"><strong>LED ph??m</strong></td>
                                                    <td scope="row">${c.banPhim}</td>
                                                </tr>
                                                <tr>
                                                    <td scope="row">
                                                        <p><strong>C???ng K???t N???i</strong></p>
                                                    </td>
                                                    <td scope="row">${c.congGiaoTiep}</td>
                                                </tr>
                                                <tr>
                                                    <td scope="row"><strong>Tr???ng l?????ng</strong></td>
                                                    <td scope="row">${c.trongLuong} kg</td>
                                                </tr>
                                                <tr>
                                                    <td scope="row"><strong>Pin</strong></td>
                                                    <td scope="row">${c.dungLuongPin}</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>

                                <div class="cr__btn" style="padding-right:  15px;">
                                    <a href="<c:url value="/addToCart?id=${c.id}"/>">Mua H??ng</a>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
                <!-- End Product Details Top -->
        </section>

        <section class="htc__blog__area bg__white">
            <div class="container">
                <div class="row">
                    <div class="ht__blog__wrap blog--page clearfix">
                        <!-- Start Single Blog -->
                        <div class="col-md-8 " style="border: 1px solid saddlebrown; border-radius: 20px; height: 383px">
                            <div class="blog">
                                <h2>Th??ng tin n???i b???t</h2>
                                <p>??? ${c.thietKe}</p>
                                <p>??? ${c.thongTinChung}</p>
                            </div>
                        </div>
                        <div class="col-md-4 ">

                            <div  style="border:  1px solid #ffc107; border-radius: 20px;">
                                <div class="ht__product__dtl" style=" padding: 20px;">
                                    <h3 style="border-bottom: 1px solid black ;">Th??ng tin b???o h??nh</h3>
                                    <div class="ht__pro__desc">
                                        <div class="sin__desc align--left">
                                            <ul class="pro__cat__list">
                                                <li>??? ${c.thongTinBaoHanh}</li>
                                            </ul>

                                        </div>
                                        <div class="sin__desc align--left">

                                            <ul class="pro__cat__list">
                                                <li>??? MI???N PH?? GIAO H??NG</li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div  style="border:  1px solid #ffc107; border-radius: 20px; margin-top: 20px;">
                                <div class="ht__product__dtl" style=" padding: 20px;">
                                    <h3 style="border-bottom: 1px solid black ;">Y??n t??m mua h??ng</h3>
                                    <div class="content">
                                        <p>??? S???n ph???m ch??nh h??ng</p>
                                        <p>??? Gi?? lu??n t???t nh???t</p>
                                        <p>??? B???o h??nh d??i, h???u m??i chu ????o</p>
                                        <p>??? Mi???n ph?? giao h??ng to??n qu???c</p>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>          

    <jsp:include page="Relatedproducts.jsp"></jsp:include>


    <%--<jsp:include page="Brand.jsp"></jsp:include>--%>
</div>
<jsp:include page="Footer.jsp"></jsp:include>
</body>
</html>