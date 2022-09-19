

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
                            <h1 class="h3 mb-2 text-gray-800">Tables</h1>


                            <!-- DataTales Example -->
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">Danh sách tai khoan</h6>
                                </div>
                                <div>
                                    
                                
                                </div>
                                <div style="display: flex">

                                    <div>
                                        <button  style="margin:20px 0 0 20px" class="btn btn-primary" ><a style="color: white;text-decoration: none" href="<c:url value="addNew"></c:url>">Thêm mới</a></button>
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
                                    <table class="table " id="dataTable" width="100%" cellspacing="0">
                                        <thead>
                                            <tr>
                                                <th scope="col">Mã</th>
                                                <th scope="col">Họ Tên</th>
                                                <th scope="col">Địa Chỉ</th>
                                                <th scope="col">Email</th>
                                                <th scope="col">Mật khẩu</th>
                                                <th scope="col">Số điện thoại</th>
                                                <th scope="col">Trạng thái</th>
                                                <th scope="col">Ngày tạo</th>
                                                <th scope="col">Ngày cập nhật</th>
                                                <th scope="col"></th>
                                            </tr>
                                        </thead>
                                        <c:forEach items="${nhanvien}" var="nv">
                                            <tbody>
                                                <tr>
                                                    <td>${nv.id}</td>
                                                    <td>${nv.hoTen}</td>
                                                    <td>${nv.diaChi}</td>
                                                    <td>${nv.email}</td>
                                                    <td>${nv.password}</td>
                                                    <td>${nv.sdt}</td>
                                                     <c:if test="${nv.status==true}">
                                                        <td><h5 style="color: gray;font-size: 12px">Active</h5></td>
                                                    </c:if>
                                                        <c:if test="${nv.status==false}">
                                                        <td><h5 style="color: red;font-size: 12px">Banned</h5></td>
                                                    </c:if>
                                                    <td><fmt:formatDate value="${nv.ngayTao}" pattern=" HH:mm (dd-MM-yyyy)" /></td>
                                                    <td><fmt:formatDate value="${nv.ngayCapNhat}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                                                    <td>
                                                        <button  type="submit" class="btn btn-warning"><a style="text-decoration: none;color: white" href="initupdate?id=${nv.id}">Cập nhật</a></button>
                                                        <button  type="submit" class="btn btn-danger">Xóa</button>
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
                                                <li class="active page-item"><a name="page" class="page-link" href="${pageContext.request.contextPath}/Admin/taikhoan/search?page=${i}&&keyword=<%= request.getParameter("keyword") != null ? request.getParameter("keyword") : ""  %>>${i}</a></li>
                                            </c:when>
                                            <c:otherwise>
                                               
                                                    <li class= " page-item"><a class="page-link" href="${pageContext.request.contextPath}/Admin/taikhoan/search?page=${i}&&keyword=<%= request.getParameter("keyword") != null ? request.getParameter("keyword") : ""  %>">${i}</a></li>
                                               
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







