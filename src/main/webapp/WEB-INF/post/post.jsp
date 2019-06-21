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
<html lang="zh-CN" class="h-100">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <meta http-equiv="content-language" content="zh-CN" />
    <title><s:if test="#session.user!=null">${sessionScope.user.userName} | </s:if>校园生活</title>
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/bootstrap.min.css">
    <link href="${pageContext.servletContext.contextPath}/css/carousel.css" rel="stylesheet" />
    <script src="${pageContext.servletContext.contextPath}/js/jquery.min.js"></script>
    <script src="${pageContext.servletContext.contextPath}/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.servletContext.contextPath}/js/utils/tips.js"></script>
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/post.css">
    <script src="${pageContext.servletContext.contextPath}/js/bootstrap-paginator.min.js"></script>
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/preview.css">
    <script src="${pageContext.servletContext.contextPath}/js/preview.js"></script>
    <script src="${pageContext.servletContext.contextPath}/js/EmojiCharString.min.js"></script>
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/atom-one-dark.min.css">
    <script src="${pageContext.servletContext.contextPath}/js/highlight.min.js"></script>
</head>
<body>
<jsp:include page="../header/header.jsp">
    <jsp:param name="postActive" value="active" />
</jsp:include>

<div class="container mt-5">
    <div class="col">
        <div class="row"><%--border pt-1 pb-1--%>
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
        <div class="row border post hidden pt-3 pb-3 ml-0 mr-0">
            <div class="col-2 border-right">
                <img class="rounded-lg user-avatar" src="${post.user.userAvatar}"
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
                    <a class="reply-href" href="javascript:void(0)">回复</a>&nbsp;&nbsp;<s:if
                        test="#session.user.userId==post.user.userId"><a href="javascript:void(0)"
                                                                         class="modify">修改</a>&nbsp;&nbsp;<a class="delete" href="javascript:void(0)">删除</a>&nbsp;&nbsp;</s:if><s:property
                        value="post.createTime.substring(0,19)" />
                </div>
            </div>
        </div>
        <div class="reply"></div>
        <div class="text-center loading text-primary">
            <div class="spinner-border m-5 p-5" role="status">
                <span class="sr-only">Loading...</span>
            </div>
        </div>
        <div class="d-none border-top bg-white fixed-bottom">
            <div class="row mt-3 ml-0 mr-0 pl-3 pr-3 justify-content-between">
                <div>回复：@<span class="username"></span></div>
                <button type="button" class="close text-danger" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
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
    <div class="row mt-5 justify-content-center">
        <ul class="page"></ul>
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
  $.fn.bootstrapPaginator.regional["chinese"] = {
    first: "首页",
    prev: "上一页",
    next: "下一页",
    last: "尾页",
    current: "当前页",
    page: "第\${0}页"
  };

  $(function () {

    var $editor = $('.d-none');

    var href = window.location.href;
    var slashIndex = href.lastIndexOf('/');
    var postId = null;

    postId = href.substr(slashIndex + 1, 32); // 最后一个/的位置+1到结尾或?前一个

    $('.page').bootstrapPaginator({
      language: "chinese",
      currentPage: 1,
      totalPages: 1,
      onPageChanged: function (e, oldPage, newPage) {
        if (oldPage !== newPage && newPage === 1) {
          window.location.reload();
          return;
        }
        $.ajax({
          url: '${pageContext.servletContext.contextPath}/reply/page/' + newPage + '/' + postId,
          type: 'GET',
          success: function (result, status, xhr) {
            var target = $(e.currentTarget);
            var options = { currentPage: newPage };
            if (result.totalPages !== target.bootstrapPaginator('getOption').totalPages) {
              result.totalPages = result.totalPages || 1;
              options['totalPages'] = result.totalPages;
            }
            target.bootstrapPaginator('setOptions', options);
            if (oldPage !== newPage) { // 非首次渲染
              $('.post').remove();
            }
            <%-- Ajax渲染 --%>
            var $reply = $('.reply');
            $reply.html('');
            $.each(result.replies, function (index, reply) {
              var $repliesBody = $('<div class="row border replies hidden pt-3 pb-3 ml-0 mr-0"></div>');
              var $leftBody = $('<div class="col-2 border-right"></div>');
              var $avatar = $('<img class="rounded-lg user-avatar" src="' + reply.user.userAvatar + '" alt="avatar" /><hr><div class="mr-0 ml-0 text-center">' + reply.user.userName + '</div>');
              $leftBody.append($avatar);
              $repliesBody.append($leftBody);
              var $rightBody = $('<div class="col-10"></div>');
              var status = '';
              var content = '';
              var operational = '';
              if (reply.replyStatus !== 2) {
                status = ' data-reply-id="' + reply.replyId + '"';
                if (reply.previous.replyId) {
                  content += '<blockquote class="previous">';
                  if (!reply.previous.replyContent || reply.previous.replyStatus === 2) {
                    content += '<div class="alert alert-danger" role="alert">评论已被删除</div>';
                  } else {
                    content += '<div>回复：@' + reply.previous.user.userName + '&nbsp;&nbsp;' + reply.previous.replyTime.substr(0, 19) + '</div>' + reply.previous.replyContent;
                  }
                  content += '</blockquote>';
                }
                content += reply.replyContent;
                operational += '<hr><div class="text-right text-secondary"><a class="reply-href" href="javascript:void(0)">回复</a>&nbsp;&nbsp;';
                if ('${user.userId}' === reply.user.userId) {
                  operational += '<a href="javascript:void(0)" class="modify">修改</a>&nbsp;&nbsp;<a href="javascript:void(0)" class="delete">删除</a>&nbsp;&nbsp;';
                }
                operational += reply.replyTime.substr(0, 19);
                operational += '</div>';
              } else {
                content = '<div class="alert alert-danger" role="alert">评论已被删除</div>';
              }
              var $contentBody = $('<div class="content" ' + status + '></div>');
              $contentBody.append($(content));
              $rightBody.append($contentBody);
              $rightBody.append($(operational));
              $repliesBody.append($rightBody);
              $reply.append($repliesBody);
            });
            $(window).resize();
            $('.user-avatar').on('load', function () {
              $(window).resize();
            });
            $('html,body').scrollTop(0);
            new Preview({
              imgWrap: '.col-10 img'
            });
          }
        });
      }
    });

    new Preview({
      imgWrap: '.col-10 img'
    });

    $(window).resize(function () {
      $('.container .user-avatar').css({
        width: $('.container .col-2').width()
      });

      var $userHeight = [];
      var $content = $('.content');
      var $contentParent = $content.parent();
      $contentParent.parent().each(function (index, item) {
        $(item).children(':first-child').each(function (index, item) {
          var total = 0;
          $(item).children().each(function (index, item) {
            total += $(item).height();
          });
          $userHeight.push(total);
        });
      });

      var $contentHeight = [];
      $contentParent.each(function (index, item) {
        var total = 0;
        $(item).children().each(function (index, item) {
          total += $(item).outerHeight();
        });
        $contentHeight.push(total);
      });

      $.each($userHeight, function (index) {
        if ($contentHeight[index] < $userHeight[index]) {
          $('.content').eq(index).css({
            minHeight: $userHeight[index]
          });
        }
      });
      $('pre code').each(function(i, block) {
        hljs.highlightBlock(block);
      });
      $('.loading').fadeOut();
      $('.hidden').removeClass('hidden');
    });
    // $(window).resize();

    var replyId = null;
    $(document).on('click', '.reply-href', function () {
      var $col_10 = $(this).parent().parent();
      var username = $col_10.parent().children(':first-child').children(':last-child').text().trim();
      replyId = $col_10.children(":first-child").data('replyId');
      replyId = typeof replyId === 'undefined' ? null : replyId;
      var prevId = $editor.data('replyId');
      if (prevId === replyId) {
        $editor.toggleClass('d-none');
      } else {
        var $username = $editor.children(":first-child").find('.username');
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

    $(document).on('click', '.replies .delete', function () {
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
                window.location.replace("${pageContext.servletContext.contextPath}/post/view/" + postId);
              }
            });
          }
        });
      });
    });

    $(document).on('click', '.post .delete', function () {
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

    $(document).on('click', '.close.text-danger', function () {
      if (!replyId) {
        $('.reply-href').eq(0).click();
      } else {
        $('.content[data-reply-id="' + replyId + '"]').parent().children(':last-child').children('.reply-href').click();
      }
    });

    ushareEditor.prototype.serialize = function (name) {
      return name + '=' + this.txt.html();
    };
    var editor = new ushareEditor('.editor');
    editor.customConfig.height = '250px';
    editor.customConfig.uploadImgServer = 'http://10.2.16.131:8080/UploadImg/upload';
    editor.customConfig.uploadFileName = 'files';
    editor.create();

    $(document).on('click', '.post .modify', function () {
      window.location.href = "${pageContext.servletContext.contextPath}/post/modify/" + postId;
    });

    $(document).on('click', '.replies .modify', function () {
      replyId = $(this).parent().parent().children(":first-child").data('replyId');
      window.location.href = "${pageContext.servletContext.contextPath}/reply/modify/" + replyId;
    });

    $(document).on('click', '.publish', function () {
      var tip = '';
      var flag = true;
      var text = editor.txt.text();
      var minContent = 15;
      if (new EmojiCharString(text.replace(/&nbsp;/g, "").trim()).length < minContent) {
        flag = false;
        tip = '内容至少要' + minContent + '个字(不包括图片)';
      }
      if (!text.replace(/&nbsp;/g, "").trim()) {
        flag = false;
        tip = '内容不能为空';
      }
      if (!flag) {
        showTip({
          body: $tipMsg,
          modal: $tip,
          tip: tip,
          lazy: true
        });
        return;
      }
      var data = {
        'reply.replyContent': editor.txt.html(),
        'reply.post.postId': postId
      };
      replyId && (data['reply.previous.replyId'] = replyId);
      $.ajax({
        url: '${pageContext.servletContext.contextPath}/reply/reply_add',
        type: 'POST',
        data: data,
        success: function (result, status, xhr) {
          if (result.code === -10) {
            window.location.href = result.action;
            return;
          }
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
