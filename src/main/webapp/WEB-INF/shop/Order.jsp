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
    <script>
        $(function () {
            /*$("#orderOperation>a").click(function () {
                var $modalBody = $('.modal-body p');
                var $tip = $('#tip-modal');
                $modalBody.html("请确定是否要执行此操作");
                $tip.modal();
                $tip.on('hidden.bs.modal', function (e) {
                    $modalBody.html('');
                });
            })*/
        })

    </script>
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
            <td>
                <a href="getGoodsInfo.action?goods.goodsId=<s:property value='#od.goods.goodsId'></s:property>">
                    <s:property value="#od.goods.goodsName"></s:property></a> </td>
            <td><s:property value="#od.goods.goodsPrice"></s:property> </td>
            <td>
                <s:if test="#od.goods.goodsStatus == 0">已取消订单</s:if>
                <s:if test="#od.goods.goodsStatus == 1">商品运送中</s:if>
                <s:if test="#od.goods.goodsStatus == 2">确认收货</s:if>
            </td>

            <td id="orderOperation">
                <s:if test="#od.goods.goodsStatus == 1">
                    <a href="orderCompletion.action?goods.goodsId=<s:property value='#od.goods.goodsId'></s:property>">
                        确认收货</a>
                    <a href="orderCancel.action?goods.goodsId=<s:property value='#od.goods.goodsId'></s:property>">
                        取消订单</a>
                </s:if>
            </td>
        </tr>
        </s:iterator>
        </tbody>
    </table>
</div>
<jsp:include page="../components/tipModal.jsp"></jsp:include>

</body>
</html>
