<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: SnoopyAquarius
  Date: 2019/5/1
  Time: 1:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<header>
    <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
        <a class="navbar-brand" href="${pageContext.servletContext.contextPath}/index">校园生活</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse"
                aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item ${param.indexActive}">
                    <a class="nav-link" href="${pageContext.servletContext.contextPath}">首页</a>
                </li>
                <li class="nav-item ${param.postActive}">
                    <a class="nav-link" href="${pageContext.servletContext.contextPath}/post">帖吧</a>
                </li>
                <li class="nav-item ${param.alumniCircleActive}">
                    <a class="nav-link" href="${pageContext.servletContext.contextPath}/alumniCircle/indexZCQ">校友圈</a>
                </li>
                <li class="nav-item ${param.taskActive}">
                    <a class="nav-link" href="${pageContext.servletContext.contextPath}/task/index">任务</a>
                </li>
                <li class="nav-item ${param.shopActive}">
                    <a class="nav-link" href="${pageContext.servletContext.contextPath}/shop/viewIndex">二手市场</a>
                </li>
                <li class="nav-item ${param.shiwuxunwuActive}">
                    <a class="nav-link" href="#">失物寻物</a>
                </li>
            </ul>
            <s:if test="#session.user!=null">
                <jsp:include page="logined.jsp" />
            </s:if>
            <s:else>
                <jsp:include page="logout.jsp" />
            </s:else>
            <%--
                <form class="form-inline mt-2 mt-md-0 mb-0">
                <input class="form-control mr-sm-2" type="text" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
                </form>
            --%>
        </div>
    </nav>
</header>
