<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ include file="fragment/header.jsp"%>

<div class="container p-3">
    <h4>Sản phẩm yêu thích</h4>
    <table class="table mt-3">
        <thead>
        <tr>
            <th>Mã</th>
            <th>Tên sản phẩm</th>
            <th>Ảnh</th>
            <th>Số lượng</th>
            <th>Giá</th>
            <th></th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${lstProfavor}" var="fp">
            <tr>
                <td>${fp.product_id.id}</td>
                <td>${fp.product_id.name}</td>
                <td><img style="height: 100px" class="product-img" src="../static/images/${fp.product_id.image}" alt=""/></td>
                <td>${fp.product_id.quantity}</td>
                <td>${fp.product_id.price}</td>
                <td>
                    <a href="/deleteFavorite/${fp.id}" class="btn btn-sm btn-danger">Xóa</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <a href="/admin/product/add" class="mt-3 btn btn-primary">Thêm</a>
</div>

<%@ include file="fragment/footer.jsp"%>

