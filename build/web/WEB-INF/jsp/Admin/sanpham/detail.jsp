

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="d" uri="http://java.sun.com/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib  prefix="i" uri="http://www.springframework.org/tags" %>
<%
//    if (session.getAttribute("email") == null) {
//        response.sendRedirect("Admin/login");
//    }
%>
<style>
    table > thead > tr > th{
        font-size: 12px;
    }
    table > tbody > tr > td{
        font-size: 12px;
    }
    .detail-left{

        color: #006400;
    }
    .detail-row{
        border-bottom: 1px solid gray ;
        padding: 1px;

    }
    
/*****************globals*************/
body {
  font-family: 'open sans';
  overflow-x: hidden; }

img {
  max-width: 100%; }

.preview {
  display: -webkit-box;
  display: -webkit-flex;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-orient: vertical;
  -webkit-box-direction: normal;
  -webkit-flex-direction: column;
      -ms-flex-direction: column;
          flex-direction: column; }
  @media screen and (max-width: 996px) {
    .preview {
      margin-bottom: 20px; } }

.preview-pic {
  -webkit-box-flex: 1;
  -webkit-flex-grow: 1;
      -ms-flex-positive: 1;
          flex-grow: 1; }

.preview-thumbnail.nav-tabs {
  border: none;
  margin-top: 15px; }
  .preview-thumbnail.nav-tabs li {
    width: 18%;
    margin-right: 2.5%; }
    .preview-thumbnail.nav-tabs li img {
      max-width: 100%;
      display: block; }
    .preview-thumbnail.nav-tabs li a {
      padding: 0;
      margin: 0; }
    .preview-thumbnail.nav-tabs li:last-of-type {
      margin-right: 0; }

.tab-content {
  overflow: hidden; }
  .tab-content img {
    width: 100%;
    -webkit-animation-name: opacity;
            animation-name: opacity;
    -webkit-animation-duration: .3s;
            animation-duration: .3s; }

.card {
  margin-top: 50px;
  background: #eee;
  padding: 3em;
  line-height: 1.5em; }

@media screen and (min-width: 997px) {
  .wrapper {
    display: -webkit-box;
    display: -webkit-flex;
    display: -ms-flexbox;
    display: flex; } }

.details {
  display: -webkit-box;
  display: -webkit-flex;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-orient: vertical;
  -webkit-box-direction: normal;
  -webkit-flex-direction: column;
      -ms-flex-direction: column;
          flex-direction: column; }

.colors {
  -webkit-box-flex: 1;
  -webkit-flex-grow: 1;
      -ms-flex-positive: 1;
          flex-grow: 1; }

.product-title, .price, .sizes, .colors {
  text-transform: UPPERCASE;
  font-weight: bold; }

.checked, .price span {
  color: #ff9f1a; }

.product-title, .rating, .product-description, .price, .vote, .sizes {
  margin-bottom: 15px; }

.product-title {
  margin-top: 0; }

.size {
  margin-right: 10px; }
  .size:first-of-type {
    margin-left: 40px; }

.color {
  display: inline-block;
  vertical-align: middle;
  margin-right: 10px;
  height: 2em;
  width: 2em;
  border-radius: 2px; }
  .color:first-of-type {
    margin-left: 20px; }

.add-to-cart, .like {
  background: #ff9f1a;
  padding: 1.2em 1.5em;
  border: none;
  text-transform: UPPERCASE;
  font-weight: bold;
  color: #fff;
  -webkit-transition: background .3s ease;
          transition: background .3s ease; }
  .add-to-cart:hover, .like:hover {
    background: #b36800;
    color: #fff; }

.not-available {
  text-align: center;
  line-height: 2em; }
  .not-available:before {
    font-family: fontawesome;
    content: "\f00d";
    color: #fff; }

.orange {
  background: #ff9f1a; }

.green {
  background: #85ad00; }

.blue {
  background: #0076ad; }

.tooltip-inner {
  padding: 1.3em; }

@-webkit-keyframes opacity {
  0% {
    opacity: 0;
    -webkit-transform: scale(3);
            transform: scale(3); }
  100% {
    opacity: 1;
    -webkit-transform: scale(1);
            transform: scale(1); } }

@keyframes opacity {
  0% {
    opacity: 0;
    -webkit-transform: scale(3);
            transform: scale(3); }
  100% {
    opacity: 1;
    -webkit-transform: scale(1);
            transform: scale(1); } }

/*# sourceMappingURL=style.css.map */
</style>
<html class="no-js" lang="en">
    <head>  
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,700" rel="stylesheet">
        <jsp:include page="../head.jsp"></jsp:include>
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css">
        </head>


        <body id="page-top">

            <!-- Page Wrapper -->
            <div id="wrapper">

                <!-- Sidebar menu  -->


            <jsp:include page="../menu.jsp"></jsp:include>



                <!-- End of Sidebar -->

                <!-- Content Wrapper -->
                <div id="content-wrapper" class="d-flex flex-column">

                    <!-- Main Content -->
                    <div id="content">

                        <!-- Topbar -->


                    <jsp:include page="../topbar.jsp"></jsp:include>

                        <!-- End of Topbar -->

                        <!-- Begin Page Content -->


                        <div class="container-fluid">

                            <!-- Page Heading -->
                            <h1 class="h3 mb-2 text-gray-800">Tables</h1>


                            
                            <!-- DataTales Example -->
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">Chi tiết sản phẩm </h6>
                                </div>

                                <div class="container">
                                    <div class="card">
                                        <div class="container-fliud">
                                            <div class="wrapper row">
                                                <div class="preview col-md-6">

                                                
                                                    <div class="preview-pic tab-content">
                                                       
                                                   
                                               
                                                     <c:forEach items="${anh}" var="a">
                                                        <div class="tab-pane active" id="pic-1"><img src="<c:url value='/resources/images/product/${a.url}'/>" /></div>
                                                         </c:forEach>
                                                       
                                                    </div>
                                                    

                                                </div>
                                                <div class="details col-md-6">
                                                    <h3 class="product-title"> ${sp.ten    }</h3>
                                                    
                                                    <p class="product-description">CPU: ${sp.cpu }</p>
                                                    <h5 >Ram : ${sp.ram    }</h5>
                                                    <h5 >Main : ${sp.main    }</h5>
                                                    
                                                    <p class="vote">Màn hình : ${sp.manHinh    }</p>
                                                    
                                                    <p class="vote">VGA :  ${sp.vga    }</p>
                                                    <p class="vote">Hệ ddieuf hành :  ${sp.heDieuHanh    }</p>
                                                    
                                                    <p style="color: red" class="vote">Giá : <fmt:formatNumber value = "${sp.donGia    }" type = "currency"/></p>
                                                    
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>


                                <div class="container-fluid">
                                    <div></div>
                                    <div class="wrap-detail">
                                        <div class="detail-row row">
                                            <div class="detail-left col-lg-3 col-md-3">
                                                Cổng giao tiếp
                                            </div>
                                            <div class="col-lg-6 col-md-6">
                                                ${sp.congGiaoTiep    }
                                            </div>
                                        </div>
                                        <div class="detail-row row">
                                            <div class="detail-left col-lg-3 col-md-3">
                                                Audio
                                            </div>
                                            <div class="col-lg-6 col-md-6">
                                                ${sp.audio    }
                                            </div>
                                        </div>
                                        <div class="detail-row row">
                                            <div class="detail-left col-lg-3 col-md-3">
                                                Bàn phím
                                            </div>
                                            <div class="col-lg-6 col-md-6">
                                                ${sp.banPhim    }
                                            </div>
                                        </div>
                                        <div class="detail-row row">
                                            <div class="detail-left col-lg-3 col-md-3">
                                                Trọng lượng
                                            </div>
                                            <div class="col-lg-6 col-md-6">
                                                ${sp.trongLuong    }
                                            </div>
                                        </div>
                                        <div class="detail-row row">
                                            <div class="detail-left col-lg-3 col-md-3">
                                                Màu sắc
                                            </div>
                                            <div class="col-lg-6 col-md-6">
                                                ${sp.mauSac    }
                                            </div>
                                        </div>
                                        <div class="detail-row row">
                                            <div class="detail-left col-lg-3 col-md-3">
                                                Kích thước
                                            </div>
                                            <div class="col-lg-6 col-md-6">
                                                ${sp.kichThuoc    }
                                            </div>
                                        </div>
                                        <div class="detail-row row">
                                            <div class="detail-left col-lg-3 col-md-3">
                                                HDD
                                            </div>
                                            <div class="col-lg-6 col-md-6">
                                                ${sp.hdd    }
                                            </div>
                                        </div>
                                        <div class="detail-row row">
                                            <div class="detail-left col-lg-3 col-md-3">
                                                SSD
                                            </div>
                                            <div class="col-lg-6 col-md-6">
                                                ${sp.ssd    }
                                            </div>
                                        </div>
                                        <div class="detail-row row">
                                            <div class="detail-left col-lg-3 col-md-3">
                                                Đã bán
                                            </div>
                                            <div class="col-lg-6 col-md-6">
                                                ${sp.donViBan    }
                                            </div>
                                        </div>
                                        <div class="detail-row row">
                                            <div class="detail-left col-lg-3 col-md-3">
                                                Trong kho
                                            </div>
                                            <div class="col-lg-6 col-md-6">
                                                ${sp.donViKho    }
                                            </div>
                                        </div>
                                        
                                        
                                        
                                        <div class="detail-row row">
                                            <div class="detail-left col-lg-3 col-md-3">
                                                Dung Lượng pin
                                            </div>
                                            <div class="col-lg-6 col-md-6">
                                                ${sp.dungLuongPin    }
                                            </div>
                                        </div>
                                        <div class="detail-row row">
                                            <div class="detail-left col-lg-3 col-md-3">
                                                Thiết kế
                                            </div>
                                            <div class="col-lg-6 col-md-6">
                                                ${sp.thietKe    }
                                            </div>
                                        </div>
                                        <div class="detail-row row">
                                            <div class="detail-left col-lg-3 col-md-3">
                                                Thông tin bảo hành
                                            </div>
                                            <div class="col-lg-6 col-md-6">
                                                ${sp.thongTinBaoHanh    }
                                            </div>
                                        </div>
                                        <div class="detail-row row">
                                            <div class="detail-left col-lg-3 col-md-3">
                                                Thông tin chung
                                            </div>
                                            <div class="col-lg-6 col-md-6">
                                                ${sp.thongTinChung    }
                                            </div>
                                        </div>
                                        <div class="detail-row row">
                                            <div class="detail-left col-lg-3 col-md-3">
                                                Hãng sản xuất
                                            </div>
                                            <div class="col-lg-6 col-md-6">
                                                ${sp.maHangSanXuat.ten    }
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                        <div>
                            <button  style="margin:20px 0 0 20px" class="btn btn-primary" ><a style="color: white;text-decoration: none" href="${pageContext.request.contextPath}/Admin/sanpham/list">Quay lại</a></button>
                        </div>
                    </div>




                    <!-- /.container-fluid -->

                </div>
                <!-- End of Main Content -->

                <!-- Footer -->
                <jsp:include page="../footer.jsp"></jsp:include>
                <!-- End of Footer -->

            </div>
            <!-- End of Content Wrapper -->

        </div>
        <!-- End of Page Wrapper -->

        <!-- Scroll to Top Button-->
        <a class="scroll-to-top rounded" href="#page-top">
            <i class="fas fa-angle-up"></i>
        </a>

        <!-- Logout Modal-->
        <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
             aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                        <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">×</span>
                        </button>
                    </div>
                    <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                    <div class="modal-footer">
                        <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                        <a class="btn btn-primary" href="login.html">Logout</a>
                    </div>
                </div>
            </div>
        </div>


    </body>






</html>







