

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="d" uri="http://java.sun.com/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
//    if (session.getAttribute("email") == null) {
//        response.sendRedirect("Admin/login");
//    }
%>
<html class="no-js" lang="en">
    <head>  

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
                            


                            <!-- DataTales Example -->
                        <form:form action="initupdate"  method="post" onsubmit="return validate()">
                            <div class="container">
                                <h1 class="h3 mb-2 text-gray-800">Tables</h1>
                                <div class="row">
                                <div class="col-lg-6 col-md-6">
                                    <div class="form-group">
                                        <label>Mã sản phẩm</label>
                                        <input readonly="true" name="id" value="${sp.id}" type="text" class="col-md-10 form-control" placeholder="Nhập tên sản phẩm̀ ...">
                                    </div>
                                    
                                    <div class="form-group">
                                        <label>Tên sản phẩm</label>
                                        <input id="ten" value="${sp.ten}" type="text" class="col-md-10 form-control" name="ten" placeholder="Nhập tên sản phẩm̀ ...">
                                    </div>
                                    <div class="invalid-feedback" style="display: block;font-size: 15px;color: red"> </div>
                                    <div class="form-group">
                                        <label>CPU</label>
                                        <input id="cpu" value="${sp.cpu}" type="text" class="col-md-10 form-control" name="cpu" placeholder="Nhập cpu...">
                                    </div>
                                    <div class="invalid-feedback" style="display: block;font-size: 15px;color: red"> </div>
                                    <div class="form-group">
                                        <label>Main</label>
                                        <input id="main" value="${sp.main}" type="text" class="col-md-10 form-control" name="main" placeholder="Nhập main ...">
                                    </div>
                                    <div class="invalid-feedback" style="display: block;font-size: 15px;color: red"> </div>
                                    <div class="form-group">
                                        <label>Cổng giao tiếp</label>
                                        <input id="congGiaoTiep" value="${sp.congGiaoTiep}" type="text" class="col-md-10 form-control" name="congGiaoTiep" placeholder="Nhập cổng giao tiếp ...">
                                    </div>
                                    <div class="form-group">
                                        <label>Audio</label>
                                        <input id="audio" value="${sp.audio}" type="text" class="col-md-10 form-control" name="audio" placeholder="Nhập audio ...">
                                    </div>
                                    <div class="form-group">
                                        <label>Bàn phím</label>
                                        <input id="banPhim" value="${sp.banPhim}" type="text" class="col-md-10 form-control" name="banPhim" placeholder="Nhập bàn phím ...">
                                    </div>
                                    <div class="invalid-feedback" style="display: block;font-size: 15px;color: red"> </div>
                                    <div class="row">
                                        <div class="col-md-5">
                                            <div class="form-group">
                                                <div>
                                                    <label>Trọng lượng</label>
                                                <input id="trongLuong"  value="${sp.trongLuong}" min="0.1" pattern="[0-9]+([\.,][0-9]+)?" step="0.1" type="number" class="col-md-10 form-control" name="trongLuong" placeholder="Nhập trọng lượng ...">
                                                </div>
                                                <div class="invalid-feedback" style="display: block;font-size: 15px;color: red"> </div>
                                            </div>
                                            
                                        </div>
                                        <div class="col-md-5">
                                            <div class="form-group">
                                                <div>
                                                    <label>Dung lượng pin</label>
                                                <input id="dungLuongPin" value="${sp.dungLuongPin}" type="text" class="col-md-10 form-control" name="dungLuongPin" placeholder="Nhập trọng lượng ...">
                                                </div>
                                                <div class="invalid-feedback" style="display: block;font-size: 15px;color: red"> </div>
                                            </div>
                                            
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-5">
                                            <div class="form-group">
                                                <div>
                                                    <label>HDD</label>
                                                <input id="hdd" value="${sp.hdd}" type="text" class="col-md-10 form-control" name="hdd" placeholder="Nhập HDD ...">
                                                </div>
                                               
                                            </div>
                                            
                                        </div>
                                        <div class="col-md-5">
                                            <div class="form-group">
                                                <div>
                                                    <label>SSD</label>
                                                <input id="ssd" value="${sp.ssd}" type="text" class="col-md-10 form-control" name="ssd" placeholder="Nhập SSD ...">
                                                </div>
                                                 <div class="invalid-feedback" style="display: block;font-size: 15px;color: red"> </div>
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <div class="form-group">
                                        <label>Màu Sắc</label>
                                        <input id =" mauSac" value="${sp.mauSac}" type="text" class="col-md-10 form-control" name="mauSac" placeholder="Nhập màu sắc...">
                                    </div>
<!--                                    <div class="form-group">
                                        <label>Hãng sản xuất</label>
                                        <select name="hangSanXuat" class="form-control col-md-10">
                                            
                                            <c:forEach items="${hsx}" var="hsx">
                                                <c:if test="${hsx.ten == nameCat}">
                                                    <option value="${hsx.ten}">
                                                        ${hsx.ten}
                                                    </option>
                                                </c:if>
                                                  <c:if test="${hsx.ten != nameCat}">
                                                    <option>
                                                        ${hsx.ten}
                                                    </option>
                                                </c:if>

                                            </c:forEach>
                                        </select>
                                    </div>-->
                                </div>
                                <div class="col-lg-6 col-md-6">
                                    <div class="form-group">
                                        <label>VGA</label>
                                        <input id="vga" value="${sp.vga}" type="text" class="col-md-10 form-control" name="vga" placeholder="Nhập vga ...">
                                    </div>
                                    <div class="invalid-feedback" style="display: block;font-size: 15px;color: red"> </div>
                                    <div class="form-group">
                                        <label>Màn hình</label>
                                        <input id="manHinh" value="${sp.manHinh}" type="text" class="col-md-10 form-control" name="manHinh" placeholder="Nhập màn hình ...">
                                    </div>
                                    <div class="invalid-feedback" style="display: block;font-size: 15px;color: red"> </div>
                                    <div class="row">
                                        <div class="col-md-5">
                                            <div class="form-group">
                                                <div>
                                                    <label>Đơn giá</label>
                                                <input id="donGia" min="1000" step="10000" value="${sp.donGia}" type="text" class="col-md-10 form-control" name="donGia" placeholder="Nhập don gia ...">
                                                </div>
                                                <div class="invalid-feedback" style="display: block;font-size: 15px;color: red"> </div>
                                            </div>
                                        </div>
                                        <div class="col-md-5">
                                            <div class="form-group">
                                                <div>
                                                    <label>Số lượng</label>
                                                <input id="donViKho" value="${sp.donViKho}" type="number" min="1" class="col-md-10 form-control" name="donViKho" placeholder="Nhập so luong ...">
                                                </div>
                                                <div class="invalid-feedback" style="display: block;font-size: 15px;color: red"> </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label>kích thước</label>
                                        <input id="kichThuoc" value="${sp.kichThuoc}" type="text" class="col-md-10 form-control" name="kichThuoc" placeholder="Nhập kich thuoc may ...">
                                    </div>
                                    <div class="form-group">
                                        <label>Hệ điều hành</label>
                                        <input id="heDieuHanh" value="${sp.heDieuHanh}" type="text" class="col-md-10 form-control" name="heDieuHanh" placeholder="Nhập hệ diều hành...">
                                    </div>
                                    <div class="invalid-feedback" style="display: block;font-size: 15px;color: red"> </div>
                                    <div class="form-group">
                                        <label>Ram</label>
                                        <input id="ram" value="${sp.ram}" type="text" class="col-md-10 form-control" name="ram" placeholder="Nhập ram ...">
                                    </div>
                                    <div class="invalid-feedback" style="display: block;font-size: 15px;color: red"> </div>
                                    <div class="form-group">
                                        <label>Thiết kế</label>
                                        <input id="thietKe" value="${sp.thietKe}" type="text" class="col-md-10 form-control" name="thietKe" placeholder="Nhập thiết kế ...">
                                    </div>
                                    <div class="form-group">
                                        <label>Bảo hành</label>
                                        <input id="thongTinBaoHanh" value="${sp.thongTinBaoHanh}" type="text" class="col-md-10 form-control" name="baoHanh" placeholder="Nhập thông tin bảo hành ...">
                                    </div>
                                    <div class="invalid-feedback" style="display: block;font-size: 15px;color: red"> </div>
                                    <div class="form-group">
                                        <label>Thông tin chung</label>
                                        <input value="${sp.thongTinChung}" type="text" class="col-md-10 form-control" name="thongTinChung" placeholder="Nhập thông tin chung ...">
                                    </div>
                                    <label for="html">Trạng thái</label><br>
                                     <c:if test="${sp.status==true}">
                                    <input checked="true" type="radio" id="html" name="status" value="true">Active
                                    <input type="radio" id="css" name="status" value="false">Banned
                                    </c:if>
                                    <c:if test="${sp.status==false}">
                                    <input  type="radio" id="html" name="status" value="true">Active
                                    <input checked="true" type="radio" id="css" name="status" value="false">Banned
                                    </c:if>
                                </div>
                            </div>
                                <button type="submit" class="btn btn-primary">Submit</button>
                                <a href="${pageContext.request.contextPath}/Admin/sanpham/list"><button class="btn btn-primary">Quay lại</button></a>
                            </div>
                            
                        </form:form>

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

<script type="text/javascript">
            function validate() {
                var ten = $('#ten').val();
                var cpu = $('#cpu').val();
                var main = $('#main').val();
                var banPhim = $('#banPhim').val();
                var trongLuong = $('#trongLuong').val();
                var donGia = $('#donGia').val();
                var donViKho = $('#donViKho').val();
                var ssd = $('#ssd').val();
                var vga = $('#vga').val();
                var heDieuHanh = $('#heDieuHanh').val();
                var ram = $('#ram').val();
                var manHinh = $('#manHinh').val();
                var thongTinBaoHanh = $('#thongTinBaoHanh').val();
                var dungLuongPin = $('#dungLuongPin').val();
                
                
                var flag=true;
                if (ten == '') {
                     $('#ten').parent().next().html('Tên sản phẩm không được để trống !');
                    flag = false;
                }else{
                     $('#ten').parent().next().html('');
                  
                };
                
                if (cpu == '') {
                     $('#cpu').parent().next().html('Tên cpu không được để trống !');
                    flag = false;
                }else{
                     $('#cpu').parent().next().html('');
                };
                
                if (main == '') {
                     $('#main').parent().next().html('Tên main không được để trống !');
                    flag = false;
                }else{
                     $('#main').parent().next().html('');
                };
                if (banPhim == '') {
                     $('#banPhim').parent().next().html('Tên bàn phím không được để trống !');
                    flag = false;
                }else{
                     $('#banPhim').parent().next().html('');
                };
                
                if (trongLuong == '') {
                     $('#trongLuong').parent().next().html('Nhập trường này ! !');
                    flag = false;
                }else{
                     $('#trongLuong').parent().next().html('');
                };
                
                if (donGia == '') {
                     $('#donGia').parent().next().html('Nhập trường này ! !');
                    flag = false;
                }else{
                     $('#donGia').parent().next().html('');
                };
                 if (donViKho == '') {
                     $('#donViKho').parent().next().html('Nhập trường này ! !');
                    flag = false;
                }else{
                     $('#donGia').parent().next().html('');
                };
                
                if (ssd == '') {
                     $('#ssd').parent().next().html('Nhập trường này ! !');
                    flag = false;
                }else{
                     $('#ssd').parent().next().html('');
                };
                if (vga == '') {
                     $('#vga').parent().next().html('Nhập trường này ! !');
                    flag = false;
                }else{
                     $('#vga').parent().next().html('');
                };
                
                if (heDieuHanh == '') {
                     $('#heDieuHanh').parent().next().html('Nhập trường này ! !');
                    flag = false;
                }else{
                     $('#heDieuHanh').parent().next().html('');
                };
                
                if (ram == '') {
                     $('#ram').parent().next().html('Nhập trường này ! !');
                    flag = false;
                }else{
                     $('#ram').parent().next().html('');
                };
                if (manHinh == '') {
                     $('#manHinh').parent().next().html('Nhập trường này ! !');
                    flag = false;
                }else{
                     $('#manHinh').parent().next().html('');
                };
                
                if (dungLuongPin == '') {
                     $('#dungLuongPin').parent().next().html('Nhập trường này ! !');
                    flag = false;
                }else{
                     $('#dungLuongPin').parent().next().html('');
                };
                
                if (thongTinBaoHanh == '') {
                     $('#thongTinBaoHanh').parent().next().html('Nhập trường này ! !');
                    flag = false;
                }else{
                     $('#thongTinBaoHanh').parent().next().html('');
                };
                
                
                
                
                return flag;
            };
        </script>
    </body>






</html>







