<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="fragment/header.jsp" %>

    <div class="container">

        <div class="row">
            <aside class="col-lg-3">

                <button class="btn btn-outline-secondary mb-3 w-100  d-lg-none" data-bs-toggle="collapse"
                        data-bs-target="#aside_filter">Show filter</button>

                <!-- ===== Card for sidebar filter ===== -->
                <div id="aside_filter" class="collapse card d-lg-block mb-5">

                    <article class="filter-group">
                        <header class="card-header">
                            <a href="#" class="title" data-bs-toggle="collapse" data-bs-target="#collapse_aside1">
                                <i class="icon-control fa fa-chevron-down"></i> Danh mục
                            </a>
                        </header>
                        <div class="collapse show" id="collapse_aside1">
                            <div class="card-body">
                                <ul class="list-menu">
                                    <c:forEach items="${lstCate}" var="cate">
                                        <li ><a href="/filter/${cate.id}">${cate.name} </a></li>
                                    </c:forEach>

                                </ul>
                            </div> <!-- card-body.// -->
                        </div> <!-- collapse.// -->
                    </article> <!-- filter-group // -->

                    <article class="filter-group">
                        <header class="card-header">
                            <a href="#" class="title" data-bs-toggle="collapse" data-bs-target="#collapse_aside2">
                                <i class="icon-control fa fa-chevron-down"></i> Mức giá
                            </a>
                        </header>
                        <div class="collapse show" id="collapse_aside2">
                            <div class="card-body">
                                <div class="row mb-3">
                                    <div class="col-6">
                                        <label for="min" class="form-label">Min</label>
                                        <input class="form-control" id="min" placeholder="0" type="number">
                                    </div> <!-- col end.// -->

                                    <div class="col-6">
                                        <label for="max" class="form-label">Max</label>
                                        <input class="form-control" id="max" placeholder="10tr" type="number">
                                    </div> <!-- col end.// -->
                                </div> <!-- row end.// -->
                                <button class="btn btn-light w-100" type="button">Apply</button>
                            </div> <!-- card-body.// -->
                        </div> <!-- collapse.// -->
                    </article> <!-- filter-group // -->


                </div> <!-- card.// -->
                <!-- ===== Card for sidebar filter .// ===== -->

            </aside> <!-- col .// -->
            <main class="col-lg-9">

                <!-- ========= content items ========= -->
                <div class="row">
                    <c:forEach items="${lstPro.content}" var="p">
                        <div class="col-lg-4 col-md-6 col-sm-6">
                            <a href="/view-product/${p.id}">
                                <figure class="card card-product-grid"  style="background-color: rgb(238, 238, 238);">
                                    <div class="img-wrap">
                                        <img src="../static/images/${p.image}">
                                    </div>
                                    <figcaption class="info-wrap border-top">
                                        <div class="price-wrap">
                                            <strong class="price">${p.price} đ</strong>
                                        </div> <!-- price-wrap.// -->
                                        <p class="title mb-2">${p.name}</p>
                                    </figcaption>
                                </figure>
                            </a>
                        </div> <!-- col end.// -->
                    </c:forEach>
                </div>
                <footer class="d-flex mt-4 justify-content-center">
                    <%--                    <div>--%>
                    <%--                        <a href="javascript: history.back()" class="btn btn-light"> &laquo; Go back</a>--%>
                    <%--                    </div>--%>
                    <nav class="ms-3">
                        <ul class="pagination">
                            <li class="page-item">
                                <a class="page-link" href="/">First</a>
                            </li>
                            <c:if test="${lstPro.number != 0}">
                                <li class="page-item">
                                    <a class="page-link" href="/?page=${lstPro.number - 1}">Previous</a>
                                </li>
                            </c:if>
                            <li class="page-item"><a class="page-link" href="#">${lstPro.number}</a></li>

                            <li class="page-item">
                                <a class="page-link" href="/?page=${lstPro.number + 1}">Next</a>
                            </li>
                            <li class="page-item">
                                <a class="page-link" href="/?page=${lstPro.totalPages - 1}">Last</a>
                            </li>
                        </ul>
                    </nav>
                </footer>
            </main> <!-- col .// -->
        </div> <!-- row .// -->

    </div> <!-- container .//  -->
<!-- ============== SECTION CONTENT END// ============== -->


<%@ include file="fragment/footer.jsp" %>

