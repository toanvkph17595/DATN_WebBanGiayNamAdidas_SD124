<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ include file="fragment/header.jsp" %>

<section class="padding-y">
    <div class="container">
        <div class="row">
            <aside class="col-lg-6">
                <article class="gallery-wrap">
                        <div class="img-big-wrap img-thumbnail">
                            <a data-fslightbox="mygalley" data-type="image" >
                                <img height="800" src="../static/images/${product.image}">
                            </a>

                        </div> <!-- img-big-wrap.// -->
                    <div class="thumbs-wrap">
<%--                        <c:forEach items="${lstImage}" var="img">--%>
                            <a data-fslightbox="mygalley" data-type="image"
                               href="" class="item-thumb">
                                <img width="60" height="60" src="../static/images/ultraboost-1.0_IG3088_01_atr.avif">
                            </a>
<%--                        </c:forEach>--%>
<%--                        <a data-fslightbox="mygalley" data-type="image"--%>
<%--                           href="images/items/Giay_Ultrabounce_Xam/Giay_Ultrabounce_Xam_03.avif" class="item-thumb">--%>
<%--                            <img width="60" height="60" src="images/items/Giay_Ultrabounce_Xam/Giay_Ultrabounce_Xam_03.avif">--%>
<%--                        </a>--%>
<%--                        <a data-fslightbox="mygalley" data-type="image"--%>
<%--                           href="images/items/Giay_Ultrabounce_Xam/Giay_Ultrabounce_Xam_04.avif" class="item-thumb">--%>
<%--                            <img width="60" height="60" src="images/items/Giay_Ultrabounce_Xam/Giay_Ultrabounce_Xam_04.avif">--%>
<%--                        </a>--%>
<%--                        <a data-fslightbox="mygalley" data-type="image"--%>
<%--                           href="images/items/Giay_Ultrabounce_Xam/Giay_Ultrabounce_Xam_5.avif" class="item-thumb">--%>
<%--                            <img width="60" height="60" src="images/items/Giay_Ultrabounce_Xam/Giay_Ultrabounce_Xam_5.avif">--%>
<%--                        </a>--%>
<%--                        <a data-fslightbox="mygalley" data-type="image"--%>
<%--                           href="images/items/Giay_Ultrabounce_Xam/Giay_Ultrabounce_Xam_06.avif" class="item-thumb">--%>
<%--                            <img width="60" height="60" src="images/items/Giay_Ultrabounce_Xam/Giay_Ultrabounce_Xam_06.avif">--%>
<%--                        </a>--%>
                    </div> <!-- thumbs-wrap.// -->
                </article> <!-- gallery-wrap .end// -->
            </aside>
            <main class="col-lg-6">
                <article class="ps-lg-3">
                    <h4 class="title text-dark">${product.name}</h4>
                    <div class="rating-wrap my-3">
                        <ul class="rating-stars">
                            <li style="width:80%" class="stars-active">
                                <img src="images/misc/stars-active.svg" alt="">
                            </li>
                            <li>
                                <img src="images/misc/starts-disable.svg" alt="">
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

                    <div class="row mb-4">
                        <div class="col-md-12 col-12 mb-2">
                            <label class="form-label" style="margin-right: 22px;">Kích cỡ: </label>
                            <c:forEach var="s" items="${lstSize}">
                                <button class="btn  btn-light" style="min-width: 85px;margin-top: 5px;">${s.name}</button>
                            </c:forEach>
                        </div> <!-- col.// -->
                    </div>
                    <!-- row.// -->
                    <div class="row mb-4">
                        <div class="col-md-12 col-12 mb-2">
                            <label class="form-label">Màu: </label>
                            <div class="thumbs-wrap">
                                <a href="">
                                    <img width="60" height="60" src="images/items/Giay_Ultrabounce_Trang/Giay_Ultrabounce_trang.avif">
                                </a>
                                <a href="">
                                    <img width="60" height="60"
                                         src="images/items/Giay_Ultrabounce_Mau_xanh_da_troi/Giay_Ultrabounce_Mau_xanh_da_troi.avif">
                                </a>
                                <a href="">
                                    <img width="60" height="60" src="images/items/Giay_Ultrabounce_DJo/Giay_Ultrabounce_DJo.avif">
                                </a>
                                <a href="">
                                    <img width="60" height="60"
                                         src="images/items/Giay_Ultrabounce_trang_xam/Giay_Ultrabounce_trang_xam.avif">
                                </a>
                                <a href="">
                                    <img width="60" height="60" src="images/items/Giay_Ultrabounce_DJen/Giay_Ultrabounce_DJen.avif">
                                </a>
                                <a href="">
                                    <img width="60" height="60"
                                         src="images/items/Giay_Ultrabounce_DJen_den/Giay_Ultrabounce_DJen_den.avif">
                                </a>
                            </div>
                        </div> <!-- col.// -->
                    </div> <!-- row.// -->
                    <a href="#" class="btn  btn-warning"> Mua ngay </a>
                    <a href="#" class="btn  btn-dark"> <i class="me-1 fa fa-shopping-basket"></i> Thêm vào giỏ hàng </a>
                    <a href="#" class="btn  btn-light"> <i class="me-1 fa fa-heart"></i></a>

                </article> <!-- product-info-aside .// -->
            </main> <!-- col.// -->
        </div> <!-- row.// -->

    </div> <!-- container .//  -->
</section>

<%@ include file="fragment/footer.jsp" %>