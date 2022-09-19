

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
        <style>
            .err{
                color: red;
                font-size: 15px;
                margin-left:  10px;

            }
        </style>

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
                        <form:form action="insert" modelAttribute="tkuser" method="post" onsubmit="return validate()">
                            <div class="form-group">
                                <label>Họ Tên</label>
                                <form:input id="name" type="text" class="form-control col-md-6" path="hoTen" placeholder="Nhập họ tên ..."></form:input>
                                
                                </div>
                                <div class="invalid-feedback" style="display: block;font-size: 15px;color: red"> </div>
                                <div class="form-group">
                                    <label>Địa chỉ</label>
                                <form:input id="address" type="text" class="form-control col-md-6" path="diaChi" placeholder="Nhập địa chỉ ..."></form:input>
                                </div>
                                <div class="invalid-feedback" style="display: block;font-size: 15px;color: red"> </div>
                                <div class="form-group">
                                    <label>Email</label>
                                <form:input id="email" type="text" class="form-control col-md-6" path="email" placeholder="Nhập email ..."></form:input>
                                <span id="errEmail" class="err">${errEmail}</span>
                                </div>
                                <div class="invalid-feedback" style="display: block;font-size: 15px;color: red"> </div>
                                <div class="form-group">
                                    <label>Password</label>
                                    <form:input id="password" type="text" class="form-control col-md-6" path="password" placeholder="Nhập password ..."></form:input>
                                </div>
                                <div class="invalid-feedback" style="display: block;font-size: 15px;color: red"> </div>
                                <div class="form-group">
                                    <label>Số điện thoại</label>
                                <form:input id="phone" type="number" class="form-control col-md-6" path="sdt" placeholder="Nhập số điện thoại ..."></form:input>
                                <span id="errSdt" class="err">${errSdt}</span>
                                </div>
                                <div class="invalid-feedback" style="display: block;font-size: 15px;color: red"> </div>
                                
                                <button  type="submit" class="btn btn-primary">Submit</button>
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
                var name = $('#name').val();
                var address = $('#address').val();
                var email = $('#email').val();
                var password = $('#password').val();
                var phone = $('#phone').val();
                var flag=true;
                if (name=='') {
                    $('#errEmail').text('')
                    $('#errSdt').text('')
                     $('#name').parent().next().html('Tên không được để trống');
                    flag = false;
                }else if (name.length<3 || name.length>20) {
                    $('#errEmail').text('')
                    $('#errSdt').text('')
                    $('#name').parent().next().html('Tên phải có từ 3-20 kí tự !');
                    flag = false;
                }
                else{
                     $('#name').parent().next().html('');
                  
                }
                
                
                if (address=='') {
                    $('#errEmail').text('')
                    $('#errSdt').text('')
                     $('#address').parent().next().html('Địa chỉ không được để trống !');
                    flag = false;
                }else if (address.length<3 || address.length>100 ) {
                    $('#errEmail').text('')
                    $('#errSdt').text('')
                    $('#address').parent().next().html('Địa chỉ phải từ 3-100 kí tự !');
                    flag = false;
                }
                else{
                     $('#address').parent().next().html('');
                }
                
                var validRegex_email = /^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/;
                if (email=='') {
                    $('#errEmail').text('')
                    $('#errSdt').text('')
                     $('#email').parent().next().html('Email không được để trống !');
                    flag = false;
                }else if (!email.match(validRegex_email)) {
                     $('#errEmail').text('')
                     $('#errSdt').text('')
                    $('#email').parent().next().html('Email phải có định dạng : email@domaim.coṃ !');
                    flag = false;
                }
                else{
                     $('#email').parent().next().html('');
                }
                
                if (password=='') {
                    $('#errEmail').text('')
                    $('#errSdt').text('')
                     $('#password').parent().next().html('Password không được để trống !');
                    flag = false;
                }else if (password.length<6 || address.length>20 ) {
                    $('#errEmail').text('')
                    $('#errSdt').text('')
                    $('#password').parent().next().html('Password phải từ 6-20 kí tự !');
                    flag = false;
                }
                else{
                     $('#password').parent().next().html('');
                }
                
                var regex_phone = /^(0?)(3[2-9]|5[6|8|9]|7[0|6-9]|8[0-6|8|9]|9[0-4|6-9])[0-9]{7}$/;
                if (phone=='') {
                    $('#errEmail').text('')
                    $('#errSdt').text('')
                     $('#phone').parent().next().html('Sđt không được để trống !');
                    flag = false;
                }else if (!phone.match(regex_phone)) {
                    $('#errEmail').text('')
                     $('#errSdt').text('')
                    $('#phone').parent().next().html('Sđt gồm 10 số bắt đầu bằng 0 hoặc 84̣ !');
                    flag = false;
                }
                else{
                     $('#phone').parent().next().html('');
                }
                
                return flag;
            };
        </script>

    </body>






</html>










