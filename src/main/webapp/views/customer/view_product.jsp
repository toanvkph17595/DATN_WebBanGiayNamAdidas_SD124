<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ include file="fragment/header.jsp" %>

<!-- ============== SECTION CONTENT ============== -->
<section class="padding-y">
    <div class="container">

        <div class="row">
            <aside class="col-lg-6">
                <article class="gallery-wrap">
                    <div class="img-big-wrap img-thumbnail">
                        <a data-fslightbox="mygalley" data-type="image" href="../static/images/${product.image}">
                            <img height="100%" src="../static/images/${product.image}">
                        </a>
                    </div> <!-- img-big-wrap.// -->
                    <div class="thumbs-wrap">
                        <c:forEach items="${lstImage}" var="img">
                            <a data-fslightbox="mygalley" data-type="image"
                               href="../static/images/${img.url}" class="item-thumb">
                                <img width="60" height="60" src="../static/images/${img.url}">
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
                                <img src="../static/misc/stars-active.svg" alt="">
                            </li>
                            <li>
                                <img src="../static/misc/starts-disable.svg" alt="">
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
                            <br>
                            <c:forEach var="s" items="${lstSize}">
                                <button class="btn  btn-light" style="min-width: 85px;margin-top: 5px;">${s.name}</button>
                            </c:forEach>
                        </div> <!-- col.// -->
                    </div> <!-- row.// -->
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
<!-- ============== SECTION CONTENT END// ============== -->

<!-- ============== SECTION  ============== -->
<section class="padding-y bg-light border-top">
    <div class="container">
        <div class="row">
            <div class="col-lg-8">
                <!-- =================== COMPONENT SPECS ====================== -->
                <div class="card">
                    <header class="card-header">
                        <ul class="nav nav-tabs card-header-tabs">
                            <li class="nav-item">
                                <a href="#" data-bs-target="#tab_specs" data-bs-toggle="tab" class="nav-link active">Mô tả</a>
                            </li>
                            <li class="nav-item">
                                <a href="#" data-bs-target="#tab_comment" data-bs-toggle="tab" class="nav-link">Bình luận</a>
                            </li>
                        </ul>
                    </header>
                    <div class="tab-content">
                        <article id="tab_specs" class="tab-pane show active card-body">
                            <b>ĐÔI GIÀY CHẠY BỘ ÊM ÁI CÓ SỬ DỤNG CHẤT LIỆU TÁI CHẾ.</b>
                            <p> Bạn đã sẵn sàng nâng dần cường độ tập luyện? Đôi giày adidas
                                này giúp bạn sải bước tiếp theo trên hành trình chạy bộ. Đệm
                                Bounce siêu nhẹ mang đến cảm giác thoải mái và linh hoạt để
                                trợ lực cho bạn khi tăng cường cự ly trên đường chạy hàng
                                ngày. Đế ngoài bằng cao su bền bỉ đảm bảo độ bám trên nhiều
                                bề mặt đa dạng để bạn tự tin sải bước.</p>
                        </article> <!-- tab-content.// -->
                        <article id="tab_comment" class="tab-pane show card-body">
                            <div class="container">
                                <div class="row">
                                    <div class="col-md-9">
                                        <label>Nội dung:</label>
                                        <textarea class="col-12" name="" id="" cols="" rows="5"></textarea>
                                    </div>
                                    <div class="col-md-3" style="text-align: center;margin-top: 20px;">
                                        <div>
                                            <ul class="rating-stars">
                                                <li style="width:100%" class="stars-active">
                                                    <img src="../static/misc/stars-active.svg" alt="">
                                                </li>
                                                <li>
                                                    <img src="../static/misc/starts-disable.svg" alt="">
                                                </li>
                                            </ul>
                                            <b class="label-rating text-warning"> 5</b>
                                        </div>
                                        <div style="margin-top: 30px;">
                                            <button class="btn btn-primary">Gửi</button>
                                        </div>
                                    </div>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-md-7">
                                        <b>Đánh giá:
                                            <ul class="rating-stars">
                                                <li style="width:80%" class="stars-active">
                                                    <img src="../static/misc/stars-active.svg" alt="">
                                                </li>
                                                <li>
                                                    <img src="../static/misc/starts-disable.svg" alt="">
                                                </li>
                                            </ul>
                                            <b class="label-rating text-warning"> 4.5</b>
                                        </b>
                                        <p>(134 lượt)</p>
                                    </div>
                                    <div class="col-md-5">
                                        <label>Sắp xếp theo:</label>
                                        <select name="" id="">
                                            <option value="">Mới nhất</option>
                                            <option value="">Đánh giá cao nhất</option>
                                            <option value="">Đánh giá thấp nhất</option>
                                        </select>
                                    </div>
                                </div>
                                <div style="margin-top: 30px;">
                                    <b>Nguyễn Tú</b>
                                    <div>
                                        <ul class="rating-stars">
                                            <li style="width:80%" class="stars-active">
                                                <img src="../static/misc/stars-active.svg" alt="">
                                            </li>
                                            <li>
                                                <img src="../static/misc/starts-disable.svg" alt="">
                                            </li>
                                        </ul>
                                    </div>
                                    <div style="margin-top: 10px;">
                                        <p>Sản phẩm tốt. Sử dụng rất bền và thoải mái.</p>
                                    </div>
                                    <div style="font-size: small;">Ngày đánh giá: 23/12/2021</div>
                                </div>
                                <div style="margin-top: 30px;">
                                    <b>Hoàng Mai</b>
                                    <div>
                                        <ul class="rating-stars">
                                            <li style="width:100%" class="stars-active">
                                                <img src="../static/misc/stars-active.svg" alt="">
                                            </li>
                                            <li>
                                                <img src="../static/misc/starts-disable.svg" alt="">
                                            </li>
                                        </ul>
                                    </div>
                                    <div style="margin-top: 10px;">
                                        <p>Tốt</p>
                                    </div>
                                    <div style="font-size: small;">Ngày đánh giá: 12/8/2019</div>
                                </div>
                                <div style="margin-top: 20px;">
                                    <a href="">Xem thêm >></a>
                                </div>
                        </article> <!-- tab-content.// -->
                    </div>
                </div>
                <!-- =================== COMPONENT SPECS .// ================== -->
            </div> <!-- col.// -->
            <aside class="col-lg-4">
                <!-- =================== COMPONENT ADDINGS ====================== -->
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Sản phẩm tương tự</h5>

                        <article class="itemside mb-3">
                            <a href="#" class="aside">
                                <img src="../static/images/${product.image}" width="96" height="96" class="img-md img-thumbnail">
                            </a>
                            <div class="info">
                                <a href="#" class="title mb-1"> <strong>Giày Pureboost 23</strong></a>
                                <p style="font-size: small;">Giày chạy</p>
                                <b class="price"> 3.700.000 đ</b> <!-- price.// -->
                            </div>
                        </article>

                        <article class="itemside mb-3">
                            <a href="#" class="aside">
                                <img src="../static/images/${product.image}" width="96" height="96" class="img-md img-thumbnail">
                            </a>
                            <div class="info">
                                <a href="#" class="title mb-1"> <strong>Giày Runfalcon 3</strong></a>
                                <p style="font-size: small;">Giày chạy</p>
                                <b class="price"> 1.800.000 đ</b> <!-- price.// -->
                            </div>
                        </article>

                        <article class="itemside mb-3">
                            <a href="#" class="aside">
                                <img src="../static/images/${product.image}" width="96" height="96" class="img-md img-thumbnail">
                            </a>
                            <div class="info">
                                <a href="#" class="title mb-1"> <strong>Giày Ultraboost</strong></a>
                                <p style="font-size: small;">Giày chạy</p>
                                <b class="price"> 5.200.000 đ</b> <!-- price.// -->
                            </div>
                        </article>

                        <article class="itemside mb-3">
                            <a href="#" class="aside">
                                <img src="../static/images/${product.image}" width="96" height="96" class="img-md img-thumbnail">
                            </a>
                            <div class="info">
                                <a href="#" class="title mb-1"> <strong>Giày Avryn</strong></a>
                                <p style="font-size: small;">Giày chạy</p>
                                <b class="price"> 3.800.000 đ</b> <!-- price.// -->
                            </div>
                        </article>

                        <article class="itemside mb-3">
                            <a href="#" class="aside">
                                <img src="../static/images/${product.image}" width="96" height="96" class="img-md img-thumbnail">
                            </a>
                            <div class="info">
                                <a href="#" class="title mb-1"> <strong>Giày COUNTRY XLG</strong></a>
                                <p style="font-size: small;">Giày chạy</p>
                                <b class="price"> 2.600.000 đ</b> <!-- price.// -->
                            </div>
                        </article>

                    </div> <!-- card-body .// -->
                </div> <!-- card .// -->
                <!-- =================== COMPONENT ADDINGS .// ================== -->
            </aside> <!-- col.// -->
        </div>

        <br><br>

    </div><!-- container // -->
</section>
<!-- =============== SECTION  END// ============== -->

<%@ include file="fragment/footer.jsp" %>