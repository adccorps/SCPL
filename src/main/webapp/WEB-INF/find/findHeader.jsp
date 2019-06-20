<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="../header/header.jsp">
    <jsp:param name="findActive" value="active" />
</jsp:include>

<div class="container">
    <nav class="navbar navbar-expand-lg navbar-light bg-light main-nav-width ">
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo03" aria-controls="navbarTogglerDemo03" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <a class="navbar-brand nav-icon-li-far" href="${pageContext.servletContext.contextPath}/find/findFromView"><button type="button" class="btn btn-danger">+发布</button></a>

        <div class="collapse navbar-collapse nav-li-long_far" id="navbarTogglerDemo03">
            <ul class="navbar-nav mr-auto mt-2 mt-lg-0 ">
                <li class="nav-item  nav-li-far">
                    <a class="nav-link" href="${pageContext.servletContext.contextPath}/find/findIndex">主页</a>
                </li>
                <li class="nav-item nav-li-far">
                    <a class="nav-link" href="${pageContext.servletContext.contextPath}/find/findFindView?view=0">寻物</a>
                </li>
                <li class="nav-item nav-li-far">
                    <a class="nav-link" href="${pageContext.servletContext.contextPath}/find/findFindView?view=1">招领</a>
                </li>
                <li class="nav-item nav-li-far">
                    <a class="nav-link" href="${pageContext.servletContext.contextPath}/find/findFindView?view=2">公证</a>
                </li>
                <li class="nav-item nav-li-far">
                    <a class="nav-link" href="${pageContext.servletContext.contextPath}/find/findPersonal">个人</a>
                </li>

            </ul>
            <form class="form-inline my-2 my-lg-0">
                <input class="form-control mr-sm-2" type="search" placeholder="快捷搜索物品关键字" aria-label="Search">
                <button class="btn btn-outline-success my-2 my-sm-0" type="submit">搜索</button>
            </form>
        </div>
    </nav>
</div>
