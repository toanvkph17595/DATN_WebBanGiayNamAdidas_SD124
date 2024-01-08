<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../fragment/header.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>

<div class="container mt-3">
    <h4>Danh sách nhóm sản phẩm</h4>
    <table class="table mt-3">
        <thead>
        <tr>
            <th>Mã</th>
            <th>Tên</th>
            <th></th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${lstCate}" var="cate">
            <tr>
                <td>${cate.id}</td>
                <td>${cate.name}</td>
                <td>
                    <a href="/admin/category/edit/${cate.id}" class="btn btn-sm btn-secondary">Sửa</a>
                    <a href="/admin/category/delete/${cate.id}" class="btn btn-sm btn-danger">Xóa</a>
                </td>

            </tr>
        </c:forEach>
        </tbody>
    </table>
    <a href="/admin/category/add" class="btn btn-primary">Thêm</a>

</div>
