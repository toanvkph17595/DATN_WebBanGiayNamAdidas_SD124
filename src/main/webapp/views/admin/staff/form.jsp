<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 31/10/2023
  Time: 22:53
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
                    <div class="text-center fs-md-3 text-dark">Thông tin nhân viên</div>
                </form>
            </div>
            <%--@elvariable id="acc" type=""--%>
            <form:form method="post" modelAttribute="account"
                       action="/admin/account/save">
                <div class="row">
                    <div class="col-6">
                        <label>Tên đăng nhập*: </label>
                        <form:input path="userName" class="form-control" type="text"/>
                    </div>
                    <div class="col-6">
                        <label>Mật khẩu*: </label>
                        <form:input path="password" class="form-control" type="text"/>
                    </div>
                    <div class="col-6">
                        <label>Họ và tên*: </label>
                        <form:input path="fullName" class="form-control" type="text"/>
                    </div>
                    <div class="col-6">
                        <label>Email: </label>
                        <form:input path="email" class="form-control" type="email" placeholder="abc@gmail.com"/>
                    </div>
                    <div class="col-6">
                        <label>Số điện thoại: </label>
                        <form:input path="phone" class="form-control" type="text"/>
                    </div>
                    <div class="col-6">
                        <label>Địa chỉ: </label>
                        <form:input path="address" class="form-control" type="text"/>
                    </div>
                    <div class="col-6">
                        <label>Ảnh: </label>
                        <input name="image" class="form-control" type="file"/>
                    </div>
                </div>
                <div class="mt-3">
                    <a href="/admin/account/index/1" class="btn btn-secondary">Quay lại</a>
                    <button class="btn btn-primary" type="submit">Lưu</button>
                </div>
            </form:form>
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