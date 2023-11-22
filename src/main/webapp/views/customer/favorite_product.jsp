<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ include file="fragment/header.jsp"%>

<div class="container">
    <div class="row">
        <main class="col-lg-10">
            <div class="row">
                <c:if test="${lstProfavor.size() == 0}">
                    <h3 style="text-align: center">Chưa có sản phẩm yêu thích nào</h3>
                </c:if>
                <c:if test="${lstProfavor.size() != 0}">
                <c:forEach items="${lstProfavor}" var="p">
                    <div class="col-lg-4 col-md-6 col-sm-6">
                        <a href="/view-product/${p.product_id.id}">
                            <figure class="card card-product-grid"  style="background-color: rgb(238, 238, 238);">
                                <div class="img-wrap">
                                    <img src="../static/images/${p.product_id.image}">
                                </div>
                                <figcaption class="info-wrap border-top">
                                    <div class="price-wrap">
                                        <strong class="price">${p.product_id.price} đ</strong>
                                    </div> <!-- price-wrap.// -->
                                    <p class="title mb-2">${p.product_id.name}</p>
                                </figcaption>
                            </figure>
                        </a>
                    </div> <!-- col end.// -->
                </c:forEach>
                </c:if>
            </div>
        </main>
    </div>
</div>

<%@ include file="fragment/footer.jsp"%>

