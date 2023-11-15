<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../fragment/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>

<div class="container mt-3">
    <h4>Danh sách màu sản phẩm</h4>
    <table class="table mt-3">
        <thead>
        <tr>
            <th>Mã</th>
            <th>Tên</th>
            <th></th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${lstColor}" var="color">
            <tr>
                <td>${color.id}</td>
                <td>${color.name}</td>
                <td>
                    <a href="/admin/color/edit/${color.id}" class="btn btn-sm btn-secondary">Sửa</a>
                    <a href="/admin/color/delete/${color.id}" class="btn btn-sm btn-danger">Xóa</a>
                </td>

            </tr>
        </c:forEach>
        </tbody>
    </table>
    <a href="/admin/color/add" class="btn btn-primary">Thêm</a>
</div>
