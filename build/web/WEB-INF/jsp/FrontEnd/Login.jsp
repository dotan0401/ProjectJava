<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="<c:url value="/resources/StyleLogin.css"/>">
        <style>
            #ten_empty , #diachi_empty ,#sdt_empty,#email_empty,#pass_empty ,#email_empty1,#password_empty1{
                display: none;
                color: red;
            }
        </style>
        <title>Form</title>
    </head>
    <body>

        <div class="container" style="height: 580px;">
            <div class="blueBg" style="height: 500px;">
                <div class="box signin">
                    <h2>Already have an Account ?</h2>
                    <button class="signinBtn">Sigin in</button>
                </div>
                <div class="box signup">
                    <h2>Don't have an Account ?</h2>
                    <button class="signupBtn">Sigin up</button>
                </div>
            </div>
            <div class="formBx">
                <div class="form siginForm">
                    <form action="/Project4/loginCheck" method="POST" >
                        <h3>Sigin In</h3>
                        <a href="Profile.jsp"></a>
                        <input type="text" placeholder="Email" name="email" id="email1" required/>
                        <input type="password" placeholder="Password" name="password" id="pass1" required />
                        <div><p  style="color: red;">${msg}</p></div>
                        
                        <input type="submit" value="Login"/>
                        <!--<a href="#" class="forgot">Forgot Password</a>-->
                    </form>
                    <p>${param.error}</p>
                </div>

                <div class="form sigupForm">
                    <form action="/Project4/dangKy" method="POST" onsubmit = "return validate();">
                        <h3>Sigin Up</h3>
                        <input type="text" placeholder="Họ và tên" id="ten" name="ten" required/>

                        <input type="text" placeholder="Địa chỉ" id="diachi" name="diachi" required/>

                        <input type="number" placeholder="Số điện thoại" id="sdt" name="sdt" required/>

                        <input type="email" placeholder="Email" id="email" name="email" required/>

                        <input type="password" placeholder="Password" id="pass" name="pass" required/>

                        <input type="password" placeholder="Confirm Password" name="confirmPass" required/>
                        
                        <input type="submit" value="Register" class="signinBtn"/>
                    </form>
                </div>
            </div>
        </div>
        <script>
                    const  signinBtn = document.querySelector('.signinBtn');
                    const  signupBtn = document.querySelector('.signupBtn');
                    const  formBx = document.querySelector('.formBx');
                    const body = document.querySelector('body');
                    signupBtn.onclick = function () {
                    formBx.classList.add('active');
                            body.classList.add('active');
                    }
            signinBtn.onclick = function () {
            formBx.classList.remove('active');
                    body.classList.remove('active');
            }

         

//            function validate() {
////                alert("ok ");
//            var result = true;
//                    var ten = document.getElementById("ten").value;
////                alert(ten);
//                    var diachi = document.getElementById("diachi").value;
////                   alert(diachi);
//                    var sdt = document.getElementById("sdt").value;
//                    var email = document.getElementById("email").value;
//                    var pass = document.getElementById("pass").value;
//                    if (ten.length == 0) {
//            document.getElementById("ten_empty").style.display = "block";
//                    return false;
//            } else {
//            document.getElementById("ten_empty").style.display = "none";
//            }
//////                
//                if (diachi.length == 0) {
//                    document.getElementById("diachi_empty").style.display = "block";
//                    return false;
//                } else {
//                    document.getElementById("diachi_empty").style.display = "none";
//                }
////
//            if (sdt.length == 0) {
//            document.getElementById("sdt_empty").style.display = "block";
//                    return false;
//            } else {
//            document.getElementById("sdt_empty").style.display = "none";
//            }
//
//                if (email.length == 0) {
//                    document.getElementById("email_empty").style.display = "block";
//                    return false;
//                } else {
//                    document.getElementById("email_empty").style.display = "none";
//                }
//                
//                if (pass.length == 0) {
//                    document.getElementById("pass_empty").style.display = "block";
//                    return false;
//                } else {
//                    document.getElementById("pass_empty").style.display = "none";
//                }
//
//            return result;
//            }

           

        </script>
    </body>
</html>