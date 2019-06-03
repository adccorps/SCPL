<%--
  Created by IntelliJ IDEA.
  User: Wang
  Date: 2019/6/1
  Time: 10:57
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <meta http-equiv="content-language" content="zh-CN" />
    <title><s:if test="#session.user!=null">${sessionScope.user.userName} | </s:if>我的订单</title>
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/bootstrap.min.css">
    <link href="${pageContext.servletContext.contextPath}/css/carousel.css" rel="stylesheet" />
    <script src="${pageContext.servletContext.contextPath}/js/jquery.min.js"></script>
    <script src="${pageContext.servletContext.contextPath}/js/bootstrap.bundle.min.js"></script>

</head>
<body>
<jsp:include page="../header/header.jsp">
    <jsp:param name="shopActive" value="active" />
</jsp:include>
<div class="container">
    <table class="table table-hover .table-striped ">
        <thead>
        <tr>
            <th scope="col">#</th>
            <th scope="col">orderId</th>
            <th scope="col">商品</th>
            <th scope="col">价格</th>
            <th scope="col">商品状态</th>
            <th scope="col">操作</th>
        </tr>
        </thead>
        <tbody>
        <s:iterator value="orderList" var="od" status="order">
        <tr>
            <th scope="row"><s:property value="#order.index"/></th>
            <td><s:property value="#od.goods.goodsName"></s:property> </td>
        </tr>
        </s:iterator>
        </tbody>
    </table>
</div>


</body>
</html>
