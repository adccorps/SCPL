<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: SnoopyAquarius
  Date: 2019/5/11
  Time: 22:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="zh-CN">
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <meta http-equiv="content-language" content="zh-CN" />
    <title><s:if test="#session.user!=null">${sessionScope.user.userName} | </s:if>${post.postTitle} - 贴子</title>
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
        <div class="row"><%--border pt-1 pb-1--%>
            <%--<div class="col-2"></div>
            <div class="col-10">${post.postTitle}</div>--%>
            <div class="col-12">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a
                                href="${pageContext.servletContext.contextPath}/post">贴吧</a></li>
                        <li class="breadcrumb-item active" aria-current="page">${post.postTitle}</li>
                    </ol>
                </nav>
            </div>
        </div>
        <div class="row border pt-3 pb-3">
            <div class="col-2 border-right">
                <img class="rounded-lg" src="${pageContext.servletContext.contextPath}/assets/img/test.jpg"
                     alt="test" /> <%-- ${post.user.userAvatar} --%>
                <hr>
                <div class="mr-0 ml-0 text-center">
                    ${post.user.userName}
                </div>
            </div>
            <div class="col-10">
                <div class="content">
                    ${post.postContent}
                </div>
                <hr>
                <div class="text-right text-secondary">
                    <s:if test="post.postStatus==0">发布</s:if><s:if test="post.postStatus==1">修改</s:if>于：<s:property
                        value="post.createTime.substring(0,19)" />
                </div>
            </div>
        </div>
        <s:if test="post.replies.isEmpty()==false">
            <s:iterator value="post.replies">
                <div class="row border pt-3 pb-3">
                    <div class="col-2 border-right">
                        <img class="rounded-lg" src="${pageContext.servletContext.contextPath}/assets/img/test.jpg"
                             alt="test" /> <%-- ${post.user.userAvatar} --%>
                        <hr>
                        <div class="mr-0 ml-0 text-center">
                                ${user.userName}
                        </div>
                    </div>
                    <div class="col-10">
                        <div class="content">
                                ${replyContent}
                        </div>
                        <hr>
                        <div class="text-right text-secondary">
                            <s:if test="replyStatus==0">发布</s:if><s:if test="replyStatus==1">修改</s:if>于：<s:property
                                value="replyTime.substring(0,19)" />
                        </div>
                    </div>
                </div>
            </s:iterator>
        </s:if>
        <div class="row mt-5">
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
<%--<s:iterator value="">

</s:iterator>--%>
<jsp:include page="../components/tipModal.jsp" />

<script type="text/javascript" src="${pageContext.servletContext.contextPath}/js/ushareEditor.js"></script>
<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/ushareEditor.css">
<script>
  $(function (e) {

    var href = window.location.href;
    // var qmIndex = href.indexOf('?'); // !=-1时有?
    var slashIndex = href.lastIndexOf('/'); // 最后一个/的位置+1到结尾或?前一个
    var postId = null;

    postId = href.substr(slashIndex + 1, 32);

    $(window).resize(function (e) {
      $('.container img').css({
        width: $('.container .col-2').width()
      });
    });
    $(window).resize();

    var $userHeight = [];
    $('.content').parent().parent().each(function (index, item) {
      $(item).children(':even').each(function (index, item) {
        var total = 0;
        $(item).children().each(function (index, item) {
          total += $(item).height();
        });
        $userHeight.push(total);
      });
    });
    console.log($userHeight);

    var $contentHeight = [];
    $('.content').parent().each(function (index, item) {
      var total = 0;
      $(item).children().each(function (index, item) {
        total += $(item).outerHeight();
      });
      $contentHeight.push(total);
    });

    $.each($contentHeight, function (index) {
      if ($contentHeight[index] < $userHeight[index]) {
        $('.content').eq(index).css({
          minHeight: $userHeight[index]
        });
      }
    });

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
      var tip = '';
      tip = !editor.txt.text() && '内容不能为空';
      if (!editor.txt.text()) {
        $modalBody.html(tip);
        $tip.one('shown.bs.modal', function (e) {
          setTimeout(function () {
            $tip.modal('hide');
          }, 3000);
        });
        $tip.modal();
        return;
      }
      var content = editor.serialize('reply.replyContent');
      var data = 'reply.post.postId=' + postId + '&' + content;
      console.log(editor.txt.text()); // 判断空(注意空格为&nbsp;)
      console.log(data); // 判断空(注意空格为&nbsp;)
      return;
      $.ajax({
        url: '${pageContext.servletContext.contextPath}/reply/reply_add',
        type: 'POST',
        data: data,
        success: function (result, status, xhr) {
          // 1. 弹出tip-modal
          // 2. 按确定或3秒后走第3步
          // 3. 跳转到贴子页面
          window.location.replace("${pageContext.servletContext.contextPath}/post/view/" + result.post.postId);
          // console.log(result);
          // console.log(xhr);
        }
      });
    });
  });
</script>
</body>
</html>
