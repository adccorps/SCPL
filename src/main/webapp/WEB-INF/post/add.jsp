<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: SnoopyAquarius
  Date: 2019/5/11
  Time: 20:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="zh-CN">
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <meta http-equiv="content-language" content="zh-CN" />
    <title><s:if test="#session.user!=null">${sessionScope.user.userName} | </s:if>发表贴子</title>
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
                                href="${pageContext.servletContext.contextPath}/post">贴吧</a></li>
                        <li class="breadcrumb-item active" aria-current="page">发表贴子</li>
                    </ol>
                </nav>
            </div>
        </div>
        <div class="form-group row">
            <label for="title" class="col-sm-1 col-form-label text-right">标题：</label>
            <div class="col-sm-11">
                <input id="title" class="form-control title" name="post.postTitle" type="text" required>
                <div class="invalid-feedback"></div>
            </div>
        </div>
        <div class="row">
            <div class="col-12 editor" spellcheck="false"></div>
        </div>
        <div class="row mt-4">
            <div class="col-11"></div>
            <div class="col-1">
                <button class="btn btn-primary publish">发表</button>
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

  ushareEditor.prototype.serialize = function (name) {
    return name + '=' + this.txt.html();
  };
  var editor = new ushareEditor('.editor');
  // 配置服务器端地址
  // editor.customConfig.uploadImgServer = '/upload';
  editor.create();

  $('.publish').on('click', function (e) {
    var $title = $('#title');
    var tip = '';
    tip = !editor.txt.text() && '内容不能为空';
    tip = !$title.val() && '标题不能为空';
    if (!editor.txt.text() || !$title.val()) {
      <%-- TODO 提示不能为空 --%>
      $modalBody.html(tip);
      $tip.one('shown.bs.modal', function (e) {
        setTimeout(function () {
          $tip.modal('hide');
        }, 3000);
      });
      $tip.modal();
      return;
    }
    var title = $title.serialize();
    var content = editor.serialize('post.postContent');
    var data = title + '&' + content;
    console.log(editor.txt.text()); // 判断空(注意空格为&nbsp;)
    // return;
    $.ajax({
      url: '${pageContext.servletContext.contextPath}/post/post_add',
      type: 'POST',
      data: data,
      success: function (result, status, xhr) {
        // 1. 弹出tip-modal
        $modalBody.html('发布成功');
        // 2. 按确定或3秒后走第3步
        $tip.one('shown.bs.modal', function (e) {
          setTimeout(function () {
            $tip.modal('hide');
          }, 3000);
        });
        $tip.modal();
        // 3. 跳转到贴子页面
        $tip.one('hidden.bs.modal', function (e) {
          window.location.replace("${pageContext.servletContext.contextPath}/post/view/" + result.post.postId);
        });
      }
    });
  });
</script>
</body>
</html>
