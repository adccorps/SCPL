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
                        <li class="breadcrumb-item active" aria-current="page">修改回复</li>
                    </ol>
                </nav>
            </div>
        </div>
        <div class="row">
            <div class="col-12 editor">${reply.replyContent}</div>
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
  var replyId = href.substr(slashIndex + 1, 32);

  ushareEditor.prototype.serialize = function (name) {
    return name + '=' + this.txt.html();
  };
  var editor = new ushareEditor('.editor');
  // 配置服务器端地址
  // editor.customConfig.uploadImgServer = '/upload';
  // 将图片大小限制为 3M
  // editor.customConfig.uploadImgMaxSize = 3 * 1024 * 1024
  // 限制一次最多上传 5 张图片
  // editor.customConfig.uploadImgMaxLength = 5
  editor.create();

  $('.modify').on('click', function (e) {
    var content = editor.serialize('reply.replyContent');
    var data = 'reply.replyId=' + replyId + '&' + content;
    $.ajax({
      url: '${pageContext.servletContext.contextPath}/reply/reply_modify',
      type: 'POST',
      data: data,
      success: function (result) {
        showTip({ // 1. 弹出tip-modal
          body: $modalBody,
          modal: $tip,
          tip: '修改成功',
          lazy: true,
          hidden: function (e) { // 3. 跳转到帖子页面
            window.location.replace("${pageContext.servletContext.contextPath}/post/view/" + result.reply.post.postId);
          }
        });
      }
    })
  });
</script>

</body>
</html>
