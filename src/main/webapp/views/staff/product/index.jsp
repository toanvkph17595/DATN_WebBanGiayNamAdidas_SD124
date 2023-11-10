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
                <th></th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${productList}" var="p">
                <tr>
                    <td>${p.code}</td>
                    <td>${p.name}</td>
                    <td>${p.price} đ</td>
                    <td><img class="product-img" src="${p.image}" alt=""/></td>
                    <td>
                        <a href="/admin/product/update/${p.id}" class="btn btn-sm btn-secondary">Sửa</a>
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
