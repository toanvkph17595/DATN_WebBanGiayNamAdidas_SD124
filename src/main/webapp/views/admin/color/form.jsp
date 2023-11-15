<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../fragment/header.jsp" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<div class="container mt-3">
  <h4>Thông tin màu sản phẩm</h4>
  <form:form method="post" modelAttribute="color"
             action="/admin/color/create">
    <div class="row">
      <div class="col-12">
        <label>Tên :</label>
        <form:input path="name" class="form-control"/>
      </div>
    </div>
    <div class="mt-3">
      <a href="/admin/color" class="btn btn-secondary">Quay lại</a>
      <button class="btn btn-primary">Lưu lại</button>
    </div>
  </form:form>
</div>

