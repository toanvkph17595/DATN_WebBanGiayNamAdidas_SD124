<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ include file="../fragment/header.jsp" %>

<div class="container p-3">
    <h4>Thông tin sản phẩm</h4>
    <form:form method="post" action="/admin/product/create"
    modelAttribute="product">
    <div class="row">
        <div class="col-6">
            <label>Tên sản phẩm:</label>
            <form:input path="name" class="form-control"/>
        </div>
        <div class="col-6">
            <label>Giá sản phẩm:</label>
            <form:input path="price" class="form-control"/>
        </div>
    </div>
    <div class="row mt-3">
        <div class="col-6">
            <label>Số lượng:</label>
            <form:input path="quantity" class="form-control"/>
        </div>
        <div class="col-6">
            <label>Ảnh sản phẩm:</label>
            <form:input path="image" class="form-control" type="file"/>
        </div>
    </div>
    <div class="row mt-3">
        <div class="col-6">
            <label>Danh mục sản phẩm:</label>
            <form:select path="category_id" name="category_id" class="form-select">
                <c:forEach items="${listCate}" var="cate">
                    <form:option value="${cate.id}"> ${cate.name}</form:option>
                </c:forEach>
            </form:select>
        </div>
        <div class="col-6">
            <label>Trạng thái:</label>
            <form:input path="description" class="form-control" />
        </div>
    </div>
    <div class="mt-3">
        <a href="/admin/product" class="btn btn-secondary">Quay lại</a>
        <button class="btn btn-primary">Lưu lại</button>
    </div>
    </form:form>
</div>