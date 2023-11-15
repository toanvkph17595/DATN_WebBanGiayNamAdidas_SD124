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
                <td>${c.productVariant_id.product_id.id}</td>
                <td>${c.productVariant_id.product_id.name}</td>
                <td>${c.productVariant_id.color_id.name}</td>
                <td><img style="height: 100px" class="product-img" src="../static/images/${c.productVariant_id.product_id.image}" alt=""/></td>
                <td>${c.productVariant_id.size_id.name}</td>
                <td>${c.quantity}</td>
                <td>${c.productVariant_id.product_id.price}</td>
                <td style="min-width: 150px">${c.productVariant_id.product_id.price * c.quantity}</td>
                <td>
                    <a href="/delete/${c.productId}" class="btn btn-sm btn-danger">Xóa</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <a href="/admin/product/add" class="mt-3 btn btn-primary">Thêm</a>
</div>

<%@ include file="fragment/footer.jsp" %>