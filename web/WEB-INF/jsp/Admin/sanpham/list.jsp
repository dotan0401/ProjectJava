

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="d" uri="http://java.sun.com/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib  prefix="i" uri="http://www.springframework.org/tags" %>
<%
//    if (session.getAttribute("email") == null) {
//        response.sendRedirect("Admin/login");
//    }
%>
<style>
    table > thead > tr > th{
        font-size: 12px;
    }
    table > tbody > tr > td{
        font-size: 12px;
    }
    
</style>
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
                            <h1 class="h3 mb-2 text-gray-800">Tables</h1>


                            <!-- DataTales Example -->
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">Danh sách sản phẩm </h6>
                                </div>
                                <div>
                                    
                                
                                </div>
                                <div style="display: flex">

                                    <div>
                                        <button  style="margin:20px 0 0 20px" class="btn btn-primary" ><a style="color: white;text-decoration: none" href="${pageContext.request.contextPath}/Admin/sanpham/addnew">Thêm mới</a></button>
                                    </div>
                                     <div style="margin-top: 20px">
                                        <form action="search"
                                              class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
                                            <div class="input-group">
                                                <input value="<%= request.getParameter("keyword") != null ? request.getParameter("keyword") : "" %>" name="keyword" type="text" class="form-control bg-light border-0 small" placeholder="Search for name ..."
                                                   aria-label="Search" aria-describedby="basic-addon2">
                                            <div class="input-group-append">
                                                <button class="btn btn-primary" type="submit">
                                                    <i class="fas fa-search fa-sm"></i>
                                                </button>
                                            </div>
                                        </div>
                                    </form>
                                </div>

                                   
                            </div>
                            
<h6 style="color: brown;margin: 20px 0 0 30px">Số bản ghi : ${counter}</h6>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table" id="dataTable" width="100%" cellspacing="0">
                                        <thead>
                                            <tr>
                                                <th scope="col">Mã</th>
                                                <th scope="col">Tên Sản phẩm</th>
                                                <th scope="col">Tên hãng</th>
                                                <th scope="col">CPU</th>
                                                <th scope="col">Màn hình</th>
                                                <th scope="col">Đơn giá</th>
                                                <th scope="col">Đã bán</th>
                                                <th scope="col">Trong kho</th>
                                                <th scope="col">Trang thai</th>
                                                
                                                <th scope="col"></th>
                                            </tr>
                                        </thead>
                                        <c:forEach items="${sp}" var="sp">
                                            <tbody>
                                                <tr>
                                                    <td>${sp.id}</td>
                                                    <td>${sp.ten}</td>
                                                    <td>${sp.maHangSanXuat.ten}</td>
                                                    <td>${sp.cpu}</td>
                                                    <td>${sp.manHinh}</td>
                                                    <td>
                                                        <fmt:formatNumber value = "${sp.donGia}" type = "currency"/>
                                                        </td>
                                                    <td>${sp.donViBan}</td>
                                                    <td>${sp.donViKho}</td>
                                                    
                                                    
                                                    
                                                    <c:if test="${sp.status==true}">
                                                        <td><h5 style="color: gray;font-size: 12px">Active</h5></td>
                                                    </c:if>
                                                        <c:if test="${sp.status==false}">
                                                        <td><h5 style="color: red;font-size: 12px">Banned</h5></td>
                                                    </c:if>
                                                    
<!--                                                    <td><fmt:formatDate value="${sp.ngayTao}" pattern=" HH:mm (dd-MM-yyyy)" /></td>
                                                    <td><fmt:formatDate value="${sp.ngayCapNhat}" pattern="HH:mm (dd-MM-yyyy)" /></td>-->
                                                    <td>
                                                        <button  type="submit" class="btn btn-warning"><a style="text-decoration: none;color: white;font-size: 12px" href="update?id=${sp.id}&&idCat=${sp.maHangSanXuat.id}">Cập nhật</a></button>
                                                        <button  type="submit" class="btn btn-primary"><a style="text-decoration: none;color: white;font-size: 12px" href="detail?id=${sp.id}">Chi tiết</a></button>
                                                        <button  type="submit" class="btn btn-primary"><a style="text-decoration: none;color: white;font-size: 12px" href="listImage?id=${sp.id}">Ảnh</a></button>
                                                        
                                                    </td>

                                                </tr>
                                            </tbody>
                                        </c:forEach>

                                    </table>
                                </div>
                            </div>
                            
                                    
                                    <nav aria-label="...">
                                <ul class="pagination">
                                    <li class="page-item disabled">
                                        <span class="page-link">Previous</span>
                                    </li>
<!--                                    <li class="page-item"><a class="page-link" href="">1</a></li>
                                    <li class="page-item active">
                                        <span class="page-link">
                                            2
                                            <span class="sr-only">(current)</span>
                                        </span>
                                    </li>
                                    <li class="page-item"><a class="page-link" href="">3</a></li>-->
                                    
                                    <c:forEach var="i" begin="1" end="${totalPage}">
                                        <c:choose>
                                            <c:when test="${page==i}">
                                                <li class="active page-item"><a name="page" class="page-link" href="${pageContext.request.contextPath}/Admin/sanpham/search?page=${i}&&keyword=<%= request.getParameter("keyword") != null ? request.getParameter("keyword") : ""  %>>${i}</a></li>
                                            </c:when>
                                            <c:otherwise>
                                               
                                                    <li class= " page-item"><a class="page-link" href="${pageContext.request.contextPath}/Admin/sanpham/search?page=${i}&&keyword=<%= request.getParameter("keyword") != null ? request.getParameter("keyword") : ""  %>">${i}</a></li>
                                               
                                            </c:otherwise>
                                        </c:choose>
                                        
                                    </c:forEach>
                                    <li class="page-item">
                                        <a class="page-link" href="#">Next</a>
                                    </li>
                                </ul>
                            </nav>
                                    
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







