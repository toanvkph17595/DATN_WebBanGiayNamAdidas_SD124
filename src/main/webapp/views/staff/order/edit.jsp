
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
                        <div class="row">
                            <div class="col-6">
                                <label>Trạng thái:
                                    <c:if test="${ orders.status==0 }">Đang chờ</c:if>
                                    <c:if test="${ orders.status==1 }">Đã giao hàng</c:if>
                                    <c:if test="${ orders.status==2 }">Đã hoàn thành</c:if>
                                    <c:if test="${ orders.status==3 }">Đã hủy</c:if>
                                </label>
                            </div>
                            <div class="col-6">
                                <label>Phí vận chuyển:

                                </label>
                            </div>
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
                                    <th colspan="2" class="text-center"> Hành động</th>
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
                                        <td class="text-center">${ orderDetail.quantity }</td>
                                        <td class="text-center">
                                            <a class="btn btn-primary" href="/staff/order/orderDetail/edit/${orderDetail.id}">Sửa</a>
                                        </td>
                                        <td class="text-center">
                                            <a class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#deleteModal${orderDetail.id}">Xóa</a>
                                        </td>

                                        <!-- Modal -->
                                        <div class="modal fade" id="deleteModal${orderDetail.id}" tabindex="-1" aria-labelledby="exampleModalLabel1" aria-hidden="true">
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                    <div class="modal-header text-center">
                                                        <h1 class="modal-title" id="exampleModalLabel1" style="font-size: medium">Xác nhận xóa sản phẩm!</h1>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-7"></div>
                                                        <a type="button" class="btn btn-primary col" data-bs-dismiss="modal" style="font-size: small;margin: 5px 5px 5px 5px">Hủy</a>
                                                        <a href="/staff/order/orderDetail/delete/${ orderDetail.id }&${orders.id}" type="button" class="btn btn-danger col" style="font-size: small;margin: 5px 20px 5px 5px">Xác nhận</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </form:form>
                </div>
            <form action="/staff/order/save/${orders.id}">
                <div style="margin-bottom: 10px;padding-left: 100px;padding-right: 100px;line-height: 30px">
                    <div class="row">
                        <label class="col-2">Tổng giá:</label>
                        <label  class="col-2" style="text-align: right">${orders.total}</label>
                        <div class="col-8"></div>
                    </div>
                    <div class="row">
                        <label class="col-2">Phí vận chuyển:</label>
                        <input class="col-2" type="number" name="shippingFee" min="0" step="500" value="${orders.shippingFee}" style="width: 150px;text-align: right">
                        <div class="col-8"></div>
                    </div>
                    <div class="row">
                        <label class="col-2">Tổng đơn:</label>
                        <div  class="col-2" style="text-align: right">${orders.shippingFee + orders.total}</div>
                        <div class="col-8"></div>
                    </div>
                </div>
                <hr><br>
                <div style="text-align: center">
                    <a href="/staff/order/detail/${orders.id}" class="btn btn-secondary">Quay lại</a>
                    <button type="submit" class="btn btn-primary">Lưu</button>
                </div>
            </form>
        </div>
    </article>
</div>

<!-- Bootstrap js -->
<script src="/static/js/bootstrap.bundle.min.js"></script>

<!-- plugin -->
<script src="/static/plugins/fslightbox.js"></script>

<!-- Custom js -->
<script src="/static/js/script.js?v=2.0"></script>
</body>