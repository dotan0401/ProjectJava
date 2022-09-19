<%-- 
    Document   : login
    Created on : Aug 9, 2022, 8:56:12 AM
    Author     : HOANG LAN COMPUTER
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<jsp:include page="../head.jsp"></jsp:include>
<body class="bg-gradient-primary">
    <% 
        //đọc cookie
        Cookie[] cookie = request.getCookies();
        for(Cookie c:cookie){
            if (c.getName().equals("email")) {
                    pageContext.setAttribute("email", c.getValue());
                }
            if (c.getName().equals("password")) {
                    pageContext.setAttribute("password", c.getValue());
                }
        }
    %>
    <div class="container">

        <!-- Outer Row -->
        <div class="row justify-content-center">

            <div class="col-xl-10 col-lg-12 col-md-9">

                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">
                        <!-- Nested Row within Card Body -->
                        <div class="row">
                            <div class="col-lg-6 d-none d-lg-block bg-login-image"></div>
                            <div class="col-lg-6">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-4">Welcome Back!</h1>
                                        <span id="err" style="color: red">${err}</span>
                                    </div>
                                    
                                    
                                <form:form class="user" action="siginForm" method="post" onsubmit="return validate()" modelAttribute="nv">
                                    
                                        <div class="form-group">
                                            <input name="email" path="email" type="email"  value="${pageContext.getAttribute("email")}" class="form-control form-control-user"
                                                id="exampleInputEmail" aria-describedby="emailHelp"
                                                placeholder="Nhập email..." />
                                            
                                        </div>
                                                <div class="invalid-feedback" style="margin: 0 0 10px 10px ;display: block;font-size: 13px;color: red"> </div>
                                        <div class="form-group">
                                            <input name="password" path="password" type="password" value="${pageContext.getAttribute("password")}" class="form-control form-control-user"
                                                id="exampleInputPassword" placeholder="Mật khẩu" />
                                        </div>
                                          <div class="invalid-feedback" style="margin: 0 0 10px 10px ;display: block;font-size: 13px;color: red"> </div>
                                        <div style="margin-left: 10px;" class="form-group">
                                            <div class="custom-control custom-checkbox small">
                                                <input type="checkbox" name="remember" class="custom-control-input" id="customCheck">
                                                <label class="custom-control-label" for="customCheck">Remember
                                                    Me</label>
                                            </div>
                                        </div>
                                            <c:url var="login" value="login"></c:url>
                                        <button type="submit" class="btn btn-primary btn-user btn-block">
                                            Login
                                        </button>
                                        <hr>
<!--                                        <a href="#" class="btn btn-google btn-user btn-block">
                                            <i class="fab fa-google fa-fw"></i> Login with Google
                                        </a>
                                        <a href="#" class="btn btn-facebook btn-user btn-block">
                                            <i class="fab fa-facebook-f fa-fw"></i> Login with Facebook
                                        </a>-->
                                    </form:form>
                                    <hr>
                                    <div class="text-center">
                                        <a class="small" href="${pageContext.request.contextPath}/Admin/forgot_password">Quên mật khẩu?</a>
                                    </div>
                                    <div class="text-center">
                                        <a class="small" href="${pageContext.request.contextPath}/Admin/formRegister">Tạo tài khoản mới!</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>

    </div>

     <script type="text/javascript">
            function validate() {
                var email = $('#exampleInputEmail').val();
                
                var flag=true;
                if (email == '') {
                    $('#err').text('')
                     $('#exampleInputEmail').parent().next().html('Nhập email !!!');
                    flag = false;
                }else{
                     $('#exampleInputEmail').parent().next().html('');
                };
                var pass = $('#exampleInputPassword').val();
                
                var flag=true;
                if (pass == '') {
                    $('#err').text('')
                     $('#exampleInputPassword').parent().next().html('Nhập mật khẩu !!!');
                    flag = false;
                }else{
                     $('#exampleInputPassword').parent().next().html('');
                };
                return flag;
            };
        </script>

</body>
