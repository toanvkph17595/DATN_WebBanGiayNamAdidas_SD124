<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../_navbar.jsp"%>


<div class="container mt-3">
    <table class="table mt-3">
        <thead>
            <tr>
                <th>Ngày bắt đầu</th>
                <th>Ngày kết thúc</th>
                <th>Ghi chú</th>
                <th>Trạng thái</th>
                <th></th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${list}" var="km">
                <tr>
                    <td>${km.startDateDisplay}</td>
                    <td>${km.endDateDisplay}</td>
                    <td>${km.note}</td>
                    <td>${km.status==1?"Hoạt động" : "Không hoạt động"}</td>
                    <td></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <a href="/add-promotion" class="btn btn-primary">Thêm</a>
</div>