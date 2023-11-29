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
                                <input name="quantity" type="number" value="1">
                            </div>
                        </div>
                        <div class="row mb-4">
                            <div class="col-md-12 col-12 mb-2">
                                <label class="form-label">Màu: </label>

                                <div class="thumbs-wrap">
                                    <input type="hidden" id="color_id" name="color_id">
                                    <c:forEach items="${colors}" var="cl">
                                        <button id="btn_color_${cl.id}" type="button" class="btn-color btn btn-light" onclick="chooseColor('${cl.id}')">
                                            ${cl.name}
                                        </button>

                                    </c:forEach>
                                </div>

                            </div> <!-- col.// -->
                        </div> <!-- row.// -->

                            <div class="row mb-4">
                                <div class="col-md-12 col-12 mb-2">
                                <label class="form-label" style="margin-right: 22px;">Kích cỡ: </label>
                                    <input type="hidden" id="size_id" name="size_id">
                                    <c:forEach items="${sizes}" var="sz">
                                        <button id="btn_size_${sz.id}" type="button" class="btn-size btn btn-light" style="min-width: 85px;margin-top: 5px;"
                                            onclick="chooseSize('${sz.id}')">${sz.name}</button>
                                    </c:forEach>
                                </div> <!-- col.// -->
                            </div>

                        <button class="btn  btn-warning"> Mua ngay </button>
                        <button class="btn  btn-dark"> <i class="me-1 fa fa-shopping-basket"></i> Thêm vào giỏ hàng </button>
                        <c:if test="${acc != null}">
                            <c:if test="${liked}">
                                <a href="/delete-favorite/${product.id}" class="btn  btn-light">
                                    <i class="me-1 fa fa-heart text-danger"></i>
                                </a>
                            </c:if>
                            <c:if test="${!liked}">
                                <a href="/add-to-favorite/${product.id}" class="btn  btn-light">
                                    <i class="me-1 fa fa-heart"></i>
                                </a>
                            </c:if>
                        </c:if>
                    </form>
                </article> <!-- product-info-aside .// -->
            </main> <!-- col.// -->
        </div> <!-- row.// -->

    </div> <!-- container .//  -->
</section>
<section class="padding-y bg-light border-top">
    <div class="container">
        <div class="row">
            <div class="col-lg-8">
                <!-- =================== COMPONENT SPECS ====================== -->
                <div class="card">
                    <header class="card-header">
                        <ul class="nav nav-tabs card-header-tabs">
                            <li class="nav-item">
                                <a href="#" data-bs-target="#tab_comment" data-bs-toggle="tab" class="nav-link active">Bình luận</a>
                            </li>
                            <li class="nav-item">
                                <a href="#" data-bs-target="#tab_specs" data-bs-toggle="tab" class="nav-link ">Mô tả</a>
                            </li>
                        </ul>
                    </header>
                    <div class="tab-content">
                        <article id="tab_comment" class="tab-pane show active card-body">
                            <div class="container">
                                <form action="/comment/${product.id}" method="post" id="commentForm">
                                    <div class="row">
                                        <div class="col-md-9 text-center">
<%--                                            <label>Đánh giá:</label>--%>
                                            <a class="stars btn-light" type="button" onclick="setRating(1)">
                                                <i class="fas fa-star text-warning" id="star1"></i>
                                            </a>
                                            <input type="hidden" name="rating" id="rating" value="1">
                                            <a class="stars btn-light" type="button" onclick="setRating(2)">
                                                <i class="fas fa-star text-warning" id="star2"></i>
                                            </a>
                                            <input type="hidden" name="rating" id="rating" value="2">
                                            <a class="stars btn-light" type="button" onclick="setRating(3)">
                                                <i class="fas fa-star text-warning" id="star3"></i>
                                            </a>
                                            <input type="hidden" name="rating" id="rating" value="3">
                                            <a class="stars btn-light" type="button" onclick="setRating(4)">
                                                <i class="fas fa-star text-warning" id="star4"></i>
                                            </a>
                                            <input type="hidden" name="rating" id="rating" value="4">
                                            <a class="stars btn-light" type="button" onclick="setRating(5)">
                                                <i class="fas fa-star text-warning" id="star5"></i>
                                            </a>
                                            <input type="hidden" name="rating" id="rating" value="5">
                                        </div>
                                        <div class="col-md-9">
                                            <label>Nội dung:</label>
                                            <textarea class="col-12" name="comment" cols="" rows="5"></textarea>

                                        </div>
                                        <div class="col-md-3" style="text-align: center;margin-top: 20px;">
                                            <div style="margin-top: 30px;">
                                                <button class="btn btn-primary" type="button" onclick="submitForm()">Gửi</button>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                                <hr>
                                <div class="row">
                                        <div class="col-md-7">
                                        </div>
                                    <div class="col-md-5">
                                        <label>Sắp xếp theo:</label>
                                        <select name="" id="">
                                            <option value="">Mới nhất</option>
                                            <option value="">Đánh giá cao nhất</option>
                                            <option value="">Đánh giá thấp nhất</option>
                                        </select>
                                    </div>
                                    <div class="dropdown-divider"></div>
                                </div>
                                <div >
                                    <c:forEach items="${lstPr}" var="pr">
                                        <div>
                                            <b>${pr.acc_id.fullName}</b>
                                        </div>

                                        <div class="col-md-9">
                                            <c:forEach begin="1" end="${pr.rating}" varStatus="star">
                                                <a class="stars btn-light" type="">
                                                    <i class="fas fa-star text-warning"></i>
                                                </a>
                                            </c:forEach>
                                        </div>

<%--                                        <div class="col-md-9">--%>
<%--                                            <a class="stars btn-light" type="">--%>
<%--                                                <i class="fas fa-star text-warning"></i>--%>
<%--                                            </a>--%>
<%--                                            <a class="stars btn-light" type="">--%>
<%--                                                <i class="fas fa-star text-warning"></i>--%>
<%--                                            </a>--%>
<%--                                            <a class="stars btn-light" type="">--%>
<%--                                                <i class="fas fa-star text-warning"></i>--%>
<%--                                            </a>--%>
<%--                                            <a class="stars btn-light" type="">--%>
<%--                                                <i class="fas fa-star text-warning"></i>--%>
<%--                                            </a>--%>
<%--                                            <a class="stars btn-light" type="">--%>
<%--                                                <i class="fas fa-star text-warning"></i>--%>
<%--                                            </a>--%>
<%--                                        </div>--%>

                                        <div style="margin-top: 10px;">
                                            <p>${pr.comment}</p>
                                        </div>

                                        <div style="font-size: small; margin-bottom: 10px">Ngày đánh giá: ${pr.commentdate}</div>
                                        <div class="dropdown-divider"></div>
                                    </c:forEach>
                                </div>
<%--                                <label for="starRating">Rate:</label>--%>
<%--                                <select id="starRating" name="starRating">--%>
<%--                                    <option value="1">1 star</option>--%>
<%--                                    <option value="2">2 stars</option>--%>
<%--                                    <option value="3">3 stars</option>--%>
<%--                                    <option value="4">4 stars</option>--%>
<%--                                    <option value="5">5 stars</option>--%>
<%--                                </select>--%>
<%--                                <div style="margin-top: 20px;">--%>
<%--                                    <a href="">Xem thêm >></a>--%>
<%--                                </div>--%>
                        </article> <!-- tab-content.// -->
                        <article id="tab_specs" class="tab-pane show card-body">
                            <b>ĐÔI GIÀY CHẠY BỘ ÊM ÁI CÓ SỬ DỤNG CHẤT LIỆU TÁI CHẾ.</b>
                            <p> Bạn đã sẵn sàng nâng dần cường độ tập luyện? Đôi giày adidas
                                này giúp bạn sải bước tiếp theo trên hành trình chạy bộ. Đệm
                                Bounce siêu nhẹ mang đến cảm giác thoải mái và linh hoạt để
                                trợ lực cho bạn khi tăng cường cự ly trên đường chạy hàng
                                ngày. Đế ngoài bằng cao su bền bỉ đảm bảo độ bám trên nhiều
                                bề mặt đa dạng để bạn tự tin sải bước.</p>
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
                                <img src="images/items/Giay_Pureboost_23.avif" width="96" height="96" class="img-md img-thumbnail">
                            </a>
                            <div class="info">
                                <a href="#" class="title mb-1"> <strong>Giày Pureboost 23</strong></a>
                                <p style="font-size: small;">Giày chạy</p>
                                <b class="price"> 3.700.000 đ</b> <!-- price.// -->
                            </div>
                        </article>

                        <article class="itemside mb-3">
                            <a href="#" class="aside">
                                <img src="images/items/Giay_Runfalcon_3.avif" width="96" height="96" class="img-md img-thumbnail">
                            </a>
                            <div class="info">
                                <a href="#" class="title mb-1"> <strong>Giày Runfalcon 3</strong></a>
                                <p style="font-size: small;">Giày chạy</p>
                                <b class="price"> 1.800.000 đ</b> <!-- price.// -->
                            </div>
                        </article>

                        <article class="itemside mb-3">
                            <a href="#" class="aside">
                                <img src="images/items/Giay_Ultraboost.avif" width="96" height="96" class="img-md img-thumbnail">
                            </a>
                            <div class="info">
                                <a href="#" class="title mb-1"> <strong>Giày Ultraboost</strong></a>
                                <p style="font-size: small;">Giày chạy</p>
                                <b class="price"> 5.200.000 đ</b> <!-- price.// -->
                            </div>
                        </article>

                        <article class="itemside mb-3">
                            <a href="#" class="aside">
                                <img src="images/items/Giay_Avryn.avif" width="96" height="96" class="img-md img-thumbnail">
                            </a>
                            <div class="info">
                                <a href="#" class="title mb-1"> <strong>Giày Avryn</strong></a>
                                <p style="font-size: small;">Giày chạy</p>
                                <b class="price"> 3.800.000 đ</b> <!-- price.// -->
                            </div>
                        </article>

                        <article class="itemside mb-3">
                            <a href="#" class="aside">
                                <img src="images/items/COUNTRY_XLG.avif" width="96" height="96" class="img-md img-thumbnail">
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

    function setRating(rating) {
        const selectRating = rating || 5;
        document.getElementById('rating').value = selectRating;
        for (let i = 1; i <= 5; i++) {
            const star = document.getElementById(`star` + i);
            if (i <= selectRating) {
                star.classList.add('text-warning');
            } else {
                star.classList.remove('text-warning');
            }
        }
    }

    function submitForm() {
        document.getElementById('commentForm').submit();
    }

</script>


<%@ include file="fragment/footer.jsp" %>