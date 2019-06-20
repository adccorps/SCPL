<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: Wang
  Date: 2019/5/17
  Time: 20:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="zh-CN">
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <meta http-equiv="content-language" content="zh-CN" />
    <title><s:if test="#session.user!=null">${sessionScope.user.userName} | </s:if>二手市场首页</title>
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/bootstrap.min.css">
    <link href="${pageContext.servletContext.contextPath}/css/carousel.css" rel="stylesheet" />
    <script src="${pageContext.servletContext.contextPath}/js/jquery.min.js"></script>
    <script src="${pageContext.servletContext.contextPath}/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.servletContext.contextPath}/js/shop/shop.js"></script>
    <script src="${pageContext.servletContext.contextPath}/js/bootstrap-paginator.min.js"></script>


</head>
<body>
<jsp:include page="../header/header.jsp">
    <jsp:param name="shopActive" value="active" />
</jsp:include>

<div class="container">
    <jsp:include page="shop_header.jsp"></jsp:include>
    <div class="col-md-2 mt-5 float-left">
    <ul class="nav nav-tabs flex-column  bg-light" id="chooseType">
        <li class="nav-item">
            <a class="nav-link active" href="javascript:void(0)" >所有商品</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="javascript:void(0)">电子数码</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="javascript:void(0)">书籍教材</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="javascript:void(0)">二手衣物</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="javascript:void(0)">日常用品</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="javascript:void(0)">运动健身</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="javascript:void(0)">其他闲置</a>
        </li>
        <%--  <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="javascript:void(0)" role="button" aria-haspopup="true" aria-expanded="false">Dropdown</a>
            <div class="dropdown-menu">
                <a class="dropdown-item" href="javascript:void(0)"></a>
                <a class="dropdown-item" href="javascript:void(0)">Another action</a>
                <a class="dropdown-item" href="javascript:void(0)">Something else here</a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="javascript:void(0)">Separated link</a>
            </div>
        </li>--%>
    </ul>
    </div>

    <div class="col-md-10 mt-5 float-left pt-2 pl-lg-5">
        <div class="row " id="show"></div>

        <div class="row mt-5 justify-content-center">
            <ul class="page" id="page1"></ul>
             <ul class="page" id="page2"></ul>
            <ul class="page" id="page3"></ul>
        </div>
    </div>
    <div class="position-fixed" style=" width: 45px;height: 60px; right:50px;bottom: 70px">

        <div id="orderIcon" >
            <a href="checkOrder">
            <img src="${pageContext.servletContext.contextPath}/assets/img/orderIcon.jpg" style="width:40px;height: 35px;">
            </a>
        </div>
        <hr>
        <div id="carIcon">
            <a href="checkBuy">
            <img src="${pageContext.servletContext.contextPath}/assets/img/car.jpg"  style="width:40px;height: 35px;">
            </a>
        </div>
    </div>


</div>
<script>
    $.fn.bootstrapPaginator.regional["chinese"] = {
        first: "首页",
        prev: "上一页",
        next: "下一页",
        last: "尾页",
        current: "当前页",
        page: "第\${0}页"
    };
    $('.posts').css({ minHeight: '384px' });

</script>

</body>
</html>
