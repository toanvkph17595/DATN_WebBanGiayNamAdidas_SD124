<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%--<section class="padding-y bg-light border-top">--%>
<%--    <div class="container">--%>
<%--        <div class="row">--%>
<%--            <div class="col-lg-8">--%>
<%--                <!-- =================== COMPONENT SPECS ====================== -->--%>
<%--                <div class="card">--%>
<%--                    <header class="card-header">--%>
<%--                        <ul class="nav nav-tabs card-header-tabs">--%>
<%--                            <li class="nav-item">--%>
<%--                                <a href="#" data-bs-target="#tab_specs" data-bs-toggle="tab" class="nav-link active">Mô tả</a>--%>
<%--                            </li>--%>
<%--                            <li class="nav-item">--%>
<%--                                <a href="#" data-bs-target="#tab_comment" data-bs-toggle="tab" class="nav-link">Bình luận</a>--%>
<%--                            </li>--%>
<%--                        </ul>--%>
<%--                    </header>--%>
<%--                    <div class="tab-content">--%>
<%--                        <article id="tab_specs" class="tab-pane show active card-body">--%>
<%--                            <b>ĐÔI GIÀY CHẠY BỘ ÊM ÁI CÓ SỬ DỤNG CHẤT LIỆU TÁI CHẾ.</b>--%>
<%--                            <p> Bạn đã sẵn sàng nâng dần cường độ tập luyện? Đôi giày adidas--%>
<%--                                này giúp bạn sải bước tiếp theo trên hành trình chạy bộ. Đệm--%>
<%--                                Bounce siêu nhẹ mang đến cảm giác thoải mái và linh hoạt để--%>
<%--                                trợ lực cho bạn khi tăng cường cự ly trên đường chạy hàng--%>
<%--                                ngày. Đế ngoài bằng cao su bền bỉ đảm bảo độ bám trên nhiều--%>
<%--                                bề mặt đa dạng để bạn tự tin sải bước.</p>--%>
<%--                        </article> <!-- tab-content.// -->--%>
<%--                        <article id="tab_comment" class="tab-pane show card-body">--%>
<%--                            <div class="container">--%>

<%--                                <div class="row">--%>
<%--                                    <div class="col-md-9">--%>
<%--                                        <label>Nội dung:</label>--%>
<%--                                        <textarea class="col-12" name="comment" cols="" rows="5"></textarea>--%>
<%--                                    </div>--%>
<%--                                    <div class="col-md-3" style="text-align: center;margin-top: 20px;">--%>
<%--                                        <div>--%>
<%--                                            <ul class="rating-stars">--%>
<%--                                                <li style="width:100%" class="stars-active">--%>
<%--                                                    <img src="images/misc/stars-active.svg" alt="">--%>
<%--                                                </li>--%>
<%--                                                <li>--%>
<%--                                                    <img src="images/misc/starts-disable.svg" alt="">--%>
<%--                                                </li>--%>
<%--                                            </ul>--%>
<%--                                            <b class="label-rating text-warning"> </b>--%>
<%--                                        </div>--%>
<%--                                        <div style="margin-top: 30px;">--%>
<%--                                            <button class="btn btn-primary">Gửi</button>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                                <hr>--%>
<%--                                <div class="row">--%>
<%--                                    <div class="col-md-7">--%>
<%--                                        <b>Đánh giá:--%>
<%--&lt;%&ndash;                                            <ul class="rating-stars">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                <li style="width:80%" class="stars-active">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                    <img src="images/misc/stars-active.svg" alt="">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                </li>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                <li>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                    <img src="images/misc/starts-disable.svg" alt="">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                </li>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                            </ul>&ndash;%&gt;--%>
<%--                                            <b class="label-rating text-warning"> 4.5</b>--%>
<%--                                        </b>--%>
<%--                                        <p>(134 lượt)</p>--%>
<%--                                    </div>--%>
<%--                                    <div class="col-md-5">--%>
<%--                                        <label>Sắp xếp theo:</label>--%>
<%--                                        <select name="" id="">--%>
<%--                                            <option value="">Mới nhất</option>--%>
<%--                                            <option value="">Đánh giá cao nhất</option>--%>
<%--                                            <option value="">Đánh giá thấp nhất</option>--%>
<%--                                        </select>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                                <div >--%>
<%--                                    <c:forEach items="${lstPr}" var="pr">--%>
<%--                                    <div>--%>
<%--                                        <b>${pr.acc_id.fullName}</b>--%>
<%--                                        <ul class="rating-stars">--%>
<%--&lt;%&ndash;                                            <li style="width:80%" class="stars-active">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                <img src="images/misc/stars-active.svg" alt="">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                            </li>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                            <li>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                <img src="images/misc/starts-disable.svg" alt="">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                            </li>&ndash;%&gt;--%>
<%--                                        </ul>--%>
<%--                                    </div>--%>

<%--                                    <div style="margin-top: 10px;">--%>
<%--                                        <p>${pr.comment}</p>--%>
<%--&lt;%&ndash;                                        <p>Sản phẩm tốt. Sử dụng rất bền và thoải mái.</p>&ndash;%&gt;--%>
<%--                                    </div>--%>
<%--                                    </c:forEach>--%>
<%--                                    <div style="font-size: small;">Ngày đánh giá: 23/12/2021</div>--%>
<%--                                </div>--%>

<%--                                <div style="margin-top: 20px;">--%>
<%--                                    <a href="">Xem thêm >></a>--%>
<%--                                </div>--%>
<%--                        </article> <!-- tab-content.// -->--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <!-- =================== COMPONENT SPECS .// ================== -->--%>
<%--            </div> <!-- col.// -->--%>
<%--            <aside class="col-lg-4">--%>
<%--                <!-- =================== COMPONENT ADDINGS ====================== -->--%>
<%--                <div class="card">--%>
<%--                    <div class="card-body">--%>
<%--                        <h5 class="card-title">Sản phẩm tương tự</h5>--%>

<%--                        <article class="itemside mb-3">--%>
<%--                            <a href="#" class="aside">--%>
<%--                                <img src="images/items/Giay_Pureboost_23.avif" width="96" height="96" class="img-md img-thumbnail">--%>
<%--                            </a>--%>
<%--                            <div class="info">--%>
<%--                                <a href="#" class="title mb-1"> <strong>Giày Pureboost 23</strong></a>--%>
<%--                                <p style="font-size: small;">Giày chạy</p>--%>
<%--                                <b class="price"> 3.700.000 đ</b> <!-- price.// -->--%>
<%--                            </div>--%>
<%--                        </article>--%>

<%--                        <article class="itemside mb-3">--%>
<%--                            <a href="#" class="aside">--%>
<%--                                <img src="images/items/Giay_Runfalcon_3.avif" width="96" height="96" class="img-md img-thumbnail">--%>
<%--                            </a>--%>
<%--                            <div class="info">--%>
<%--                                <a href="#" class="title mb-1"> <strong>Giày Runfalcon 3</strong></a>--%>
<%--                                <p style="font-size: small;">Giày chạy</p>--%>
<%--                                <b class="price"> 1.800.000 đ</b> <!-- price.// -->--%>
<%--                            </div>--%>
<%--                        </article>--%>

<%--                        <article class="itemside mb-3">--%>
<%--                            <a href="#" class="aside">--%>
<%--                                <img src="images/items/Giay_Ultraboost.avif" width="96" height="96" class="img-md img-thumbnail">--%>
<%--                            </a>--%>
<%--                            <div class="info">--%>
<%--                                <a href="#" class="title mb-1"> <strong>Giày Ultraboost</strong></a>--%>
<%--                                <p style="font-size: small;">Giày chạy</p>--%>
<%--                                <b class="price"> 5.200.000 đ</b> <!-- price.// -->--%>
<%--                            </div>--%>
<%--                        </article>--%>

<%--                        <article class="itemside mb-3">--%>
<%--                            <a href="#" class="aside">--%>
<%--                                <img src="images/items/Giay_Avryn.avif" width="96" height="96" class="img-md img-thumbnail">--%>
<%--                            </a>--%>
<%--                            <div class="info">--%>
<%--                                <a href="#" class="title mb-1"> <strong>Giày Avryn</strong></a>--%>
<%--                                <p style="font-size: small;">Giày chạy</p>--%>
<%--                                <b class="price"> 3.800.000 đ</b> <!-- price.// -->--%>
<%--                            </div>--%>
<%--                        </article>--%>

<%--                        <article class="itemside mb-3">--%>
<%--                            <a href="#" class="aside">--%>
<%--                                <img src="images/items/COUNTRY_XLG.avif" width="96" height="96" class="img-md img-thumbnail">--%>
<%--                            </a>--%>
<%--                            <div class="info">--%>
<%--                                <a href="#" class="title mb-1"> <strong>Giày COUNTRY XLG</strong></a>--%>
<%--                                <p style="font-size: small;">Giày chạy</p>--%>
<%--                                <b class="price"> 2.600.000 đ</b> <!-- price.// -->--%>
<%--                            </div>--%>
<%--                        </article>--%>

<%--                    </div> <!-- card-body .// -->--%>
<%--                </div> <!-- card .// -->--%>
<%--                <!-- =================== COMPONENT ADDINGS .// ================== -->--%>
<%--            </aside> <!-- col.// -->--%>
<%--        </div>--%>

<%--        <br><br>--%>

<%--    </div><!-- container // -->--%>
<%--</section>--%>
