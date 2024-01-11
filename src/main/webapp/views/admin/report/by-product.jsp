<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../fragment/header.jsp"%>
<div class="container mt-3">
    <form method="post">
        <div class="row">
            <div class="col-4">
                <label>Từ ngày:</label>
                <input type="date" value="${param.fromDate}" name="fromDate" class="form-control">
            </div>
            <div class="col-4">
                <label>Đến ngày:</label>
                <input type="date" value="${param.toDate}" name="toDate" class="form-control">
            </div>
            <div class="col-4">
                <br/>
                <button class="btn btn-primary">Báo cáo</button>
            </div>
        </div>
    </form>
    <table class="table">
        <thead>
        <tr>
            <th>Sản phẩm</th>
            <th>Doanh thu</th>
            <th>Số lượng</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${data}" var="row">
            <tr>
                <td>${row[0]}</td>
                <td>${row[1]} đ</td>
                <td>${row[2]}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>