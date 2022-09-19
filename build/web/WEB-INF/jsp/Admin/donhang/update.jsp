

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
                            <h1 class="h3 mb-2 text-gray-800">Cập nhật đơn hàng</h1>


                            <!-- DataTales Example -->
                        <form:form action="update" method="post">
                            <input hidden="true" readonly="true" value="${donhang.id}" type="text" name="idDh" class="col-md-6 form-control" >
                            <input hidden="true" readonly="true" value="${idSP}" type="text" name="idSP" class="col-md-6 form-control" >
                            <div class="form-group">
                                <label>Tên Người nhận</label>
                                <input value="${donhang.tenNguoiNhan}" type="text" name="tenNguoiNhan" class="col-md-6 form-control" >
                            </div>
                            <div class="form-group">
                                <label>Địa chỉ nhận</label>
                                <input value="${donhang.diaChiNhan}" type="text" name="diaChiNhan" class="col-md-6 form-control" >
                            </div>
                            <div class="form-group">
                                <label>Sđt người nhận</label>
                                <input value="${donhang.SDTNguoiNhan}" type="text" name="sdtNguoiNhan" class="col-md-6 form-control" >
                            </div>
                            <div class="form-group">
                                <label>Ghi chú</label>
                                <input value="${donhang.ghiChu}" type="text" name="ghiChu" class="col-md-6 form-control" >
                            </div>
                            <div class="form-group">
                                <label>Số lượng sản phẩm</label>
                                <input value="${chitiet.soLuong}" type="number" min="1" name="soluong" class="col-md-6 form-control" >
                            </div>
                            <button type="submit" class="btn btn-primary">Submit</button>
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


    </body>






</html>







