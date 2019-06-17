<%--
  Created by IntelliJ IDEA.
  User: 臻
  Date: 2019/6/6
  Time: 1:00
  To change this template use File | Settings | File Templates.
--%><%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="zh-CN">
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <meta http-equiv="content-language" content="zh-CN" />
    <title><s:if test="#session.user!=null">${sessionScope.user.userName} | </s:if>寻物界面首页</title>
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/find.index.css">
    <link href="${pageContext.servletContext.contextPath}/css/carousel.css" rel="stylesheet" />
    <script src="${pageContext.servletContext.contextPath}/js/jquery.min.js"></script>
    <script src="${pageContext.servletContext.contextPath}/js/bootstrap.bundle.min.js"></script>
</head>
<body>

<jsp:include page="findHeader.jsp">
    <jsp:param name="" value="" />
</jsp:include>

<div class="container">
    <jsp:include page="table_and_pagin.jsp">
        <jsp:param name="" value="" />
    </jsp:include>
</div>

</body>
</html>
