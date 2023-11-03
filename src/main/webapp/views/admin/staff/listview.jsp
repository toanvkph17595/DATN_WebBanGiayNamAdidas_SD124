<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 31/10/2023
  Time: 22:53
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<head>
    <title>Quản lý website</title>

    <!-- Bootstrap css -->
    <link href="/static/css/bootstrap.css?v=2.0" rel="stylesheet" type="text/css" />

    <!-- Custom css -->
    <link href="/static/css/ui.css?v=2.0" rel="stylesheet" type="text/css" />
    <link href="/static/css/responsive.css?v=2.0" rel="stylesheet" type="text/css" />

    <!-- Font awesome 5 -->
    <link href="fonts/fontawesome/css/all.min.css" type="text/css" rel="stylesheet">
</head>
<body>
    <%@ include file="header.jsp" %>
    <div class="row" style="min-height: 600px;">
        <%@ include file="aside.jsp" %>
        <article class="col-md-10" style="background-color: white;">
            <div class="m-2 p-2">
                <div>
                    <form class="pb-3">
                        <div class="text-center fs-md-3 text-dark">Danh sách nhân viên</div>
                    </form>
                </div>
                <div>
                    <table class="table table-bordered border-dark">
                        <thead>
                        <tr>
                            <th class="text-center">Tên đăng nhập</th>
                            <th class="text-center">Họ và tên</th>
                            <th class="text-center">Email</th>
                            <th class="text-center">Ảnh</th>
                            <th class="text-center">Địa chỉ</th>
                            <th class="text-center">Trạng thái</th>
                            <th class="text-center">Hành động</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${data.content}" var="acc">
                            <tr>
                                <td class="">${ acc.userName }</td>
                                <td class="">${ acc.fullName }</td>
                                <td class="">${ acc.email }</td>
                                <td class="">${ acc.image }</td>
                                <td class="">${ acc.address }
                                        <%--                        <c:if--%>
                                        <%--                            test="${ acc.activated==0 }">Ngừng hoạt động</c:if>--%>
                                        <%--                        <c:if--%>
                                        <%--                            test="${ acc.activated==1 }">Đang hoạt động</c:if>--%>
                                </td>
                                <td class="">
                                        <%--                        <c:if test="${ acc.admin==0 }">Nhân viên</c:if>--%>
                                        <%--                        <c:if test="${ acc.admin==1 }">Quản trị viên</c:if>--%>
                                </td>
                                <td class="text-center">
                                    <btn href="" class="btn btn-primary">Sửa</btn>
                                    <btn href="" class="btn btn-danger">Xóa</btn>
                                        <%--                        /admin/accounts/edit/${ acc.id }--%>
                                </td>
                            </tr>
                        </c:forEach>
                        <tr>
                            <td class="text-center" colspan="8">
                                <a href=""><< Thêm mới >></a>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                    <div>
                        <div class="pagination text-center">
                            <div>Trang: </div>
                            <c:if test="${ data.number != 0 }">
                                <div class="page-item" style="padding-left: 5px;padding-right: 5px;">
                                    <a href="/admin/account/index">0</a>
                                </div>
                            </c:if>
                            <c:if test="${ data.number > 1 }">
                                <div class="page-item" style="padding-left: 5px;padding-right: 5px;">
                                    <a href="/admin/account/index?page=${ data.number - 1 }">${ data.number - 1 }</a>
                                </div>
                            </c:if>
                            <div class="page-item" style="padding-left: 5px;padding-right: 5px;">
                                <a href="#"> ${ data.number } </a>
                            </div>
                            <c:if test="${ data.number < data.totalPages - 2 }">
                                <div class="page-item" style="padding-left: 5px;padding-right: 5px;">
                                    <a href="/admin/account/index?page=${ data.number + 1 }">${ data.number + 1 }</a>
                                </div>
                            </c:if>
                            <c:if test="${ data.number < data.totalPages - 1 }">
                                <div class="page-item" style="padding-left: 5px;padding-right: 5px;">
                                    <a href="/admin/account/index?page=${ data.totalPages - 1 }">${ data.totalPages - 1 }</a>
                                </div>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
        </article>
    </div>

    <!-- Bootstrap js -->
    <script src="/static/js/bootstrap.bundle.min.js"></script>

    <!-- plugin -->
    <script src="/static/plugins/fslightbox.js"></script>

    <!-- Custom js -->
    <script src="/static/js/script.js?v=2.0"></script>
</body>




