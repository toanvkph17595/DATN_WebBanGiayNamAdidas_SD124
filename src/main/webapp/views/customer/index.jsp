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
                                <i class="icon-control fa fa-chevron-down"></i> Danh mục sản phẩm
                            </a>
                        </header>
                        <div class="collapse show" id="collapse_aside1">
                            <div class="card-body">
                                <ul class="list-menu">
                                    <c:forEach items="${lstCate}" var="cate">
                                    <li><a href="/filter/${cate.id}">${cate.name} </a></li>
                                    </c:forEach>

                                </ul>
                            </div> <!-- card-body.// -->
                        </div> <!-- collapse.// -->
                    </article> <!-- filter-group // -->

                    <article class="filter-group">
                        <header class="card-header">
                            <a href="#" class="title" data-bs-toggle="collapse" data-bs-target="#collapse_aside2">
                                <i class="icon-control fa fa-chevron-down"></i> Giá
                            </a>
                        </header>
                        <div class="collapse show" id="collapse_aside2">
                            <form method="post">
                            <div class="card-body">
                                <div class="row mb-3">
                                    <div class="col-6">
<%--                                        <label class="form-label">Min</label>--%>
                                        <input class="form-control" name="min" placeholder="0" type="number">
                                    </div> <!-- col end.// -->

                                    <div class="col-6">
<%--                                        <label class="form-label">Max</label>--%>
                                        <input class="form-control" name="max" placeholder="10tr" type="number">
                                    </div> <!-- col end.// -->
                                </div> <!-- row end.// -->

                                <button class="btn btn-light w-100" type="button">Apply</button>
                            </div> <!-- card-body.// -->
                            </form>
                        </div> <!-- collapse.// -->
                    </article> <!-- filter-group // -->

                </div> <!-- card.// -->
                <!-- ===== Card for sidebar filter .// ===== -->

            </aside> <!-- col .// -->
            <main class="col-lg-9">

                <!-- ========= content items ========= -->
                <div class="row">
                    <c:forEach items="${data.content}" var="p">
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
<%--                                        <a href="/cart" class="btn btn-dark">Add to cart</a>--%>

                                        <!--<button id="btn-fv-${p.id}" class="btn btn-light btn-icon" onclick="addToFavorite(${p.id})" > <i id="heart-icon" class="fa fa-heart"></i> </button>-->
                                    </figcaption>
                                </figure>
                            </a>
                        </div> <!-- col end.// -->
                    </c:forEach>
                </div>
                <hr>
                <footer class="d-flex mt-4">
<%--                    <div>--%>
<%--                        <a href="javascript: history.back()" class="btn btn-light"> &laquo; Go back</a>--%>
<%--                    </div>--%>
                    <nav class="ms-3">
                        <ul class="pagination">
                            <li class="page-item">
                                <a class="page-link" href="/">First</a>
                            </li>
                            <c:if test="${data.number != 0}">
                            <li class="page-item">
                                <a class="page-link" href="/?page=${data.number - 1}">Previous</a>
                            </li>
                            </c:if>
                            <li class="page-item"><a class="page-link" href="#">${data.number}</a></li>
<%--                            <li class="page-item active" aria-current="page">--%>
<%--                                <span class="page-link">2</span>--%>
<%--                            </li>--%>
<%--                            <li class="page-item"><a class="page-link" href="#">3</a></li>--%>

                            <li class="page-item">
                                <a class="page-link" href="/?page=${data.number + 1}">Next</a>
                            </li>
                            <li class="page-item">
                                <a class="page-link" href="/?page=${data.totalPages - 1}">Last</a>
                            </li>
                        </ul>
                    </nav>
                </footer>

            </main> <!-- col .// -->
        </div> <!-- row .// -->

    </div> <!-- container .//  -->
</section>
<!-- ============== SECTION CONTENT END// ============== -->
<script>
    function addToFavorite(product_id){
        var xhr = new XMLHttpRequest();
        xhr.open("POST", "/add-to-favorite/" + product_id, true);
        xhr.send();

    }
    // $(document).ready(function (){
    //     $("heart-icon").click(function (){
    //         if ($(this).hasClass("liked")) {
    //             // Nếu có, loại bỏ lớp 'liked' và đổi màu về mặc định
    //             $(this).removeClass("liked");
    //             $(this).css("color", "");
    //         } else {
    //             // Nếu không, thêm lớp 'liked' và đổi màu sang đỏ
    //             $(this).addClass("liked");
    //             $(this).css("color", "red");
    //         }
    //     });
    // });

</script>

<%@ include file="fragment/footer.jsp" %>