<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="fragment/header.jsp"%>

<form class="container mt-3" action="/saveShippingInfo" method="post">
    <h4>Danh sách sản phẩm</h4>
    <table class="table mt-3">
        <thead>
        <tr>
            <th>Mã sản phẩm</th>
            <th>Tên sản phẩm</th>
            <th>Màu</th>
            <th>Kích cỡ</th>
            <th>Ảnh</th>
            <th>Số lượng</th>
            <th>Giá</th>
            <th>Tổng giá</th>
            <th></th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${carts}" var="c">
            <tr>
                <td>${c.productId}</td>
                <td>${c.productName}</td>
                <td>${c.colorName}</td>
                <td>${c.sizeName}</td>
                <td><img style="height: 100px" class="product-img" src="../static/images/${c.productImage}" alt=""/></td>
                <td>${c.quantity}</td>
                <td>${c.productPrice}</td>
                <td style="min-width: 150px">${c.productPrice * c.quantity}</td>
                <td>
                    <a href="/delete/${c.productId}" class="btn btn-sm btn-danger">Xóa</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <h4>Thông tin nhận hàng</h4>
    <div class="row mx-1 form-group">
        <label class="form-label">Địa chỉ:</label>
        <input name="address" class="form-control"/>
        <label class="text-danger">${errAddress}</label>
    </div>

    <div class="mt-2 row mx-1 form-group">
        <label class="form-label">Số ĐT:</label>
        <input name="phone" class="form-control"/>
        <label class="text-danger">${errPhone}</label>
    </div>

    <button class="my-3 btn btn-primary" type="submit">Đặt hàng</button>
</form>

<%@include file="fragment/footer.jsp"%>
