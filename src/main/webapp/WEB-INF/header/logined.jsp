<%--
  Created by IntelliJ IDEA.
  User: SnoopyAquarius
  Date: 2019/5/3
  Time: 16:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<ul class="navbar-nav mt-2 mt-md-0">
    <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="dropdown07" data-toggle="dropdown"
           aria-haspopup="true" aria-expanded="false"><img class="rounded-circle" src="${pageContext.servletContext.contextPath}/assets/img/test.jpg" width="24" height="24"></a>
        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdown9">
            <a class="dropdown-item" href="${pageContext.servletContext.contextPath}/user/profile">个人信息</a>
            <a class="dropdown-item" href="${pageContext.servletContext.contextPath}/user_logout">注销</a>
        </div>
    </li>
</ul>
