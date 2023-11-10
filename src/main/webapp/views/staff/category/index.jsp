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
                    <div class="text-center fs-md-3 text-dark">Danh mục sản phẩm</div>
                </form>
            </div>
            <div>
                <table class="table table-bordered border-dark" style="font-size: small;line-height: 30px">
                    <thead>
                    <tr>
                        <th class="text-center"> Mã</th>
                        <th class="text-center"> Tên danh mục</th>
                        <th class="text-center"> Hành động</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${ data.content }" var="cate">
                        <tr>
                            <td class="">${ cate.id }</td>
                            <td class="">${ cate.name }</td>
                            <td class="text-center">
                                <a href="/staff/category/edit/${ cate.id }" class="btn btn-primary" style="font-size: small">Sửa</a>
                                <a class="btn btn-danger" style="font-size: small" data-bs-toggle="modal" data-bs-target="#deleteModal">Xóa</a>

                                <!-- Delete Modal -->
                                <div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header text-center">
                                                <h1 class="modal-title" id="exampleModalLabel" style="font-size: medium">Xác nhận xóa danh mục sản phẩm!</h1>
                                            </div>
                                            <div class="row">
                                                <div class="col-7"></div>
                                                <a type="button" class="btn btn-primary col" data-bs-dismiss="modal" style="font-size: small;margin: 5px 5px 5px 5px">Hủy</a>
                                                <a href="/staff/category/delete/${ cate.id }" type="button" class="btn btn-danger col" style="font-size: small;margin: 5px 20px 5px 5px">Xác nhận</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </td>
                        </tr>
                    </c:forEach>
                    <tr>
                        <td class="text-center" colspan="8">
                            <a href="/staff/category/add"><< Thêm mới >></a>
                        </td>
                    </tr>
                    </tbody>
                </table>
                <div>
                    <div class="pagination text-center" style="line-height: 40px">
                        <div style="margin-right: 32%">Trang:</div>
                        <div class="page-item" style="padding-left: 5px;padding-right: 5px;">
                            <a class="btn btn-success-light fw-bold" href="/staff/category/index">|<</a>
                        </div>
                        <c:if test="${ data.number >= 1 }">
                            <div class="page-item" style="padding-left: 5px;padding-right: 5px;">
                                <a class="btn btn-success-light fw-bold" href="/staff/category/index?page=${ data.number - 1 }"><<</a>
                            </div>
                        </c:if>
                        <c:if test="${ data.number == 0 }">
                            <div class="page-item" style="padding-left: 5px;padding-right: 5px;">
                                <a class="btn btn-success-light fw-bold" href=""><<</a>
                            </div>
                        </c:if>
                        <div class="page-item" style="padding-left: 5px;padding-right: 5px;color: black">
                            <a class="btn btn-success-light fw-bold" href="#"> ${ data.number + 1 } </a>
                        </div>
                        <c:if test="${ data.number <= data.totalPages - 2 }">
                            <div class="page-item" style="padding-left: 5px;padding-right: 5px;">
                                <a class="btn btn-success-light fw-bold" href="/staff/category/index?page=${ data.number + 1 }">>></a>
                            </div>
                        </c:if>
                        <c:if test="${ data.number == data.totalPages - 1 }">
                            <div class="page-item" style="padding-left: 5px;padding-right: 5px;">
                                <a class="btn btn-success-light fw-bold" href="">>></a>
                            </div>
                        </c:if>
                        <div class="page-item" style="padding-left: 5px;padding-right: 5px;">
                            <a class="btn btn-success-light fw-bold" href="/staff/category/index?page=${ data.totalPages - 1 }">>|</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </article>
</div>

<script>

</script>

<!-- Bootstrap js -->
<script src="/static/js/bootstrap.bundle.min.js"></script>

<!-- plugin -->
<script src="/static/plugins/fslightbox.js"></script>

<!-- Custom js -->
<script src="/static/js/script.js?v=2.0"></script>
</body>




