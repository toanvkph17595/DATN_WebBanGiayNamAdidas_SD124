<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../fragment/header.jsp" %>

<div class="container mt-3">
    <h4>Danh sách đơn hàng</h4>
    <form class="row nt-3">
        <div class="col-9">
            <input class="form-control" placeholder="Tìm kiếm theo tên/sđt khách hàng/tên sản phẩm" />
        </div>
        <div class="col-3">
            <button class="btn btn-primary">Tìm kiếm</button>
        </div>
    </form>
    <table class="table mt-3">
        <thead>
        <tr>
            <th style="width:25%">Khách hàng</th>
            <th style="width:25%">Sản phẩm</th>
            <th style="width:20%">Ngày mua</th>
            <th style="width:20%">Trạng thái</th>
            <th style="width:10%"></th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>Nguyễn Văn A (01231456)</td>
            <td>Acer 001 (Số lượng: 1)</td>
            <td>10:30:00 19/05/2022</td>
            <td>Đang chờ giao hàng</td>
            <td>
                <a class="btn btn-sm btn-secondary" href="/admin/order/detail/1">Xem</a>
            </td>
        </tr>
        <tr>
            <td>Nguyễn Văn B (03123123)</td>
            <td>Lenovo 002 (Số lượng: 1)</td>
            <td>11:30:00 20/05/2022</td>
            <td>Đã nhận hàng</td>
            <td>
                <a class="btn btn-sm btn-secondary" href="/admin/order/detail/2">Xem</a>
            </td>
        </tr>
        </tbody>
    </table>
    <nav aria-label="Page navigation example">
        <ul class="pagination">
            <li class="page-item"><a class="page-link" href="#/">&laquo;</a></li>
            <li class="page-item"><a class="page-link" href="#/">&lsaquo;</a></li>
            <li class="page-item"><a class="page-link" href="#/">&rsaquo;</a></li>
            <li class="page-item"><a class="page-link" href="#/">&raquo;</a></li>
        </ul>
        <span>Hiển thị 1-10 trên tổng số 25 đơn hàng</span>
    </nav>
</div>