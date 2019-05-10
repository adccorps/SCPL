<%--
  Created by IntelliJ IDEA.
  User: SnoopyAquarius
  Date: 2019/5/3
  Time: 16:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <title>404</title>
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/bootstrap.min.css">
</head>
<body class="bg-light d-flex align-items-center">
<div class="m-auto w-50 card">
    <div class="col card-body">
        <h1 class="text-center text-muted display-1">404</h1>
        <p class="text-center mb-0">页面走丢了 (┬＿┬)
            <br /><br />
            <a href="javascript:void(0)" onclick="window.history.back()">返回上一页 &gt; </a>
        </p>
    </div>
</div>
</body>
</html>