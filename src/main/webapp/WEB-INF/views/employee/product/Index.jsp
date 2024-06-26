<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <title>Title</title>

    <link rel="stylesheet" href="/resources/lib/bootstrap.css">
</head>
<body>


<header>

    <nav class="navbar navbar-expand-sm navbar-dark bg-dark">
        <div class="container-fluid">
            <button class="btn text-white h-100 me-3" type="button" data-bs-toggle="offcanvas" data-bs-target="#demo">
                <i class="fa-solid fa-bars fs-3"></i>
            </button>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mynavbar">
                <span class="navbar-toggler-icon"></span>
            </button>
<%--            <div class="collapse navbar-collapse" id="mynavbar">--%>
<%--                <form class="d-flex align-items-center my-0" action="/sell/search">--%>
<%--                    <input class="form-control me-2" type="text" placeholder="Search" name="search">--%>
<%--                    <button class="btn btn-primary" type="submit">Search</button>--%>
<%--                </form>--%>

<%--                <ul class="navbar-nav ms-auto">--%>
<%--                    <li class="nav-item">--%>
<%--                        <a class="nav-link" href="javascript:void(0)">Link</a>--%>
<%--                    </li>--%>
<%--                    <li class="nav-item">--%>
<%--                        <a class="nav-link" href="javascript:void(0)">Link</a>--%>
<%--                    </li>--%>
<%--                    <li class="nav-item">--%>
<%--                        <a class="nav-link" href="javascript:void(0)">Link</a>--%>
<%--                    </li>--%>
<%--                </ul>--%>
<%--            </div>--%>
        </div>
    </nav>

    <div class="offcanvas offcanvas-start text-bg-dark" id="demo">
        <div class="offcanvas-header">
            <h1 class="offcanvas-title">Menu</h1>
            <button type="button" class="btn-close btn-close-white" data-bs-dismiss="offcanvas"></button>
        </div>
        <div class="offcanvas-body">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link fs-4" href="/sell">Sell</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link fs-4" href="/bill">Bill</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link fs-4" href="/bill_detail">Bill detail</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link fs-4" href="/product">Product</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link fs-4" href="/product_detail">Product detail</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link fs-4" href="/customer">Customer</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link fs-4" href="/employee">Employee</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link fs-4" href="/color">Color</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link fs-4" href="/size">Size</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link fs-4" href="/logout">Logout</a>
                </li>
            </ul>
        </div>
    </div>
</header>


<div class="container mt-3">
    <form action="/product/search" method="get" class="d-flex align-items-center gap-5">
        <label class="form-label">Search:</label>
        <input type="text" class="form-control" name="search" value="${param.search}">
        <input type="submit" class="btn btn-info px-3" value="Search">
    </form>
    <div class="my-4">
        <div class="d-flex justify-content-between my-2">
            <h2>Product list</h2>
            <a href="/product/create" class="float-end">
                <button class="btn btn-success">Add product</button>
            </a>
        </div>
        <div class="row g-3">
            <c:forEach var="pro" items="${list.content}">
                <div class="col-6 col-md-4 col-lg-3">
                    <div class="border rounded-4 overflow-hidden shadow-sm">
                        <div class="ratio ratio-1x1">
                            <img src="/resources/images/${pro.images[0].url}" class="object-fit-contain" alt="">
                        </div>
                        <div class="row w-100">
                            <div class="col-8 pe-1">
                                <div class="infor mt-2 ps-3">
                                    <div class="product-name overflow-hidden" style="height: 60px;">
                                        <p class="fw-bold fs-5">${pro.name}</p>
                                    </div>
                                    <div class="d-flex flex-wrap mb-3 ">
                                        <p class="fw-bold text-danger my-0">${pro.price}</p>
                                        <p class="fw-bold text-danger ms-1 my-0">vnđ</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-4 px-0 py-1">
                                <a href="/product/detail/${pro.id}">
                                    <button class="btn w-100 btn-success my-1 btn-sm">Detail</button>
                                </a>
                                <a href="/product/update/${pro.id}">
                                    <button class="btn w-100 btn-warning my-1 btn-sm">Update</button>
                                </a>
                                <a href="/product/remove?id=${pro.id}">
                                    <button class="btn w-100 btn-danger my-1 btn-sm">Remove</button>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
            <nav aria-label="Page navigation example">
                <ul class="pagination d-flex justify-content-center">
                    <li class="page-item">
                        <a class="page-link" href="${url}page=0" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                            <span class="sr-only">Previous</span>
                        </a>
                    </li>
                    <li class="page-item"><a class="page-link" href="${url}page=${list.number-1<0?0:list.number-1}">${list.number==0?"...":list.number}</a></li>
                    <li class="page-item"><a class="page-link" href="${url}page=${list.number}">${list.number+1}</a></li>
                    <li class="page-item"><a class="page-link" href="${url}page=${list.number+1>list.totalPages-1?list.totalPages-1:list.number+1}">${list.number==list.totalPages-1?"...":list.number+2}</a></li>
                    <li class="page-item">
                        <a class="page-link" href="${url}page=${list.totalPages-1}" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                            <span class="sr-only">Next</span>
                        </a>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
</div>


<script src="/resources/lib/bootstrap.js"></script>
<script src="/resources/lib/font-fontawesome-ae333ffef2.js"></script>
</body>
</html>