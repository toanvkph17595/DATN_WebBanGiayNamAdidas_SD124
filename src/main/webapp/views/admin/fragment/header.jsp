
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        crossorigin="anonymous"></script>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark p-0">
    <div class="navbar-nav collapse navbar-collapse">
        <a class="nav-item nav-link active" href="/admin/order">Quản lý đơn hàng</a>
        <a class="nav-item nav-link active" href="/admin/product">Quản lý sản phẩm</a>
        <a class="nav-item nav-link active" href="/admin/category">Quản lý nhóm sản phẩm</a>
        <a class="nav-item nav-link active" href="/admin/color">Quản lý màu sản phẩm</a>
    </div>

    <ul class="navbar-nav ml-auto">
        <li class="nav-item no-arrow">
            <a class="nav-link dropdown-toggle p-0" data-bs-toggle="dropdown" href="void(0)">
                <img alt="" class="rounded-circle" style="width:60px"
                     src="https://raw.githubusercontent.com/pytutorial/html_samples/master/css_bootstrap/user.svg" />
            </a>
            <div class="dropdown-menu dropdown-menu-end">
                <a class="dropdown-item" href="#/">
                    Thông tin tài khoản
                </a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="#/">
                    Đăng xuất
                </a>
            </div>
        </li>
    </ul>
</nav>
