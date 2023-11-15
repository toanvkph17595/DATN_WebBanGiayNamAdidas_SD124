
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<head>
    <title>Quản lý website</title>

    <!-- Bootstrap css -->
    <link href="/static/css/bootstrap.css?v=2.0" rel="stylesheet" type="text/css" />

    <!-- Custom css -->
    <link href="/static/css/ui.css?v=2.0" rel="stylesheet" type="text/css" />
    <link href="/static/css/responsive.css?v=2.0" rel="stylesheet" type="text/css" />

    <!-- Font awesome 5 -->
    <link href="fonts/fontawesome/css/all.min.css" type="text/css" rel="stylesheet">
</head>
<body>
<%@ include file="header.jsp" %>
<div class="row" style="min-height: 600px;">
    <%@ include file="aside.jsp" %>
    <article class="col-md-10" style="background-color: white;">
        <div class="m-2 p-2">
            <div>
                <form class="pb-3">
                    <div class="text-center fs-md-3 text-dark">CHI TIẾT ĐƠN HÀNG</div>
                </form>
            </div>

            <div style="margin-bottom: 10px;padding-left: 100px;padding-right: 100px;line-height: 30px">
                <form:form modelAttribute="orders">
                    <div class="row">
                        <div class="col-6">
                            <label>Mã đơn hàng: ${orders.id}</label>
                        </div>
                        <div class="col-6">
                            <label>Họ và tên: ${orders.userName.fullName}</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <label>Số điện thoại: ${orders.recipientPhone}</label>
                        </div>
                        <div class="col-6">
                            <label>Địa chỉ: ${orders.recipientAddress}</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <label>Ngày mua: ${orders.createdDate}</label>
                        </div>
                        <div class="col-6">
                            <label>Ngày giao: ${orders.deliverDate}</label>
                        </div>
                    </div>
                    <div>
                        <label>Trạng thái:
                            <c:if test="${ orders.status==0 }">Đang chờ</c:if>
                            <c:if test="${ orders.status==1 }">Đã giao hàng</c:if>
                            <c:if test="${ orders.status==2 }">Đã hoàn thành</c:if>
                            <c:if test="${ orders.status==3 }">Đã hủy</c:if>
                        </label>
                    </div>
                    <br>
                    <div>
                        <table class="table table-bordered border-dark" style="font-size: small;line-height: 30px">
                            <thead>
                            <tr>
                                <th class="text-center"> Mã sản phẩm</th>
                                <th class="text-center"> Tên sản phẩm</th>
                                <th class="text-center"> Màu</th>
                                <th class="text-center"> Kích cỡ</th>
                                <th class="text-center"> Đơn giá</th>
                                <th class="text-center"> Số lượng</th>
                                <th class="text-center"> Tổng giá</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${data}" var="orderDetail">
                                <tr>
                                    <td class="">${ orderDetail.productVariants_id.id }</td>
                                    <td class="">${ orderDetail.productVariants_id.product_id.name }</td>
                                    <td class="">${ orderDetail.color }</td>
                                    <td class="">${ orderDetail.size }</td>
                                    <td class="" style="text-align: right">${ orderDetail.productVariants_id.product_id.price }</td>
                                    <td class="" style="text-align: center">${ orderDetail.quantity }</td>
                                    <td class="" style="text-align: right">${ orderDetail.productVariants_id.product_id.price*orderDetail.quantity }</td>
                                </tr>
                            </c:forEach>
                            <tr style="border: white;text-align: right">
                                <td colspan="6" style="">Tổng giá:</td>
                                <td>${orders.total}</td>
                            </tr>
                            <tr style="border: white;text-align: right">
                                <td colspan="6">Phí vận chuyển:</td>
                                <td>${orders.shippingFee}</td>
                            </tr>
                            <tr style="border: white;text-align: right">
                                <td colspan="6">Tổng đơn:</td>
                                <td>${orders.shippingFee + orders.total}</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <hr><br>
                    <div style="text-align: center">
                        <a href="/staff/order/index/0" class="btn btn-secondary">Quay lại</a>
                        <c:if test="${ orders.status==0 }">
                            <a href="/staff/order/success0/${orders.id}" class="btn btn-success">Đã giao hàng</a>
                        </c:if>
                        <c:if test="${ orders.status==1 }">
                            <a href="/staff/order/success1/${orders.id}" class="btn btn-success">Đã hoàn thành</a>
                        </c:if>
                        <a href="" class="btn btn-primary">Sửa</a>
                    </div>
                </form:form>
            </div>

        </div>
    </article>
</div>

<script>


</script>

<!-- Bootstrap js -->
<script src="/static/js/bootstrap.bundle.min.js"></script>

<!-- plugin -->
<script src="/static/plugins/fslightbox.js"></script>

<!-- Custom js -->
<script src="/static/js/script.js?v=2.0"></script>
</body>