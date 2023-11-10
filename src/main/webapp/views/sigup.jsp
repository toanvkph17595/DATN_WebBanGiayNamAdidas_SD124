<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!-- Bootstrap css -->
<link href="../static/css/bootstrap.css?v=2.0" rel="stylesheet" type="text/css" />

<!-- Custom css -->
<link href="../static/css/ui.css?v=2.0" rel="stylesheet" type="text/css" />
<link href="../static/css/responsive.css?v=2.0" rel="stylesheet" type="text/css" />

<!-- Font awesome 5 -->
<link href="../static/fonts/fontawesome/css/all.min.css" type="text/css" rel="stylesheet">

<header class="section-header border-bottom">
    <section class="header-main">
        <div class="container">
            <div class="row gy-3 align-items-center">
                <div class="col-lg-3 col-sm-4 col-4">
                    <a href="http://bootstrap-ecommerce.com" class="navbar-brand">
                        <img class="logo" height="65" src="../static/images/adidas.png">
                    </a> <!-- brand end.// -->
                </div>
                <div class="order-lg-last col-lg-4 col-sm-8 col-8">
                    <div class="float-end">
                        <!-- <a href="#" class="btn btn-light">
                          <i class="fa fa-heart"></i>
                        </a>
                        <a data-bs-toggle="offcanvas" href="#offcanvas_cart" class="btn btn-light">
                          <i class="fa fa-shopping-cart"></i>
                        </a> -->
                        <a href="/login_" class="btn btn-light">
                            <i class="fa fa-user"></i> <span class="ms-1 d-none d-sm-inline-block">Sign in </span>
                        </a>

                    </div>
                </div> <!-- col end.// -->
                <div class="col-lg-5 col-md-12 col-12">
                    <form action="#" class="">
                        <!-- <div class="input-group">
                          <input type="search" class="form-control" style="width:55%" placeholder="Search">
                          <button class="btn btn-secondary">
                            <i class="fa fa-search"></i>
                          </button>
                        </div> input-group end.// -->
                    </form>
                </div>
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
                <h4 class="card-title mb-4">Sign up</h4>
                <form:form method="post" modelAttribute="account" action="/sigup">
                    <div class="mb-3">
                        <label class="form-label">Username</label>
                        <input type="text" class="form-control" name="username">
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Fullname</label>
                        <input type="text" class="form-control" name="fullname">
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Email</label>
                        <input class="form-control" placeholder="Type email" type="text" name="email">
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Phone</label>
                        <div class="row gx-2">
                            <input class="form-control" placeholder="Phone" type="number" name="phone">
                        </div> <!-- row // -->
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Create password</label>
                        <input class="form-control" placeholder="At least 6 characters." type="password" name="password">
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Repeat password</label>
                        <input class="form-control" placeholder="" type="password" name="password2">
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Image</label>
                        <div class="row gx-2">
                            <input class="form-control" placeholder="Image" type="file" name="image">
                        </div> <!-- row // -->
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Address</label>
                        <div class="row gx-2">
                            <input class="form-control" placeholder="Address" type="text" name="address">
                        </div> <!-- row // -->
                    </div>
                    <div class="mb-3">
                        <select>

                        </select>
                    </div>
                    <div class="mb-4">
                        <p style="color:red">${message}</p>
                    </div>
                    <div class="mb-4">
                        <button type="submit" class="btn btn-primary w-100"> Sigup  </button>
                    </div>
                </form:form>

            </div> <!-- card-body.// -->
        </div>
    </div>
</section>
<footer>
    <p class="mt-3" style="font-size: small;text-align: center;"> © 2018- 2021 Templatemount.  All rights reserved.
    </p>
</footer>
<!-- Bootstrap js -->
<script src="../static/js/bootstrap.bundle.min.js"></script>

<!-- Custom js -->
<script src="../static/js/script.js?v=2.0"></script>