<%--
  Created by IntelliJ IDEA.
  User: SnoopyAquarius
  Date: 2019/6/14
  Time: 19:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="col-3 text-center col-offset-2">
    <div class="list-group">
        <a class="list-group-item list-group-item-action ${param.profileActive}"
           href="${pageContext.servletContext.contextPath}/user/profile">个人信息设置</a>
        <a class="list-group-item list-group-item-action ${param.myPostActive}" href="${pageContext.servletContext.contextPath}/user/myPost">我的帖子</a>
    </div>
</div>
