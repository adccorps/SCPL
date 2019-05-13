<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: SnoopyAquarius
  Date: 2019/5/11
  Time: 21:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="zh-CN">
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <meta http-equiv="content-language" content="zh-CN" />
    <title><s:if test="#session.user!=null">${sessionScope.user.userName} | </s:if>修改帖子</title>
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
                        <li class="breadcrumb-item"><a
                                href="${pageContext.servletContext.contextPath}/post/index">贴吧</a></li>
                        <li class="breadcrumb-item active" aria-current="page">修改帖子</li>
                    </ol>
                </nav>
            </div>
        </div>
        <div class="form-group row">
            <label for="title" class="col-sm-1 col-form-label text-left">标题：</label>
            <div class="col-sm-11">
                <input id="title" class="form-control title" name="post.postTitle" value="${post.postTitle}" type="text" required>
                <div class="invalid-feedback"></div>
            </div>
        </div>
        <div class="row">
            <div class="col-12 editor">${post.postContent}</div>
        </div>
        <div class="row mt-4">
            <div class="col-11"></div>
            <div class="col-1">
                <button class="btn btn-primary modify">修改</button>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="${pageContext.servletContext.contextPath}/js/ushareEditor.js"></script>
<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/ushareEditor.css">
<script type="text/javascript">
  ushareEditor.prototype.serialize = function (name) {
    return name + '=' + this.txt.html();
  };
  var editor = new ushareEditor('.editor');
  editor.create();

  $('.modify').on('click', function (e) {
    var title = $('#title').serialize();
    var content = editor.serialize('post.postContent');
    var data = title + '&' + content;
    $.ajax({
      url: '',
      type: 'POST',
      success: function (result) {
        console.log(result);
      }
    })
  });
</script>

</body>
</html>
