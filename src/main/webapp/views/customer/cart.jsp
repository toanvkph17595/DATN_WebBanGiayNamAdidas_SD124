<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>

<%@ include file="fragment/header.jsp" %>

<div class="container p-3">
    <h4>Danh sách sản phẩm</h4>
    <table class="table mt-3">
        <thead>
        <tr>
            <th>Mã sản phẩm</th>
            <th>Tên sản phẩm</th>
            <th>Màu</th>
            <th>Ảnh</th>
            <th>Kích cỡ</th>
            <th>Số lượng</th>
            <th>Giá</th>
            <th>Tổng giá</th>
            <th></th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${lstCart}" var="c">
            <tr>
                <td>${c.productId}</td>
                <td>${c.productName}</td>
                <td>${c.colorName}</td>
                <td><img style="height: 100px" class="product-img" src="../static/images/${c.productImage}" alt=""/></td>
                <td>${c.sizeName}</td>
                <td>${c.quantity}</td>
                <td>${c.productPrice}</td>
                <td style="min-width: 150px">${c.productPrice * c.quantity}</td>
                <td>
                    <a href="#" class="btn btn-sm btn-danger">Xóa</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <a href="/admin/product/add" class="mt-3 btn btn-primary">Thêm</a>
</div>

<%@ include file="fragment/footer.jsp" %>