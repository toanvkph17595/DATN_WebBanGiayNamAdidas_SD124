<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Toan
  Date: 10/19/2023
  Time: 4:20 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>

<%@ include file="fragment/header.jsp" %>

<!-- ============== SECTION CONTENT ============== -->
<section class="padding-y">
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
                                <i class="icon-control fa fa-chevron-down"></i> Related items
                            </a>
                        </header>
                        <div class="collapse show" id="collapse_aside1">
                            <div class="card-body">
                                <ul class="list-menu">
                                    <li><a href="#">Sneakers </a></li>
                                    <li><a href="#">Running </a></li>
                                    <li><a href="#">Soccer </a></li>
                                    <li><a href="#">Basketball </a></li>
                                    <li><a href="#">Lifestyle </a></li>
                                    <li><a href="#">Workout & Gym </a></li>
                                    <li><a href="#">Golf </a></li>
                                    <li><a href="#">Football </a></li>
                                </ul>
                            </div> <!-- card-body.// -->
                        </div> <!-- collapse.// -->
                    </article> <!-- filter-group // -->

                    <article class="filter-group">
                        <header class="card-header">
                            <a href="#" class="title" data-bs-toggle="collapse" data-bs-target="#collapse_aside_brands">
                                <i class="icon-control fa fa-chevron-down"></i> Brands
                            </a>
                        </header>
                        <div class="collapse show" id="collapse_aside_brands">
                            <div class="card-body">
                                <label class="form-check mb-2">
                                    <input class="form-check-input" type="checkbox" value="" checked>
                                    <span class="form-check-label"> Originals </span>
                                    <b class="badge rounded-pill bg-gray-dark float-end">120</b>
                                </label> <!-- form-check end.// -->

                                <label class="form-check mb-2">
                                    <input class="form-check-input" type="checkbox" value="" checked>
                                    <span class="form-check-label"> Adidas SportWear </span>
                                    <b class="badge rounded-pill bg-gray-dark float-end">150</b>
                                </label> <!-- form-check end.// -->

                                <label class="form-check mb-2">
                                    <input class="form-check-input" type="checkbox" value="" checked>
                                    <span class="form-check-label"> Adidas Terrex </span>
                                    <b class="badge rounded-pill bg-gray-dark float-end">50</b>
                                </label> <!-- form-check end.// -->
                            </div> <!-- card-body .// -->
                        </div> <!-- collapse.// -->
                    </article>

                    <article class="filter-group">
                        <header class="card-header">
                            <a href="#" class="title" data-bs-toggle="collapse" data-bs-target="#collapse_aside2">
                                <i class="icon-control fa fa-chevron-down"></i> Price
                            </a>
                        </header>
                        <div class="collapse show" id="collapse_aside2">
                            <div class="card-body">
                                <input type="range" class="form-range" min="0" max="100">
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
                    <c:forEach items="${productList}" var="p">
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
                                        <a href="#" class="btn btn-dark">Add to cart</a>
                                        <a href="#" class="btn btn-light btn-icon"> <i class="fa fa-heart"></i> </a>
                                    </figcaption>
                                </figure>
                            </a>
                        </div> <!-- col end.// -->
                    </c:forEach>
                </div>
                <hr>
                <footer class="d-flex mt-4">
                    <div>
                        <a href="javascript: history.back()" class="btn btn-light"> &laquo; Go back</a>
                    </div>
                    <nav class="ms-3">
                        <ul class="pagination">
                            <li class="page-item"><a class="page-link" href="#">1</a></li>
                            <li class="page-item active" aria-current="page">
                                <span class="page-link">2</span>
                            </li>
                            <li class="page-item"><a class="page-link" href="#">3</a></li>
                            <li class="page-item">
                                <a class="page-link" href="#">Next</a>
                            </li>
                        </ul>
                    </nav>
                </footer>

            </main> <!-- col .// -->
        </div> <!-- row .// -->

    </div> <!-- container .//  -->
</section>
<!-- ============== SECTION CONTENT END// ============== -->


<%@ include file="fragment/footer.jsp" %>