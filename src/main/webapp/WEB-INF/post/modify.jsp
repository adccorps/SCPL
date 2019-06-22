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
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <meta http-equiv="content-language" content="zh-CN" />
    <title><s:if test="#session.user!=null">${sessionScope.user.userName} | </s:if>修改帖子</title>
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/bootstrap.min.css">
    <link href="${pageContext.servletContext.contextPath}/css/carousel.css" rel="stylesheet" />
    <script src="${pageContext.servletContext.contextPath}/js/jquery.min.js"></script>
    <script src="${pageContext.servletContext.contextPath}/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.servletContext.contextPath}/js/utils/tips.js"></script>
    <script src="${pageContext.servletContext.contextPath}/js/EmojiCharString.min.js"></script>
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
                                href="${pageContext.servletContext.contextPath}/post">帖吧</a></li>
                        <li class="breadcrumb-item active" aria-current="page">修改帖子</li>
                    </ol>
                </nav>
            </div>
        </div>
        <div class="form-group row">
            <label for="title" class="col-sm-1 col-form-label text-right">标题：</label>
            <div class="col-sm-11">
                <input id="title" class="form-control title" name="post.postTitle" value="${post.postTitle}" type="text"
                       required>
                <div class="invalid-feedback"></div>
            </div>
        </div>
        <div class="row">
            <div class="col-12 editor">${post.postContent}</div>
        </div>
        <div class="row mt-3">
            <div class="col-12 text-right">
                <button class="btn btn-primary modify">修改</button>
            </div>
        </div>
    </div>
</div>
<jsp:include page="../components/tipModal.jsp" />
<script type="text/javascript" src="${pageContext.servletContext.contextPath}/js/ushareEditor.js"></script>
<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/ushareEditor.css">
<script type="text/javascript">
  var $tip = $('#tip-modal');
  var $modalBody = $('.modal-body p');

  var href = window.location.href;
  // var qmIndex = href.indexOf('?'); // !=-1时有?
  var slashIndex = href.lastIndexOf('/'); // 最后一个/的位置+1到结尾或?前一个
  var postId = href.substr(slashIndex + 1, 32);

  ushareEditor.prototype.serialize = function (name) {
    return name + '=' + this.txt.html();
  };
  var editor = new ushareEditor('.editor');
  editor.customConfig.uploadImgServer = 'http://10.2.16.131:8080/UploadImg/upload';
  editor.customConfig.uploadFileName = 'files';
  // 将图片大小限制为 3M
  // editor.customConfig.uploadImgMaxSize = 3 * 1024 * 1024
  // 限制一次最多上传 5 张图片
  // editor.customConfig.uploadImgMaxLength = 5
  editor.create();

  $('.modify').on('click', function (e) {
    var $title = $('#title');
    var tip = '';
    var flag = true;
    var text = editor.txt.text();
    var maxTitle = 50;
    if (new EmojiCharString($title.val().trim()).length > maxTitle) {
      flag = false;
      tip = '标题最多只能' + maxTitle + '个字';
    }
    var minContent = 15;
    if (new EmojiCharString(text.replace(/&nbsp;/g, "").trim()).length < minContent) {
      flag = false;
      tip = '内容至少要' + minContent + '个字(不包括图片)';
    }
    if (!$title.val().trim()) {
      flag = false;
      tip = '标题不能为空';
    }
    if (!text.replace(/&nbsp;/g, "").trim()) {
      flag = false;
      tip = '内容不能为空';
    }
    if (!flag) {
      showTip({
        body: $modalBody,
        modal: $tip,
        tip: tip,
        lazy: true
      });
      return;
    }
    // var title = $('#title').serialize();
    // var content = editor.serialize('post.postContent');
    // var data = 'post.postId=' + postId + '&' + title + '&' + content;
    $.ajax({
      url: '${pageContext.servletContext.contextPath}/post/post_modify',
      type: 'POST',
      data: {
        'post.postId': postId,
        'post.postTitle': $title.val(),
        'post.postContent': editor.txt.html()
      },
      success: function (result) {
        showTip({
          body: $modalBody,
          modal: $tip,
          tip: '修改成功',
          lazy: true,
          hidden: function (e) {
            window.location.replace("${pageContext.servletContext.contextPath}/post/view/" + result.post.postId);
          }
        })
      }
    })
  });
</script>

</body>
</html>
