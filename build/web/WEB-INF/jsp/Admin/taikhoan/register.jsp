<%-- 
    Document   : logout
    Created on : Aug 11, 2022, 10:55:27 AM
    Author     : HOANG LAN COMPUTER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:include page="../head.jsp"></jsp:include>
<body class="bg-gradient-primary">

    <div class="container">

        <div class="card o-hidden border-0 shadow-lg my-5">
            <div class="card-body p-0">
                <!-- Nested Row within Card Body -->
                <div class="row">
                    <div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
                    <div class="col-lg-7">
                        <div class="p-5">
                            <div class="text-center">
                                <h1 class="h4 text-gray-900 mb-4">Tạo tài khoản!</h1>
                                
                           
                            </div>
                            
                        <form:form class="user" action="register" method="post" modelAttribute="nv" onsubmit="return validate()">
                            <div>
                                
                            </div>
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <div><form:input path="hoTen" type="text" class="form-control form-control-user" id="name"
                                                    placeholder="Họ tên" /></div>
                                        <div class="invalid-feedback" style="margin: 0 0 10px 10px ;display: block;font-size: 13px;color: red"> </div>
                                    </div>
                                    
                                    <div class="col-sm-6">
                                        <div><form:input path="sdt" type="text" class="form-control form-control-user" id="sdt"
                                            placeholder="Số điện thoại" /></div>
                                        <span id="errSDT" style="color: red;font-size: 13px;margin-left: 10px">${errSDT}</span>
                                        <div class="invalid-feedback" style="margin: 0 0 10px 10px ;display: block;font-size: 13px;color: red"> </div>
                                    </div>
                                    
                                </div>
                                <div class="form-group">
                                    <form:input path="email" type="email" class="form-control form-control-user" id="email"
                                        placeholder="Email"/>
                                     <span id="errEmail" style="color: red;font-size: 13px;margin-left: 10px">${errEmail}</span>
                                </div>
                                <div class="invalid-feedback" style="margin: 0 0 10px 10px ;display: block;font-size: 13px;color: red"> </div>
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <div><form:input path="password" type="password" class="form-control form-control-user"
                                                    id="pass" placeholder="Mật khẩu" /></div>
                                        <div class="invalid-feedback" style="margin: 0 0 10px 10px ;display: block;font-size: 13px;color: red"> </div>
                                    </div>
                                    
                                    <div class="col-sm-6">
                                        <div><input path="cofirmPassword" type="password" class="form-control form-control-user"
                                                    id="confirm" placeholder="Nhập lại mật khẩu" /></div>
                                                     <div class="invalid-feedback" style="margin: 0 0 10px 10px ;display: block;font-size: 13px;color: red"> </div>
                                                     <div><span style="text-align: center" id="err"></span></div>
                                <div class="invalid-feedback" style="margin: 0 0 10px 10px ;display: block;font-size: 13px;color: red"> </div>
                                    </div>
                                   
                                </div>
                                    <button type="submit" class="btn btn-primary btn-user btn-block">
                                    Đăng kí
                                </button>
                                <hr>
<!--                                <a href="index.html" class="btn btn-google btn-user btn-block">
                                    <i class="fab fa-google fa-fw"></i> Register with Google
                                </a>
                                <a href="index.html" class="btn btn-facebook btn-user btn-block">
                                    <i class="fab fa-facebook-f fa-fw"></i> Register with Facebook
                                </a>-->
                            </form:form>
                            <hr>
                            <div class="text-center">
                                <a class="small" href="${pageContext.request.contextPath}/Admin/forgot_password">Quên mật khẩu</a>
                            </div>
                            <div class="text-center">
                                <a class="small" href="${pageContext.request.contextPath}/Admin/login">Đã có tài khoản? Đăng nhập!</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>

<script type="text/javascript">
            function validate() {
                var email = $('#email').val();
                var name = $('#name').val();
                var sdt = $('#sdt').val();
                var pass = $('#pass').val();
                var confirm = $('#confirm').val();
                
                var flag=true;
                if (name == '') {
                    $('#errEmail').text('')
                    $('#errSDT').text('')
                     $('#name').parent().next().html('Nhập tên !!!');
                    flag = false;
                }else{
                     $('#name').parent().next().html('');
                };
                
                if (sdt == '') {
                    $('#errSDT').text('')
                    $('#errEmail').text('')
                     $('#SDT').parent().next().html('Nhập sdt !!!');
                    flag = false;
                }else{
                     $('#sdt').parent().next().html('');
                };
                
                
                if (email == '') {
                    $('#errSDT').text('')
                    $('#errEmail').text('')
                     $('#email').parent().next().html('Nhập email !!!');
                    flag = false;
                }else{
                     $('#email').parent().next().html('');
                };
                
                
                if (pass == '') {
                    $('#errSDT').text('')
                    $('#errEmail').text('')
                     $('#pass').parent().next().html('Nhập mật khẩu !!!');
                    flag = false;
                }else{
                     $('#pass').parent().next().html('');
                };
                if (pass != confirm) {
                     $('#err').parent().next().html('Mật khẩu không khớp !!!');
                    flag = false;
                }else{
                     $('#err').parent().next().html('');
                };
                if (confirm == '') {
                    $('#errSDT').text('')
                    $('#errEmail').text('')
                     $('#err').parent().next().html('');
                     $('#confirm').parent().next().html('Nhập lại mật khẩu !!!');
                    flag = false;
                }else{
                     $('#confirm').parent().next().html('');
                };
                return flag;
            };
        </script>
</body>
