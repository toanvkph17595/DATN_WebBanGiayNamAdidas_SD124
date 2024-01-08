<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../fragment/header.jsp" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<div class="container mt-3">
    <h4>Thông tin nhóm sản phẩm</h4>
    <form:form method="post" modelAttribute="category"
        action="/admin/category/create">
        <div class="row">
            <div class="col-12">
                <label>Tên :</label>
                <form:input path="name" class="form-control"/>
            </div>
        </div>
        <div class="mt-3">
            <a href="/admin/category" class="btn btn-secondary">Quay lại</a>
            <button class="btn btn-primary" onclick="save()">Lưu lại</button>
        </div>
    </form:form>
    <script>
        function save(){
            Swal.fire({
                position: 'top-end',
                icon: 'success',
                title: 'Your work has been saved',
                showConfirmButton: false,
                timer: 1500
            })
        }
    </script>
</div>