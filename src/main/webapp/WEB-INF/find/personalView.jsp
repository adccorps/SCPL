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

    <div class="container">
    <jsp:include page="findHeader.jsp">
        <jsp:param name="" value="" />
    </jsp:include>



    <table class="table table-hover table_top">
        <thead>
        <tr>
            <th scope="col">类型</th>
            <th scope="col">物品</th>
            <th scope="col">地点</th>
            <th scope="col">发布时间</th>
            <th scope="col">具体信息</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <th scope="row" style="color: red">丢失</th>
            <td>Mark</td>
            <td>Otto</td>
            <td>@mdo</td>
            <td>xxxxx</td>
        </tr>
        <tr>
            <th scope="row" style="color: green">拾取</th>
            <td>Mark</td>
            <td>Otto</td>
            <td>@mdo</td>
            <td>xxxxx</td>
        </tr>

        <tr>
            <th scope="row" style="color: #FFCC00">公示</th>
            <td>Mark</td>
            <td>Otto</td>
            <td>@mdo</td>
            <td>xxxxx</td>
        </tr>
        </tbody>
    </table>



    <nav aria-label="Page navigation example" class="nav_pagination">
        <ul class="pagination">
            <li class="page-item">
                <a class="page-link" href="#" aria-label="Previous">
                    <span aria-hidden="true">&laquo;</span>
                </a>
            </li>
            <li class="page-item"><a class="page-link" href="#">1</a></li>
            <li class="page-item"><a class="page-link" href="#">2</a></li>
            <li class="page-item"><a class="page-link" href="#">3</a></li>
            <li class="page-item"><a class="page-link" href="#">4</a></li>
            <li class="page-item"><a class="page-link" href="#">5</a></li>
            <li class="page-item">
                <a class="page-link" href="#" aria-label="Next">
                    <span aria-hidden="true">&raquo;</span>
                </a>
            </li>
        </ul>
    </nav>
</div>

</body>
</html>
