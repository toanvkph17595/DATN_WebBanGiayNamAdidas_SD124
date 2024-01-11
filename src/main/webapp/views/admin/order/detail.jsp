<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../fragment/header.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
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
            <td>
                <input type="text" class="form-control" placeholder="Nhập Địa Chỉ" aria-label="DiaChi">
            </td>
            <th>Tỉnh:</th>
            <td>
                <select id="province" name="selectedProvince" onchange="changeProvince(this.value)" class="form-select form-select-sm" aria-label=".form-select-sm example">
                    <option value="">----Chọn Tỉnh----</option>
                    <c:forEach items="${lstProvince}" var="province">
                        <option value="${province.provinceID}">${province.provinceName}</option>
                    </c:forEach>
                </select>
            </td>
            <th>Quận-Huyện:</th>
            <td>
                <select id="district" name="district" onchange="changeDistrict(this.value)" class="form-select form-select-sm" aria-label=".form-select-sm example">
                    <option value="">----Chọn Quận-Huyện----</option>
                </select>
            </td>
            <th>Phường-Xã:</th>
            <td>
                <select id="ward" name="ward" class="form-select form-select-sm" aria-label=".form-select-sm example">
                    <option value="">----Chọn Phường - Xã----</option>
                </select>
            </td>
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
                <h5>Phí vận chuyển:</h5>
            </th>
            <td id="fee"></td>
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
    <script>

        function changeProvince(value) {
            if(value != "") {
                $.ajax({
                    url: "/api/districts/" + value, success: function (result) {
                        console.log(result);
                        let html = "<option value=''>----Chọn Quận-Huyện----</option>";
                        result.forEach(district => {
                            html += '<option value="' + district.districtID + '">' + district.districtName + '</option>';
                        });
                        $("#district").html(html);
                    }
                });
            }else {
                $("#district").html("<option value=''>----Chọn Quận-Huyện----</option>");
            }
        }

        function changeDistrict(value) {
            if(value != "") {
                $.ajax({
                    url: "/api/wards/" + value, success: function (result) {
                        console.log(result);
                        let html = "<option value=''>----Chọn Phường - Xã----</option>";
                        result.forEach(ward => {
                            html += '<option value="' + ward.wardCode + '">' + ward.wardName + '</option>';
                        });
                        $("#ward").html(html);
                    }
                });
                $.ajax({
                    url: "/api/fee?from_district_id=${from_district_id}&weight=${weight}&to_district_id=" + value, success: function (result) {
                        console.log(result);
                        $("#fee").html(result.fee);
                    }
                });
            }else {
                $("#ward").html("<option value=''>----Chọn Phường - Xã----</option>");
            }
        }
    </script>


</div>