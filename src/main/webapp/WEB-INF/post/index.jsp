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
    <title><s:if test="#session.user!=null">${sessionScope.user.userName} | </s:if>帖吧首页</title>
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/bootstrap.min.css">
    <link href="${pageContext.servletContext.contextPath}/css/carousel.css" rel="stylesheet" />
    <script src="${pageContext.servletContext.contextPath}/js/jquery.min.js"></script>
    <script src="${pageContext.servletContext.contextPath}/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.servletContext.contextPath}/js/bootstrap-paginator.min.js"></script>
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
                        <li class="breadcrumb-item active" aria-current="page">帖吧</li>
                    </ol>
                </nav>
            </div>
        </div>
        <div class="row justify-content-between">
            <div class="col-6">
                <div class="form-inline mt-2 ml-4 mt-md-0">
                    <input class="form-control mr-sm-2 search-input" type="text" placeholder="请输入搜索内容"
                           aria-label="Search">
                    <button class="btn btn-outline-primary my-2 my-sm-0 search" type="submit">搜索</button>
                </div>
            </div>
            <div class="col-2">
                <a href="${pageContext.servletContext.contextPath}/post/add">
                    <button class="btn btn-primary"><b>&plus;</b>&nbsp;发布新帖</button>
                </a>
            </div>
        </div>
        <div class="posts"></div>
        <%--<s:iterator value="posts">
            <div class="row mt-3 mb-3 post">
                <div class="col-6 pl-5">
                    <a href="${pageContext.servletContext.contextPath}/post/view/${postId}">${postTitle}</a>
                </div>
                <div class="col-3 text-center">
                        ${user.userName}
                </div>
                <div class="col-3 text-center">
                    <s:property value="createTime.substring(0,19)" />
                </div>
            </div>
        </s:iterator>--%>
        <div class="row mt-5 justify-content-center">
            <ul class="page"></ul>
        </div>
    </div>
</div>
<script>
  var $page = $('.page');
  var query = false;
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
      var url = '${pageContext.servletContext.contextPath}/post/page/' + newPage;
      if (query) {
        url = '${pageContext.servletContext.contextPath}/post/' + $('.search-input').val() + '/page/' + newPage;
      }
      $.ajax({
        url: url,
        type: 'GET',
        success: function (result, status, xhr) {
          var target = $(e.currentTarget);
          var options = { currentPage: newPage };
          if (result.totalPages !== target.bootstrapPaginator('getOption').totalPages) {
            result.totalPages = result.totalPages || 1;
            options['totalPages'] = result.totalPages;
          }
          target.bootstrapPaginator('setOptions', options);
          var $posts = $('.posts');
          $posts.html('');
          if (JSON.stringify(result.posts) === '[]') {
            var notFound = $('<div class="row align-items-center justify-content-center display-4"><span class="text-danger">搜索结果不存在</span></div>');
            notFound.css({ minHeight: $posts.css('min-height') });
            $posts.append(notFound);
          } else {
            $.each(result.posts, function (index, post) {
              var $post = $('<div class="row mt-3 mb-3 post"></div>');
              var $postTitleBody = $('<div class="col-6 pl-5"></div>');
              var $postTitle = $('<a href="${pageContext.servletContext.contextPath}/post/view/' + post.postId + '">' + post.postTitle + '</a>');
              $postTitleBody.append($postTitle);
              $post.append($postTitleBody);
              var $postUserName = $('<div class="col-3 text-center">' + post.user.userName + '</div>');
              $post.append($postUserName);
              var $postCreateTime = $('<div class="col-3 text-center">' + post.createTime.substr(0, 19) + '</div>');
              $post.append($postCreateTime);
              $posts.append($post);
            });
            $('.posts').css({ minHeight: $('.post').outerHeight() * 10 + ($('.post').css("margin-top").replace("px", "") - 0) * 9 });
          }
        }
      });
    }
  });

  $(function () {
    var width = $('.search-input').css('width');
    $(document).on('blur', '.search-input', function () {
      var $this = $(this);
      $this.stop();
      $this.animate({ width: width });
    }); // 失去焦点

    $(document).on('focus', '.search-input', function () {
      var $this = $(this);
      $this.stop();
      $this.animate({ width: width.replace('px', '') * 1.5 });
    }); // 获得焦点

    $(document).on('click', '.search', function () {
      query = !!$('.search-input').val().trim();
      var currentPage = $page.bootstrapPaginator('getOption').currentPage;
      if (currentPage === 1) {
        $page.bootstrapPaginator('reload');
      } else {
        $page.bootstrapPaginator('show', 1);
      }
    });

    $(document).on('keydown', '.search-input', function (e) {
      if (e.which === 13) {
        $('.search-input').blur();
        $('.search').click();
      }
    })
  });

</script>

</body>
</html>
