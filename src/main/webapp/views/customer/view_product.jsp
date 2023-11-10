<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ include file="../customer/fragment/header.jsp" %>

<section class="padding-y">
    <div class="container">
        <div class="row">
            <aside class="col-lg-6">
                <article class="gallery-wrap">
                        <div class="img-thumbnail" style="text-align: center">
                            <a data-fslightbox="mygalley" data-type="image" href="../static/images/${product.image}">
                                <img height="600px"  src="../static/images/${product.image}">
                            </a>

                        </div> <!-- img-big-wrap.// -->
                    <div class="thumbs-wrap">
                        <c:forEach items="${lstPro}" var="pv">
                                <a data-fslightbox="mygalley" data-type="image"
                                   href="../static/images/${pv.proImage_id.url}" class="item-thumb">
                                    <img width="60" height="60" src="../static/images/${pv.proImage_id.url}">
                                </a>
                        </c:forEach>
                    </div> <!-- thumbs-wrap.// -->
                </article> <!-- gallery-wrap .end// -->


            </aside>
            <main class="col-lg-6">
                <article class="ps-lg-3">
                    <h4 class="title text-dark">${product.name}</h4>
                    <div class="rating-wrap my-3">
                        <ul class="rating-stars">
                            <li style="width:80%" class="stars-active">
                                <img src="../static/images/stars-active.svg" alt="">
                            </li>
                            <li>
                                <img src="..static/images/starts-disable.svg" alt="">
                            </li>
                        </ul>
                        <b class="label-rating text-warning"> 4.5</b>
                        <i class="dot"></i>
                        <span class="label-rating text-muted"> <i class="fa fa-shopping-basket"></i> 154 lượt mua </span>
                        <i class="dot"></i>
                        <span class="label-rating text-success">${product.description}</span>
                    </div> <!-- rating-wrap.// -->

                    <div class="mb-3">
                        <var class="price h5">${product.price} đ</var>
                        <span class="text-muted">/đôi</span>
                    </div>

                    <dl class="row">
                        <dt class="col-2">Loại:</dt>
                        <dd class="col-10">${product.category_id.name}</dd>
                    </dl>
                    <hr>
                    <form method="post" action="/add-to-cart/${product.id}">
                        <div class="row mb-4">
                            <div class="col-md-12 col-12 mb-2">
                                <label class="form-label">Số lượng: </label>
                                <input name="quantity" type="number">
                            </div>
                        </div>
                        <div class="row mb-4">
                            <div class="col-md-12 col-12 mb-2">
                                <label class="form-label">Màu: </label>

                                <div class="thumbs-wrap">
                                    <input type="hidden" id="color_id" name="color_id">
                                    <c:forEach items="${lstPro}" var="cl">
                                        <button id="btn_color_${cl.color_id.id}" type="button" class="btn-color btn btn-light" onclick="chooseColor('${cl.color_id.id}')">
                                            ${cl.color_id.name}
                                        </button>

                                    </c:forEach>
                                </div>

                            </div> <!-- col.// -->
                        </div> <!-- row.// -->

                            <div class="row mb-4">
                                <div class="col-md-12 col-12 mb-2">
                                <label class="form-label" style="margin-right: 22px;">Kích cỡ: </label>
                                    <input type="hidden" id="size_id" name="size_id">
                                    <c:forEach items="${lstPro}" var="pv">
                                        <button id="btn_size_${pv.size_id.id}" type="button" class="btn-size btn btn-light" style="min-width: 85px;margin-top: 5px;"
                                            onclick="chooseSize('${pv.size_id.id}')">${pv.size_id.name}</button>
                                    </c:forEach>
                                </div> <!-- col.// -->
                            </div>

                        <a href="#" class="btn  btn-warning"> Mua ngay </a>
                        <button class="btn  btn-dark"> <i class="me-1 fa fa-shopping-basket"></i> Thêm vào giỏ hàng </button>
                        <a href="#" class="btn  btn-light"> <i class="me-1 fa fa-heart"></i></a>
                    </form>
                </article> <!-- product-info-aside .// -->
            </main> <!-- col.// -->
        </div> <!-- row.// -->

    </div> <!-- container .//  -->
</section>

<script>
    function  chooseColor(color_id) {
        $('#color_id').val(color_id);
        $('.btn-color').removeClass('btn-dark').addClass('btn-light');
        $('#btn_color_'+color_id).removeClass('btn-light').addClass('btn-dark');
    }
    function  chooseSize(size_id) {
        $('#size_id').val(size_id);
        $('.btn-size').removeClass('btn-dark').addClass('btn-light');
        $('#btn_size_'+size_id).removeClass('btn-light').addClass('btn-dark');
    }
</script>

<%@ include file="fragment/footer.jsp" %>