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
            <th scope="col">商品</th>
            <th scope="col">价格</th>
            <th scope="col">商品状态</th>
            <th scope="col">操作</th>
        </tr>
        </thead>
        <tbody>
        <s:iterator value="goodsList" var="goods" status="order">
            <tr>
                <th scope="row"><s:property value="#order.index"/></th>
                <td>
                    <a href="getGoodsInfo.action?goods.goodsId=<s:property value='#goods.goodsId'></s:property>">
                        <s:property value="#goods.goodsName"></s:property></a> </td>
                <td><s:property value="#goods.goodsPrice"></s:property> </td>
                <td >
                    <s:if test="#goods.goodsStatus == 0">出售中</s:if>
                    <s:if test="#goods.goodsStatus == -1">出售中</s:if>
                    <s:if test="#goods.goodsStatus == 1">交易中</s:if>
                    <s:if test="#goods.goodsStatus == 2">交易完成</s:if>
                    <s:if test="#goods.goodsStatus == 3">已下架</s:if>
                </td>
                <td>
                    <s:if test="#goods.goodsStatus == 0">
                        <a href="viewModify.action?goods.goodsId=<s:property value='#goods.goodsId'></s:property>">
                            修改信息
                        </a>
                        <%--href="change.action?goods.goodsId=<s:property value='#goods.goodsId'></s:property>"--%>

                        <a href="change.action?goods.goodsId=<s:property value='#goods.goodsId'></s:property>"  >
                            下架商品</a>
                    </s:if>
                    <s:if test="#goods.goodsStatus == 3">
                    <a href="change.action?goods.goodsId=<s:property value='#goods.goodsId'></s:property>"  >
                        上架商品</a>
                    </s:if>
                </td>
            </tr>
        </s:iterator>
        </tbody>
    </table>
</div>

</body>
</html>
