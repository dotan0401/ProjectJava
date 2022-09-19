

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
                            <div class="container-fluid">
                                <h1 class="h3 mb-2 text-gray-800">Tables</h1>
                            <form:form action="update" modelAttribute="taikhoan" method="post">
                                <input readonly="true" value="${taikhoan.id}" type="text" name="id" class="col-md-6 form-control" >
                                <div class="form-group">
                                    <label>Họ Tên</label>
                                    <form:input type="text" class="col-md-6 form-control" path="hoTen" value="${taikhoan.hoTen}"></form:input>
                                    </div>
                                    <div class="form-group">
                                        <label>Địa chỉ</label>
                                    <form:input type="text" class="col-md-6 form-control" path="diaChi" value="${taikhoan.diaChi}"></form:input>
                                    </div>
                                    <div class="form-group">
                                        <label>Email</label>
                                    <form:input readonly="true" type="text" class="col-md-6 form-control" path="email" value="${taikhoan.email}"></form:input>
                                    </div>
                                    <div class="form-group">
                                        <label>Password</label>
                                    <form:input type="text" class="col-md-6 form-control" path="password" value="${taikhoan.password}"></form:input>
                                    </div>
                                    <div class="form-group">
                                        <label>Số điện thoại</label>
                                    <form:input readonly="true" type="number" class=" col-md-6 form-control" path="sdt" value="${taikhoan.sdt}"></form:input>
                                    </div>
                                <c:if test="${taikhoan.status==true}">
                                    <input checked="true" type="radio"  name="status" value="true">Active
                                    <input type="radio"  name="status" value="false">Banned
                                </c:if>
                                <c:if test="${taikhoan.status==false}">
                                    <input  type="radio" id="html" name="status" value="true">Active
                                    <input checked="true" type="radio" id="css" name="status" value="false">Banned
                                </c:if>
                                <br>
                                <button style="margin-top: 20px" type="submit" class="btn btn-primary">Submit</button>
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










