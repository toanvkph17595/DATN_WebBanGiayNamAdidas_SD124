<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>

    <!-- Bootstrap css -->
    <link href="../static/css/bootstrap.css?v=2.0" rel="stylesheet" type="text/css" />

    <!-- Custom css -->
    <link href="../static/css/ui.css?v=2.0" rel="stylesheet" type="text/css" />
    <link href="../static/css/responsive.css?v=2.0" rel="stylesheet" type="text/css" />

    <!-- Font awesome 5 -->
    <link href="../static/fonts/fontawesome/css/all.min.css" type="text/css" rel="stylesheet">



<header class="section-header">
    <section class="header-main">
        <div class="container">
            <div class="row gy-3 align-items-center">
                <div class="col-lg-3 col-sm-4 col-4">
                    <a href="/" class="navbar-brand">
                        <img class="logo" height="65" src="../static/images/adidas.png">
                    </a> <!-- brand end.// -->
                </div>
                <div class="col-lg-5 col-md-12 col-12">
                </div> <!-- col end.// -->
            </div> <!-- row end.// -->
        </div> <!-- container end.// -->
    </section> <!-- header-main end.// -->
</header> <!-- section-header end.// -->

<!-- ============== SECTION CONTENT  ============== -->
<section class="padding-y bg-light" style="min-height:90vh">
    <div class="container">
        <!-- ====== COMPONENT LOGIN  ====== -->
        <div class="card shadow mx-auto" style="max-width:400px; margin-top:40px;">
            <div class="card-body">
                <h4 class="card-title mb-4" style="text-align: center;font-weight: bold;">ĐĂNG NHẬP</h4>
                <c:if test="${not empty sessionScope.error}">
                    <div class="alert alert-danger">${sessionScope.error}</div>
                    <c:remove var="error" scope="session"/>
                </c:if>
                <form action="/login" method="post">
                    <div class="mb-3">
                        <label class="form-label">Username:</label>
                        <input class="form-control" type="text" name="username">
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Mật khẩu:</label>
                        <input class="form-control" type="password" name="password">
                    </div>
                    <div class="mb-4">
                        <button type="submit" class="btn btn-primary w-100"> Đăng nhập </button>
                    </div>
                </form>
                <hr>
                <div class="row">
                    <div class="col-6" style="text-align: left;">
                        <a href="#"> Quên mật khẩu? </a>
                    </div>
                    <div class="col-6" style="text-align: right;">
                        <a href="/sigup"> Đăng ký </a>
                    </div>
                </div>
            </div> <!-- card-body.// -->
        </div> <!-- card .// -->

        <!-- ====== COMPONENT LOGIN  END.// ====== -->

        <br><br>

    </div> <!-- container .//  -->
</section>
<!-- ============== SECTION CONTENT END// ============== -->

<footer>
    <p class="mt-3" style="font-size: small;text-align: center;"> © 2018- 2021 Templatemount.  All rights reserved.
    </p>
</footer>

<!-- Bootstrap js -->
<script src="../static/js/bootstrap.bundle.min.js"></script>

<!-- Custom js -->
<script src="../static/js/script.js?v=2.0"></script>



