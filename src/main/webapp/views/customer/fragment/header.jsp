<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Type some info">
    <meta name="author" content="Type name">

    <title>Adidas Men's Shoes</title>

    <link href="/static/css/bootstrap.css?v=2.0" rel="stylesheet" type="text/css" />

    <!-- Custom css -->
    <link href="/static/css/ui.css?v=2.0" rel="stylesheet" type="text/css" />
    <link href="/static/css/responsive.css?v=2.0" rel="stylesheet" type="text/css" />

    <!-- Font awesome 5 -->
    <link href="/static/fonts/fontawesome/css/all.min.css" type="text/css" rel="stylesheet">
    <script
            src="https://code.jquery.com/jquery-3.7.1.js"
            integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
            crossorigin="anonymous"></script>

</head>


<header class="section-header">
    <section class="header-main">
        <div class="container">
            <div class="row gy-3 align-items-center">
                <div class="col-lg-3 col-sm-4 col-4">
                    <a href="../" class="navbar-brand">
                        <img class="logo" height="65" src="/static/images/adidas.png">
                    </a> <!-- brand end.// -->
                </div>
                <div class="order-lg-last col-lg-4 col-sm-8 col-8">
                    <div class="float-end">
                        <a href="/favorite/${sessionScope.acc.userName}" class="btn btn-light">
                            <i class="fa fa-heart"></i>
                        </a>
                        <a data-bs-toggle="offcanvas" href="/cart" class="btn btn-light">
                            <i class="fa fa-shopping-cart"></i>
                        </a>
                        <button type="button" class="btn btn-light dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                             ${(acc == null) ? "Tài Khoản" : acc.fullName}
                        </button>
                        <ul class="dropdown-menu">
                            <c:if test="${acc != null}">
                                <li><a class="dropdown-item" href="/logout">Đăng xuất</a></li>
                            </c:if>
                            <c:if test="${acc == null}">
                                <li><a class="dropdown-item" href="/sigup">Đăng kí</a></li>
                                <li><a class="dropdown-item" href="/login">Đăng nhập</a></li>
                            </c:if>
                        </ul>

                    </div>
                </div> <!-- col end.// -->
                <div class="col-lg-5 col-md-12 col-12">
                    <form>
                        <div class="input-group">
                            <input type="search" class="form-control" value="${keyword}" style="width:55%" placeholder="Search" name="keyword">
                            <button class="btn btn-secondary">
                                <i class="fa fa-search"></i>Search
                            </button>
                        </div> <!-- input-group end.// -->
                    </form>
                </div> <!-- col end.// -->
            </div> <!-- row end.// -->
        </div> <!-- container end.// -->
    </section> <!-- header-main end.// -->
    <div class="banner">
        <img src="../static/images/adidas-baners.jpg" alt="">
    </div>
</header> <!-- section-header end.// -->
<br>