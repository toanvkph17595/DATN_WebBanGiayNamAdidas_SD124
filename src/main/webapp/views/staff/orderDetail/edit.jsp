
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
<%@ include file="../order/header.jsp" %>
<div class="row" style="min-height: 600px;">
    <%@ include file="../order/aside.jsp" %>
    <article class="col-md-10" style="background-color: white;">
        <div class="m-2 p-2">
            <div>
                <form class="pb-3">
                    <div class="text-center fs-md-3 text-dark">CHI TIẾT SẢN PHẨM ĐẶT HÀNG</div>
                </form>
            </div>

            <div style="margin-bottom: 10px;padding-left: 100px;padding-right: 100px;line-height: 40px;">
                <form:form modelAttribute="orderDetails" method="post" action="/staff/order/orderDetail/edit/save/${orderDetails.orders_id.id}&${orderDetails.productVariants_id.id}&${orderDetails.id}">
                    <div class="row">
                        <div class="col-6">
                            <div class="row">
                                <label class="col-4">Mã đơn hàng:</label>
                                <div class="col">${orderDetails.orders_id.id}</div>
                                <div class="col-1"></div>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="row">
                                <label class="col-4">Tên sản phẩm:</label>
                                <div class="col">${orderDetails.productVariants_id.product_id.name}</div>
                                <div class="col-1"></div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <div class="row">
                                <label class="col-4">Màu:</label>
                                <form:input path="color" class="form-control col" cssStyle="height: 30px"/>
                                <div class="col-2"></div>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="row">
                                <label class="col-4">Kích cỡ:</label>
                                <form:input path="size" class="form-control col" cssStyle="height: 30px"/>
                                <div class="col-2"></div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <div class="row">
                                <label class="col-4">Giá:</label>
                                <div class="col">${orderDetails.productVariants_id.product_id.price}</div>
                                <div class="col-1"></div>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="row">
                                <label class="col-4">Số lượng:</label>
                                <form:input path="quantity" class="form-control col" cssStyle="height: 30px"/>
                                <div class="col-2"></div>
                            </div>
                        </div>
                    </div>
                    <hr><br>
                    <div style="text-align: center">
                        <a href="/staff/order/edit/${orderDetails.orders_id.id}" class="btn btn-secondary">Quay lại</a>
                        <button type="submit" class="btn btn-primary">Lưu</button>
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