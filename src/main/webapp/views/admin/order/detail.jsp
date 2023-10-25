<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../fragment/header.jsp" %>
<div class="container mt-3">
    <h4>Thông tin đơn hàng</h4>
    <hr />
    <table class="table table-form">
        <tbody>
        <tr>
            <th colspan="2">
                <h5>Thông tin khách hàng</h5>
            </th>
        </tr>
        <tr>
            <th style="width:30%">Họ và tên:</th>
            <td>Nguyễn Văn A</td>
        </tr>
        <tr>
            <th>Số điện thoại:</th>
            <td>02321312</td>
        </tr>
        <tr>
            <th>Địa chỉ:</th>
            <td>Hà Nội</td>
        </tr>
        <tr>
            <th colspan="2">
                <h5>Thông tin sản phẩm</h5>
            </th>
        </tr>
        <tr>
            <td colspan="2">
                <table class="table">
                    <thead>
                        <tr>
                            <th>Tên sản phẩm</th>
                            <th>Số lượng</th>
                            <th>Đơn giá</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>Giày Ultrabounce</td>
                            <td>1</td>
                            <td>2400000</td>
                        </tr>
                        <tr>
                            <td>Giày Pureboost 23</td>
                            <td>2</td>
                            <td>3700000</td>
                        </tr>
                    </tbody>
                </table>
            </td>
        </tr>

        <tr>
            <th>
                <h5>Trạng thái đơn hàng:</h5>
            </th>
            <td>Đang chờ giao hàng</td>
        </tr>
        </tbody>
    </table>
    <div>
        <a class="btn btn-secondary" href="/admin/order">Quay lại</a>
        <button class="btn btn-primary">Xác nhận đã giao</button>
        <button class="btn btn-danger">Huỷ đơn hàng</button>
    </div>
</div>