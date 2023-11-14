
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
                    <div class="text-center fs-md-3 text-dark">Danh sách đơn hàng</div>
                </form>
            </div>

            <div class="row" style="margin-bottom: 10px">
                <div class="col-7" style="line-height: 35px">
                    Trạng thái:
                    <a href="/staff/order/index/0" style="text-decoration: none;margin-left: 10px">1.Tất cả</a>
                    <a href="/staff/order/index/1" style="text-decoration: none;margin-left: 10px">2. Đang chờ</a>
                    <a href="/staff/order/index/2" style="text-decoration: none;margin-left: 10px">3. Đã giao hàng</a>
                    <a href="/staff/order/index/3" style="text-decoration: none;margin-left: 10px">4. Đã hoàn thành</a>
                    <a href="/staff/order/index/4" style="text-decoration: none;margin-left: 10px">5. Đã hủy</a>
                </div>
<%--                <div class="col-5">--%>
<%--                    <form method="get" action="/staff/order/index/search">--%>
<%--                        <div class="row">--%>
<%--                            <div class="col-8">--%>
<%--                                <input name="search" placeholder="Nhập tên/số điện thoại khách hàng..." type="text" style="width: 100%;height: 35px;font-size: small"/>--%>
<%--                            </div>--%>
<%--                            <div class="col-4">--%>
<%--                                <button type="submit" class="btn btn-primary"  style="width: 100%;font-size: small">Tìm kiếm</button>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </form>--%>
<%--                </div>--%>
            </div>
            <div>
                <table class="table table-bordered border-dark" style="font-size: small;line-height: 30px">
                    <thead>
                    <tr>
                        <th class="text-center"> Mã hóa đơn</th>
                        <th class="text-center"> Họ và tên</th>
                        <th class="text-center"> Số điện thoại</th>
                        <th class="text-center"> Địa chỉ nhận</th>
                        <th class="text-center"> Tổng giá</th>
                        <th class="text-center"> Phí vận chuyển</th>
                        <th class="text-center"> Ngày tạo</th>
                        <th class="text-center"> Ngày giao</th>
                        <th class="text-center"> Trạng thái</th>
                        <th class="text-center"> Hành động</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${data.content}" var="order">
                        <tr>
                            <td class="">${ order.id }</td>
                            <td class="">${ order.userName.fullName }</td>
                            <td class="">${ order.recipientPhone }</td>
                            <td class="">${ order.recipientAddress }</td>
                            <td class="">${ order.total }</td>
                            <td class="">${ order.shippingFee }</td>
                            <td class="">${ order.createdDate }</td>
                            <td class="">${ order.deliverDate }</td>
                            <td class="">
                                <c:if test="${ order.status==0 }">Đang chờ</c:if>
                                <c:if test="${ order.status==1 }">Đã giao hàng</c:if>
                                <c:if test="${ order.status==2 }">Đã hoàn thành</c:if>
                                <c:if test="${ order.status==3 }">Đã hủy</c:if>
                            </td>
                            <td class="text-center">
                                <a href="/staff/order/detail/${ order.id }" class="btn btn-primary" style="font-size: small">Xem chi tiết</a>
<%--                                <a href="/staff/order/success/${ order.id }" type="button" class="btn btn-success col" style="font-size: small;margin: 5px 20px 5px 5px">Hoàn thành</a>--%>
                                <c:if test="${ order.status!=3 }">
                                    <a href="/staff/order/success3/${order.id}" class="btn btn-danger" style="font-size: small" data-bs-toggle="modal" data-bs-target="#deleteModal">Hủy</a>
                                </c:if>

                                <!-- Modal -->
                                <div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header text-center">
                                                <h1 class="modal-title" id="exampleModalLabel" style="font-size: medium">Xác nhận xóa nhân viên!</h1>
                                            </div>
                                            <div class="row">
                                                <div class="col-7"></div>
                                                <a type="button" class="btn btn-primary col" data-bs-dismiss="modal" style="font-size: small;margin: 5px 5px 5px 5px">Hủy</a>
                                                <a href="/staff/order/delete/${ order.id }" type="button" class="btn btn-danger col" style="font-size: small;margin: 5px 20px 5px 5px">Xác nhận</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <div>
                    <div class="pagination text-center" style="line-height: 40px">
                        <div style="margin-right: 32%">Trang:</div>
                        <div class="page-item" style="padding-left: 5px;padding-right: 5px;">
                            <a class="btn btn-success-light fw-bold" href="/staff/order/index/${status}">|<</a>
                        </div>
                        <c:if test="${ data.number >= 1 }">
                            <div class="page-item" style="padding-left: 5px;padding-right: 5px;">
                                <a class="btn btn-success-light fw-bold" href="/staff/order/index/${status}?page=${ data.number - 1 }"><<</a>
                            </div>
                        </c:if>
                        <c:if test="${ data.number == 0 }">
                            <div class="page-item" style="padding-left: 5px;padding-right: 5px;">
                                <a class="btn btn-success-light fw-bold" href=""><<</a>
                            </div>
                        </c:if>
                        <div class="page-item" style="padding-left: 5px;padding-right: 5px;color: black">
                            <a class="btn btn-success-light fw-bold" href="#"> ${ data.number + 1 } </a>
                        </div>
                        <c:if test="${ data.number <= data.totalPages - 2 }">
                            <div class="page-item" style="padding-left: 5px;padding-right: 5px;">
                                <a class="btn btn-success-light fw-bold" href="/staff/order/index/${status}?page=${ data.number + 1 }">>></a>
                            </div>
                        </c:if>
                        <c:if test="${ data.number == data.totalPages - 1 }">
                            <div class="page-item" style="padding-left: 5px;padding-right: 5px;">
                                <a class="btn btn-success-light fw-bold" href="">>></a>
                            </div>
                        </c:if>
                        <div class="page-item" style="padding-left: 5px;padding-right: 5px;">
                            <a class="btn btn-success-light fw-bold" href="/staff/order/index/${status}?page=${ data.totalPages - 1 }">>|</a>
                        </div>
                    </div>
                </div>
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




