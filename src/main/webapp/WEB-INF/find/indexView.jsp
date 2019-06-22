<%@ taglib prefix="s" uri="/struts-tags" %>
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
    <div class="border border_height " >
        <div style="width:100%;height: 240px;">
            <img src="${pageContext.servletContext.contextPath}/assets/img/lost.jpg" style="width:45%;height: 250px;">
            <div style="width:52%;float:right ">
                <p class="text-info text-lg-left" style="font-size: 25px" >平台规则：</p><br>
                <p style="font-size: 18px">捡到物品之后可以在此平台发布你的物品信息<br>
                失去物品之后也可以在此平台发布你的失物信息<br>
                若发现自己的物品可以与发布者联系，然后物品进入公示期<br>
                若发现公示期的物品是自己的，可以发起异议由管理员进行审核<br>

            </div>
        </div>
    </div>

    <jsp:include page="table_and_pagin.jsp">
        <jsp:param name="" value="" />
    </jsp:include>
</div>

</body>
</html>
