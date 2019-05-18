<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: SnoopyAquarius
  Date: 2019/5/11
  Time: 18:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="zh-CN">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <meta http-equiv="content-language" content="zh-CN" />
    <title><s:if test="#session.user!=null">${sessionScope.user.userName} | </s:if>贴吧首页</title>
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/bootstrap.min.css">
    <link href="${pageContext.servletContext.contextPath}/css/carousel.css" rel="stylesheet" />
    <script src="${pageContext.servletContext.contextPath}/js/jquery.min.js"></script>
    <script src="${pageContext.servletContext.contextPath}/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<jsp:include page="../header/header.jsp">
    <jsp:param name="postActive" value="active" />
</jsp:include>

<div class="container mt-5">
    <div class="col">
        <div class="row">
            <div class="col-12">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item active" aria-current="page">贴吧</li>
                    </ol>
                </nav>
            </div>
        </div>
        <div class="row">
            <div class="col-12 text-right">
                <a href="${pageContext.servletContext.contextPath}/post/add">
                    <button class="btn btn-primary"><b>&plus;</b>&nbsp;发布新贴</button>
                </a>
            </div>
        </div>
        <s:iterator value="posts">
            <div class="row mt-3 mb-3">
                <div class="col-6 pl-5">
                    <a href="${pageContext.servletContext.contextPath}/post/view/${postId}">${postTitle}</a>
                </div>
                <div class="col-3">
                        ${user.userName}
                </div>
                <div class="col-3">
                    <s:property value="createTime.substring(0,19)" />
                </div>
            </div>
        </s:iterator>
    </div>
</div>

</body>
</html>
