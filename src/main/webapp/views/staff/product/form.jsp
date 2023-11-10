<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../fragment/header.jsp" %>
<div class="container p-3">
    <h4>Thông tin sản phẩm</h4>
    <div class="row">
        <div class="col-6">
            <label>Mã sản phẩm:</label>
            <input class="form-control"/>
        </div>
        <div class="col-6">
            <label>Tên sản phẩm:</label>
            <input class="form-control"/>
        </div>
    </div>
    <div class="row mt-3">
        <div class="col-6">
            <label>Giá sản phẩm:</label>
            <input class="form-control"/>
        </div>
        <div class="col-6">
            <label>Ảnh sản phẩm:</label>
            <input class="form-control" type="file"/>
        </div>
    </div>
    <div class="mt-3">
        <a href="/admin/product" class="btn btn-secondary">Quay lại</a>
        <button class="btn btn-primary">Lưu lại</button>
    </div>
</div>