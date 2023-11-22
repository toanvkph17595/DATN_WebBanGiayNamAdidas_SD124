<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="fragment/header.jsp"%>

<div class="container">
    <section class="row">
        <div class="col mt-4">
            <div class="col mt-4">
                <div class="card">
                    <div class="card-body">
                        <table class="table table-striped table-inverse">
                            <thead class="thead-inverse">
                            <tr>
                                <th>ID</th>
                                <th>Product</th>
                                <th>Order_ID</th>
                                <th>Price</th>
                                <th>Quantity</th>
                                <th>Total</th>
                                <th>Status</th>

                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${lstOrderDetail}" var="orderDetail">
                                <tr>
                                    <td scope="row" disabled>${orderDetail.id}</td>
                                    <td>${orderDetail.productVariant_id.product_id.name}</td>
                                    <td>${orderDetail.order_id.id}</td>
                                    <td>${orderDetail.productVariant_id.product_id.price}</td>
                                    <td>${orderDetail.quantity}</td>
                                    <td>${orderDetail.productVariant_id.product_id.price * orderDetail.quantity }</td>
                                    <td>${orderDetail.order_id.status}</td>

                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>

<%@include file="fragment/footer.jsp"%>
