<%-- 
    Document   : menu
    Created on : Aug 12, 2022, 10:34:03 AM
    Author     : HOANG LAN COMPUTER
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

                <!-- Sidebar - Brand -->
                <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.html">
                    <div class="sidebar-brand-icon rotate-n-15">
                        <i class="fas fa-laugh-wink"></i>
                    </div>
                    <div class="sidebar-brand-text mx-3">SB Admin <sup>2</sup></div>
                </a>

                <!-- Divider -->
                <hr class="sidebar-divider my-0">

                <!-- Nav Item - Dashboard -->
                <li class="nav-item active">
                    <a class="nav-link" href="index.html">
                        <i class="fas fa-fw fa-tachometer-alt"></i>
                        <span>Dashboard</span></a>
                </li>

                <!-- Divider -->
                <hr class="sidebar-divider">

                <!-- Heading -->
                <div class="sidebar-heading">
                    Interface
                </div>

                <!-- Nav Item - Pages Collapse Menu -->
                <li class="nav-item">
                    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo"
                       aria-expanded="true" aria-controls="collapseTwo">
                        <i class="fas fa-fw fa-cog"></i>
                        <span>Quản lí đơn hàng</span>
                    </a>
                    <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                        <div class="bg-white py-2 collapse-inner rounded">
                            <h6 class="collapse-header">Đơn hàng</h6>
                            <a class="collapse-item" href="${pageContext.request.contextPath}/Admin/donhang/list">Đơn hàng mới</a>
                            <a class="collapse-item" href="${pageContext.request.contextPath}/Admin/donhang/listSuccessfully">Đơn hàng hoàn thành</a>
                            <a class="collapse-item" href="${pageContext.request.contextPath}/Admin/donhang/listHuy">Đơn hàng đã hủy</a>
                        </div>
                    </div>
                </li>

                <!-- Nav Item - Utilities Collapse Menu -->
                <li class="nav-item">
                    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities"
                       aria-expanded="true" aria-controls="collapseUtilities">
                        <i class="fas fa-fw fa-wrench"></i>
                        <span>Quản lí tài khoản</span>
                    </a>
                    <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities"
                         data-parent="#accordionSidebar">
                        <div class="bg-white py-2 collapse-inner rounded">
                            <h6 class="collapse-header">Quản lí tài khoản</h6>
                        
                            <a class="collapse-item" href="${pageContext.request.contextPath}/Admin/taikhoan/list">Tài khoản Admin</a>
                            <a class="collapse-item" href="${pageContext.request.contextPath}/Admin/taikhoanUser/list">Tài khoản User</a>
                            
                            <a class="collapse-item" href="${pageContext.request.contextPath}/Admin/vaitro/list">Vai Trò</a>
<!--                            <a class="collapse-item" href="${pageContext.request.contextPath}/Admin/taikhoan/listTK">Tài khoảǹ</a>-->
<!--                            <a class="collapse-item" href="utilities-other.html">Other</a>-->
                        </div>
                    </div>
                </li>

                <!-- Divider -->
                <hr class="sidebar-divider">

                <!-- Heading -->
                <div class="sidebar-heading">
                    Addons
                </div>

                <!-- Nav Item - Pages Collapse Menu -->
                <li class="nav-item">
                    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages"
                       aria-expanded="true" aria-controls="collapsePages">
                        <i class="fas fa-fw fa-folder"></i>
                        <span>Pages</span>
                    </a>
                    <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                        <div class="bg-white py-2 collapse-inner rounded">
                            <h6 class="collapse-header">Login Screens:</h6>
                            <a class="collapse-item" href="${pageContext.request.contextPath}/Admin/login">Login</a>
                        <a class="collapse-item" href="${pageContext.request.contextPath}/Admin/formRegister">Register</a>
                            <a class="collapse-item" href="${pageContext.request.contextPath}/Admin/forgot_password">Forgot Password</a>
                            <div class="collapse-divider"></div>
<!--                            <h6 class="collapse-header">Other Pages:</h6>
                            <a class="collapse-item" href="404.html">404 Page</a>
                            <a class="collapse-item" href="blank.html">Blank Page</a>-->
                            
                            
                        </div>
                    </div>
                </li>

                <!-- Nav Item - Charts -->
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/Admin/sanpham/list">
                        <i class="fas fa-fw fa-chart-area"></i>
                        <span>Quản lí Sản phẩm</span></a>
                </li>

                <!-- Nav Item - Tables -->
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/Admin/hangsanxuat/list">
                        <i class="fas fa-fw fa-table"></i>
                        <span>Hãng sản xuất</span>
                    </a>
                </li>

                <!-- Divider -->
                <hr class="sidebar-divider d-none d-md-block">

                <!-- Sidebar Toggler (Sidebar) -->
                <div class="text-center d-none d-md-inline">
                    <button class="rounded-circle border-0" id="sidebarToggle"></button>
                </div>

                <!-- Sidebar Message -->
                

            </ul>
    </body>
</html>
