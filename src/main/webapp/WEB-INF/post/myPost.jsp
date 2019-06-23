<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: SnoopyAquarius
  Date: 2019/6/14
  Time: 19:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="zh-CN" class="h-100">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <meta http-equiv="content-language" content="zh-CN" />
    <title><s:if test="#session.user!=null">${sessionScope.user.userName} | </s:if>${post.postTitle} - 帖子</title>
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/bootstrap.min.css">
    <link href="${pageContext.servletContext.contextPath}/css/carousel.css" rel="stylesheet" />
    <script src="${pageContext.servletContext.contextPath}/js/jquery.min.js"></script>
    <script src="${pageContext.servletContext.contextPath}/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.servletContext.contextPath}/js/utils/tips.js"></script>
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/post.css">
    <script src="${pageContext.servletContext.contextPath}/js/bootstrap-paginator.min.js"></script>
    <style>
        .post-content {
            max-height: 116px;
            overflow: hidden;
            white-space: nowrap;
            text-overflow: ellipsis;
        }
    </style>
</head>
<body class="h-100">
<jsp:include page="../header/header.jsp" />

<div class="container">
    <div class="col mt-5">
        <div class="row">
            <jsp:include page="../components/userNav.jsp">
                <jsp:param name="myPostActive" value="active" />
            </jsp:include>
            <div class="col-9">
                <ul class="list-group">
                </ul>
                <div class="row mt-5 justify-content-center">
                    <ul class="page justify-content-center"></ul>
                </div>
            </div>
        </div>
    </div>
</div>
<%--<jsp:include page="../components/tipModal.jsp" />--%>
<script>
  $(function () {
    var $page = $('.page');

    $.fn.bootstrapPaginator.regional["chinese"] = {
      first: "首页",
      prev: "上一页",
      next: "下一页",
      last: "尾页",
      current: "当前页",
      page: "第\${0}页"
    };

    $page.bootstrapPaginator({
      language: "chinese",
      currentPage: 1,
      totalPages: 1,
      onPageChanged: function (e, oldPage, newPage) {
        $.ajax({
          url: '${pageContext.servletContext.contextPath}/user/page/' + newPage,
          type: 'GET',
          success: function (result, status, xhr) {
            var target = $(e.currentTarget);
            var options = { currentPage: newPage };
            if (result.totalPages !== target.bootstrapPaginator('getOption').totalPages) {
              result.totalPages = result.totalPages || 1;
              options['totalPages'] = result.totalPages;
            }
            target.bootstrapPaginator('setOptions', options);
            var $list = $('.list-group:eq(1)');
            $list.html('');
            $.each(result.posts, function (index, post) {
              $list.append('<li class="list-group-item"><div class="post"><div class="pt-3 pl-3 pr-3"><a href="${pageContext.servletContext.contextPath}/post/view/' + post.postId + '"><h5 class="mb-0">' + post.postTitle + '</h5></a></div><div class="p-4 post-content">' + post.postContent + '</div></div></li>');
            });
            $('html,body').scrollTop(0);
          }
        });
      }
    });
  });
</script>
</body>
</html>
