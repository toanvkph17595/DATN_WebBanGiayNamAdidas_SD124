<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../fragment/header.jsp" %>
<div class="container p-3">
    <h4>Danh sách sản phẩm</h4>
    <table class="table mt-3">
        <thead>
            <tr>
                <th>Mã</th>
                <th>Tên</th>
                <th>Giá</th>
                <th>Ảnh</th>
                <th>Số lượng</th>
                <th>Trạng thái</th>
                <th>Danh mục</th>
                <th></th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${lstPro}" var="p">
                <tr>
                    <td>${p.id}</td>
                    <td>${p.name}</td>
                    <td>${p.price} đ</td>
                    <td><img class="product-img" src="../static/images/${p.image}" alt=""/></td>
                    <td>${p.quantity}</td>
                    <td>${p.description}</td>
                    <td>${p.category_id.name}</td>
                    <td>
                        <a href="/admin/product/edit/${p.id}" class="btn btn-sm btn-secondary">Sửa</a>
                        <a href="/admin/product/delete/${p.id}" class="btn btn-sm btn-danger">Xóa</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <a href="/admin/product/add" class="mt-3 btn btn-primary">Thêm</a>
</div>
<style>
    .product-img {
        max-width: 200px;
    }
</style>
