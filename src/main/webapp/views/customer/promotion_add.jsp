<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<%@include file="../_navbar.jsp"%>--%>

<form class="container mt-3" method="post">
    <div class="row">
        <div class="col-3">
            <label class="mb-1">Ngày bắt đầu:</label>
            <input name="startDate" class="form-control" type="date"/>
        </div>
        <div class="col-3">
            <label class="mb-1">Ngày kết thúc:</label>
            <input name="endDate" class="form-control" type="date"/>
        </div>
        <div class="col-6">
            <label class="mb-1">Ghi chú:</label>
            <input name="note" class="form-control" />
        </div>
    </div>

    <table class="table mt-3">
        <thead>
            <tr>
                <th style="width: 25%">Sản phẩm</th>
                <th style="width: 20%">Loại khuyến mại</th>
                <th style="width: 22%">Lượng giảm giá</th>
                <th style="width: 22%">% giảm giá</th>
                <th></th>
            </tr>
        </thead>
        <c:if test="${empty dsKmct}">
            <tr>
                <td colspan="5">Chưa có sản phẩm khuyến mại</td>
            </tr>
        </c:if>
        <c:forEach items="${dsKmct}" var="kmct" varStatus="st">
            <tr>
                <td>
                    <select class="form-control"
                        onChange="updateSpKmct(${st.index}, this.value)"
                    >
                        <option value="">----</option>
                        <c:forEach items="${dsSanPham}" var="sp">
                            <option value="${sp.id}" ${kmct.product.id == sp.id? "selected" : ""}>
                                ${sp.name}
                            </option>
                        </c:forEach>
                    </select>
                </td>
                <td>
                    <select class="form-control"
                        onChange="updateLoaiKmct(${st.index}, this.value)"
                    >
                        <option value="1" ${kmct.type == 1? "selected" : ""}>Theo lượng giảm giá</option>
                        <option value="2" ${kmct.type == 2? "selected" : ""}>Theo % giảm giá</option>
                    </select>
                </td>
                <td>
                    <input class="form-control" type="number" value="${kmct.amount}"
                       onChange="updateLuongGiamGiaKmct(${st.index}, this.value)"/>
                </td>
                <td>
                    <input class="form-control" type="number" value="${kmct.percentage}"
                           onChange="updatePhanTramGiamGiaKmct(${st.index}, this.value)"/>
                </td>
                <td>
                    <a class="btn btn-danger" href="/delete-kmct/${st.index}">Xóa</a>
                </td>
            </tr>
        </c:forEach>
    </table>
    <a class="btn btn-secondary" href="/add-kmct">Thêm</a>
    <button class="btn btn-primary">Lưu lại</button>
</form>


<script>
    function updateSpKmct(index, idSp) {
        location.href = "/update-promotion-detail-product-id?index=" + index + "&productId=" + idSp;
    }
    function updateLoaiKmct(index, type) {
        location.href = "/update-promotion-detail-type?index=" + index + "&type=" + type;
    }
    function updateLuongGiamGiaKmct(index, amount) {
        location.href = "/update-promotion-detail-amount?index=" + index + "&amount=" + amount;
    }
    function updatePhanTramGiamGiaKmct(index, pctg) {
        location.href = "/update-promotion-detail-pctg?index=" + index + "&pctg=" + pctg;
    }
</script>