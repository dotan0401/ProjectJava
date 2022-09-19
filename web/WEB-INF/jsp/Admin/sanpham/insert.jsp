

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
                        <form:form action="insert"  method="post" onsubmit="return validate()">
                            <div class="container">
                                <h1 class="h3 mb-2 text-gray-800">Tables</h1>
                                <div class="row">
                                <div class="col-lg-6 col-md-6">
                                    <div class="form-group">
                                        <label>Tên sản phẩm</label>
                                        <input value="<%= request.getParameter("ten") != null ? request.getParameter("ten") : "" %>" id="ten" type="text" class="col-md-10 form-control" name="ten" placeholder="Nhập tên sản phẩm̀ ...">
                                    </div>
                                    <span style="color: red">${errName}</span>
                                    <div class="invalid-feedback" style="display: block;font-size: 15px;color: red"> </div>
                                    <div class="form-group">
                                        <label>CPU</label>
                                        <input value="<%= request.getParameter("cpu") != null ? request.getParameter("cpu") : "" %>" id="cpu" type="text" class="col-md-10 form-control" name="cpu" placeholder="Nhập cpu...">
                                    </div>
                                    <div class="invalid-feedback" style="display: block;font-size: 15px;color: red"> </div>
                                    <div class="form-group">
                                        <label>Main</label>
                                        <input value="<%= request.getParameter("main") != null ? request.getParameter("main") : ""%>" type="text" class="col-md-10 form-control" name="main" id="main" placeholder="Nhập main ...">
                                    </div>
                                    <div class="invalid-feedback" style="display: block;font-size: 15px;color: red"> </div>
                                    <div class="form-group">
                                        <label>Cổng giao tiếp</label>
                                        <input value="<%= request.getParameter("congGiaoTiep") != null ? request.getParameter("congGiaoTiep") : "" %>" type="text" class="col-md-10 form-control" name="congGiaoTiep" id="congGiaoTiep" placeholder="Nhập cổng giao tiếp ...">
                                    </div>
                                    <div class="form-group">
                                        <label>Audio</label>
                                        <input value="<%= request.getParameter("audio") != null ? request.getParameter("audio") : "" %>" type="text" class="col-md-10 form-control" name="audio" id="audio" placeholder="Nhập audio ...">
                                    </div>
                                    <div class="form-group">
                                        <label>Bàn phím</label>
                                        <input value="<%= request.getParameter("banPhim") != null ? request.getParameter("banPhim") : "" %>" type="text" class="col-md-10 form-control" name="banPhim" id="banPhim" placeholder="Nhập bàn phím ...">
                                    </div>
                                    <div class="invalid-feedback" style="display: block;font-size: 15px;color: red"> </div>
                                    <div class="row">
                                        <div class="col-md-5">
                                            <div class="form-group">
                                                <label>Trọng lượng</label>
                                                <input value="<%= request.getParameter("trongLuong") != null ? request.getParameter("trongLuong") : ""%>" min="0.1" pattern="[0-9]+([\.,][0-9]+)?" step="0.1" type="number" class="col-md-10 form-control" id="trongLuong" name="trongLuong" placeholder="Nhập trọng lượng ...">
                                            </div>
                                            <div class="invalid-feedback" style="display: block;font-size: 15px;color: red"> </div>
                                        </div>
                                        
                                        <div class="col-md-5">
                                            <div class="form-group">
                                                <label>Dung lượng pin</label>
                                                <input value="<%= request.getParameter("dungLuongPin") != null ? request.getParameter("dungLuongPin") : "" %>" type="text" class="col-md-10 form-control" name="dungLuongPin" id="dungLuongPin" placeholder="Nhập trọng lượng ...">
                                            </div>
                                            <div class="invalid-feedback" style="display: block;font-size: 15px;color: red"> </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-5">
                                            <div class="form-group">
                                                <label>HDD</label>
                                                <input value="<%= request.getParameter("hdd") != null ? request.getParameter("hdd") : "" %>" type="text" class="col-md-10 form-control" name="hdd" id="hdd" placeholder="Nhập HDD ...">
                                            </div>
                                        </div>
                                        <div class="col-md-5">
                                            <div class="form-group">
                                                <label>SSD</label>
                                                <input value="<%= request.getParameter("ssd") != null ? request.getParameter("ssd") : "" %>" type="text" class="col-md-10 form-control" name="ssd" id="ssd" placeholder="Nhập SSD ...">
                                            </div>
                                            <div class="invalid-feedback" style="display: block;font-size: 15px;color: red"> </div>
                                        </div>
                                    </div>
                                    
                                    <div class="form-group">
                                        <label>Màu Sắc</label>
                                        <input value="<%= request.getParameter("mauSac") != null ? request.getParameter("mauSac") : "" %>" type="text" class="col-md-10 form-control" name="mauSac" id="mauSac" placeholder="Nhập màu sắc...">
                                    </div>
                                    <div class="form-group">
                                        <label>Hãng sản xuất</label>
                                        <select name="hangSanXuat" class="form-control col-md-10">
                                            
                                            <c:forEach items="${hsx}" var="hsx">
                                               
                                                <option >
                                                
                                                    ${hsx.ten}
                                                
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-6">
                                    <div class="form-group">
                                        <label>VGA</label>
                                        <input value="<%= request.getParameter("vga") != null ? request.getParameter("vga") : "" %>" type="text" class="col-md-10 form-control" name="vga" id="vga" placeholder="Nhập vga ...">
                                    </div>
                                    <div class="invalid-feedback" style="display: block;font-size: 15px;color: red"> </div>
                                    <div class="form-group">
                                        <label>Màn hình</label>
                                        <input value="<%= request.getParameter("manHinh") != null ? request.getParameter("manHinh") : "" %>" type="text" class="col-md-10 form-control" name="manHinh" id="manHinh" placeholder="Nhập màn hình ...">
                                    </div>
                                    <div class="invalid-feedback" style="display: block;font-size: 15px;color: red"> </div>
                                    <div class="row">
                                        <div class="col-md-5">
                                            <div class="form-group">
                                                <label>Đơn giá</label>
                                                <input value="<%= request.getParameter("donGia") != null ? request.getParameter("donGia") : "" %>" pattern="[0-9]+([\.,][0-9]+)?" step="0.1" type="number" class="col-md-10 form-control" name="donGia" id="donGia" placeholder="Nhập don gia ...">
                                            </div>
                                            <div class="invalid-feedback" style="display: block;font-size: 15px;color: red"> </div>
                                        </div>
                                        <div class="col-md-5">
                                            <div class="form-group">
                                                <label>Số lượng</label>
                                                <input value="<%= request.getParameter("donViKho" ) != null ? request.getParameter("donViKho") : "" %>" type="number" min="1" class="col-md-10 form-control" name="donViKho" id="donViKho" placeholder="Nhập so luong ...">
                                            </div>
                                            <div class="invalid-feedback" style="display: block;font-size: 15px;color: red"> </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label>kích thước</label>
                                        <input value="<%= request.getParameter("kichThuoc") != null ? request.getParameter("kichThuoc") : "" %>" type="text" class="col-md-10 form-control" name="kichThuoc" id="kichThuoc" placeholder="Nhập kich thuoc may ...">
                                    </div>
                                    <div class="form-group">
                                        <label>Hệ điều hành</label>
                                        <input value="<%= request.getParameter("heDieuHanh") != null ? request.getParameter("heDieuHanh") : "" %>" type="text" class="col-md-10 form-control" name="heDieuHanh" id="heDieuHanh" placeholder="Nhập hệ diều hành...">
                                    </div>
                                    <div class="invalid-feedback" style="display: block;font-size: 15px;color: red"> </div>
                                    <div class="form-group">
                                        <label>Ram</label>
                                        <input value="<%= request.getParameter("ram") != null ? request.getParameter("ram") : "" %>" type="text" class="col-md-10 form-control" name="ram" id="ram" placeholder="Nhập ram ...">
                                    </div>
                                    <div class="invalid-feedback" style="display: block;font-size: 15px;color: red"> </div>
                                    <div class="form-group">
                                        <label>Thiết kế</label>
                                        <input value="<%= request.getParameter("thietKe") != null ? request.getParameter("thietKe") : "" %>" type="text" class="col-md-10 form-control" name="thietKe" id="thietKe" placeholder="Nhập thiết kế ...">
                                    </div>
                                    <div class="form-group">
                                        <label>Bảo hành</label>
                                        <input value="<%= request.getParameter("baoHanh") != null ? request.getParameter("baoHanh") : "" %>" type="text" class="col-md-10 form-control" name="baoHanh" id="baoHanh" placeholder="Nhập thông tin bảo hành ...">
                                    </div>
                                    <div class="invalid-feedback" style="display: block;font-size: 15px;color: red"> </div>
                                    <div class="form-group">
                                        <label>Thông tin chung</label>
                                        <input value="<%= request.getParameter("thongTinChung") != null ? request.getParameter("thongTinChung") : "" %>" type="text" class="col-md-10 form-control" name="thongTinChung" id="thongTinChung" placeholder="Nhập thông tin chung ...">
                                    </div>
                                </div>
                            </div>
                                <button type="submit" class="btn btn-primary">Submit</button>
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







