<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="d" uri="http://java.sun.com/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<head>
    <style>
        .img{
            width: 150px;
            height: 150px;
            border-radius: 50%;
            margin-bottom: 50px;
        }
    </style>
    <jsp:include page="../head.jsp"></jsp:include>
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


                    <div class="container">
                        <div class="container_imageAvarta">
                            <div class="image">
                                <img class="img" src="<c:url value="/resources/resourceAdmin/img/undraw_profile.svg"></c:url>" />
                            </div>
                        </div>
                        <div class="wrapper">
                        <form:form action="updateProfile" method="post">
                            <input hidden="true" name="id" value="${taikhoan.id}" >
                                <div class="col-md-6 mb-3">
                                    <label  class="form-label">Họ Tên</label>
                                    <div style="display: flex">
                                    <input name="hoTen" type="text" class="form-control"  value="${taikhoan.hoTen}">
<!--                                    <i id = "removereadonly" class=" fas fa-edit"></i>-->
                                </div>
                            </div>
                                   

                            <div class="col-md-6 mb-3">
                                <label  class="form-label">Địa chỉ</label>
                            <input type="text" class="form-control" name="diaChi" value="${taikhoan.diaChi}">
<!--                                <i onclick="r" id = "removereadonly" class=" fas fa-edit"></i>-->
                            </div>
                            <div class="col-md-6 mb-3">
                                <label  class="form-label">Email</label>
                                <input readonly="true" type="text" class="form-control" value="${taikhoan.email}">
                                
                            </div>

                            <div class="col-md-6 mb-3">
                                <label  class="form-label">Số điện thoại</label>
                                <input readonly="true" path="sdt" type="text" class="form-control" value="${taikhoan.sdt}">
                                
                            </div>
                                <button style="margin-left: 15px" type="submit" class="btn btn-primary">Lưu</button>        
                        </form:form>
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
