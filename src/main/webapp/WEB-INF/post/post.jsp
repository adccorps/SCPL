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
                                href="${pageContext.servletContext.contextPath}/post">帖吧</a></li>
                        <li class="breadcrumb-item active" aria-current="page">${post.postTitle}</li>
                    </ol>
                </nav>
            </div>
        </div>
        <div class="row border post pt-3 pb-3 ml-0 mr-0">
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
                    <a class="reply" href="javascript:void(0)">回复</a>&nbsp;&nbsp;<s:if
                        test="#session.user.userId==post.user.userId"><a href="javascript:void(0)"
                                                                         class="modify">修改</a>&nbsp;&nbsp;<a class="delete" href="javascript:void(0)">删除</a>&nbsp;&nbsp;</s:if><s:property
                        value="post.createTime.substring(0,19)" /><%--<s:if
                        test="post.postStatus==0">发布于：</s:if>--%><%--<s:if test="post.postStatus==1">修改</s:if>--%>
                </div>
            </div>
        </div>
        <s:if test="!post.replies.isEmpty()">
            <s:iterator value="post.replies">
                <div class="row border replies pt-3 pb-3 ml-0 mr-0">
                    <div class="col-2 border-right">
                        <img class="rounded-lg" src="${pageContext.servletContext.contextPath}/assets/img/test.jpg"
                             alt="test" /> <%-- ${post.user.userAvatar} --%>
                        <hr>
                        <div class="mr-0 ml-0 text-center">
                                ${user.userName}
                        </div>
                    </div>
                    <div class="col-10">
                        <div class="content" <s:if test="replyStatus!=2"> data-reply-id="${replyId}"</s:if>>
                            <s:if test="replyStatus!=2">
                                <s:if test="previous.replyId!=null">
                                    <blockquote class="previous">
                                        <s:if test="previous.replyContent==null || previous.replyStatus==2">
                                            <div class="alert alert-danger" role="alert">评论已被删除</div>
                                        </s:if>
                                        <s:else>
                                            <div>回复：@${previous.user.userName}&nbsp;&nbsp;<s:property
                                                    value="previous.replyTime.substring(0,19)" /></div>
                                            ${previous.replyContent}
                                        </s:else>
                                    </blockquote>
                                </s:if>
                                ${replyContent}
                            </s:if>
                            <s:else>
                                <div class="alert alert-danger" role="alert">
                                    评论已被删除
                                </div>
                            </s:else>
                        </div>
                        <s:if test="replyStatus!=2">
                            <hr>
                            <div class="text-right text-secondary">
                                <a class="reply" href="javascript:void(0)">回复</a>&nbsp;&nbsp;<s:if
                                    test="#session.user.userId==user.userId"><a href="javascript:void(0)"
                                                                                class="modify">修改</a>&nbsp;&nbsp;<a href="javascript:void(0)" class="delete">删除</a>&nbsp;&nbsp;</s:if><s:property
                                    value="replyTime.substring(0,19)" /><%--<s:if test="replyStatus==0">发布于：</s:if>--%><%--<s:if test="replyStatus==1">修改</s:if>--%>
                            </div>
                        </s:if>
                    </div>
                </div>
            </s:iterator>
        </s:if>
        <div class="d-none border-top bg-white fixed-bottom">
            <div class="row mt-3 ml-0 mr-0 pl-3">
                回复：@<span class="username"></span>
            </div>
            <div class="row mt-3 ml-0 mr-0">
                <div class="col-12 editor" spellcheck="false"></div>
            </div>
            <div class="row mt-3 mb-3 ml-0 mr-0">
                <div class="col-12 text-right">
                    <button class="btn btn-primary publish">发表</button>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="modal-group">
    <div class="modal fade" id="confirm-modal" tabindex="-1">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">操作确认</h5>
                </div>
                <div class="modal-body">
                    <p></p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
                    <button type="button" class="btn btn-primary ok">确定</button>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="../components/tipModal.jsp" />
</div>

<script type="text/javascript" src="${pageContext.servletContext.contextPath}/js/ushareEditor.js"></script>
<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/ushareEditor.css">
<script>
  $(window).resize(function () {
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

  $(function () {

    var $editor = $('.d-none');

    var href = window.location.href;
    // var qmIndex = href.indexOf('?'); // !=-1时有?
    var slashIndex = href.lastIndexOf('/'); // 最后一个/的位置+1到结尾或?前一个
    var postId = null;

    postId = href.substr(slashIndex + 1, 32);

    var replyId = null;
    $('.reply').on('click', function () {
      var $col_10 = $(this).parent().parent();
      var username = $col_10.parent().children(':first-child').children(':last-child').text().trim();
      replyId = $col_10.children(":first-child").data('replyId');
      replyId = typeof replyId === 'undefined' ? null : replyId;
      var prevId = $editor.data('replyId');
      if (prevId === replyId) {
        $editor.toggleClass('d-none');
      } else {
        var $username = $editor.children(":first-child").children('.username');
        $username.html(username);
        $editor.data('replyId', replyId);
        $editor.removeClass('d-none');
      }

      if (!$editor.hasClass('d-none')) {
        $('.container').css({ marginBottom: $editor.height() });
      } else {
        $('.container').css({ marginBottom: 0 });
      }
    });

    var $confirm = $('#confirm-modal');
    var $confirmMsg = $('#confirm-modal .modal-body p');
    var $confirmOk = $('#confirm-modal .ok');

    $('.replies .delete').on('click', function () {
      replyId = $(this).parent().parent().children(":first-child").data('replyId');
      $confirmMsg.html('确定要删除这条评论吗？');
      $confirm.modal();
      $confirmOk.one('click', function () {
        $confirm.modal('hide');
        $.ajax({
          url: '${pageContext.servletContext.contextPath}/reply/reply_delete',
          type: 'POST',
          data: "reply.replyId=" + replyId,
          success: function (result, status, xhr) { // TODO 考虑result中的结果
            showTip({
              body: $tipMsg,
              modal: $tip,
              lazy: true,
              before: function () {
                $tipMsg.html(result.tip);
                $confirm.one('hidden.bs.modal', function () {
                  $tip.modal();
                });
              },
              hidden: function () {
                window.location.replace("${pageContext.servletContext.contextPath}/post");
              }
            });
          }
        });
      });
    });

    $('.post .delete').on('click', function () {
      $confirmMsg.html('确定要删除这个帖子吗？');
      $confirm.modal();
      $confirmOk.one('click', function () {
        $confirm.modal('hide');
        $.ajax({
          url: '${pageContext.servletContext.contextPath}/post/post_delete',
          type: 'POST',
          data: "post.postId=" + postId,
          success: function (result, status, xhr) { // TODO 考虑result中的结果
            showTip({
              body: $tipMsg,
              modal: $tip,
              lazy: true,
              before: function () {
                $tipMsg.html(result.tip);
                $confirm.one('hidden.bs.modal', function () {
                  $tip.modal();
                });
              },
              hidden: function () {
                window.location.replace("${pageContext.servletContext.contextPath}/post");
              }
            });
          }
        });
      });
    });

    var $tip = $('#tip-modal');
    var $tipMsg = $('#tip-modal .modal-body p');

    ushareEditor.prototype.serialize = function (name) {
      return name + '=' + this.txt.html();
    };
    var editor = new ushareEditor('.editor');
    editor.customConfig.height = '250px';
    // 配置服务器端地址
    // editor.customConfig.uploadImgServer = 'localhost:8081/ImgServer/upload';
    editor.create();

    $('.post .modify').on('click', function () {
      window.location.href = "${pageContext.servletContext.contextPath}/post/modify/" + postId;
    });

    $('.replies .modify').on('click', function () { // TODO
      replyId = $(this).parent().parent().children(":first-child").data('replyId');
      window.location.href = "${pageContext.servletContext.contextPath}/reply/modify/" + replyId;
    });

    $('.publish').on('click', function () {
      var tip = !editor.txt.text() && '内容不能为空';
      if (!editor.txt.text()) {
        showTip({
          body: $modalBody,
          modal: $tip,
          tip: tip,
          lazy: true
        });
        return;
      }
      var content = editor.serialize('reply.replyContent');
      var data = 'reply.post.postId=' + postId + '&' + content;
      data = replyId ? (data + '&reply.previous.replyId=' + replyId) : data;
      // console.log(editor.txt.text()); // 判断空(注意空格为&nbsp;)
      $.ajax({
        url: '${pageContext.servletContext.contextPath}/reply/reply_add',
        type: 'POST',
        data: data,
        success: function (result, status, xhr) {
          showTip({
            body: $tipMsg,
            modal: $tip,
            tip: result.tip,
            lazy: true,
            hidden: function () {
              window.location.replace("${pageContext.servletContext.contextPath}/post/view/" + postId);
            }
          });
        }
      });
    });
  });
</script>
</body>
</html>
