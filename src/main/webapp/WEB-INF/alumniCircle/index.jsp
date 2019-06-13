<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: 0
  Date: 2019/5/22

  Time: 17:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <meta http-equiv="content-language" content="zh-CN" />
    <title><s:if test="#session.user!=null">${sessionScope.user.userName} | </s:if>校友圈</title>
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/zcq/index.css">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/zico.min.css">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/zcq/baguetteBox.css">
    <link href="${pageContext.servletContext.contextPath}/css/carousel.css" rel="stylesheet" />
    <script src="${pageContext.servletContext.contextPath}/js/jquery.min.js"></script>
    <script src="${pageContext.servletContext.contextPath}/js/baguetteBox.js"></script>
    <script src="${pageContext.servletContext.contextPath}/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<jsp:include page="../header/header.jsp">
    <jsp:param name="alumniCircleActive" value="active" />
</jsp:include>
<div class="container">
    <div class="row">
        <div class="col-lg-3 nav">
            <div class="list-group">
                <button type="button" class="list-group-item list-group-item-action active bt" disabled>校友圈</button>
                <a href="${pageContext.servletContext.contextPath}/alumniCircle/indexZCQ.action" class="alert-link">
                    <button type="button" class="list-group-item list-group-item-action"><i class="zi zi_users"></i>
                        校友动态
                    </button>
                </a>
                <a href="${pageContext.servletContext.contextPath}/alumniCircle/myCircleMine.action?userId=<s:property value="#session.user.userId"/>"
                   class="alert-link">
                    <button type="button" class="list-group-item list-group-item-action"><i class="zi zi_user"></i> 我的动态
                    </button>
                </a>
                <a href="${pageContext.servletContext.contextPath}/alumniCircle/send" class="alert-link">
                    <button type="button" class="list-group-item list-group-item-action"><i class="zi zi_camera"
                                                                                            zico="相机"></i> 发动态
                    </button>
                </a>
                <a href="${pageContext.servletContext.contextPath}/alumniCircle/message" class="alert-link">
                    <button type="button" class="list-group-item list-group-item-action"><i class="zi zi_commentdots"
                                                                                            zico="消息黑"></i> 消息
                    </button>
                </a>
                <a href="${pageContext.servletContext.contextPath}/alumniCircle/findCollectionDynamicCOLL.action?userId=<s:property value="#session.user.userId"/>"
                   class="alert-link">
                    <button type="button" class="list-group-item list-group-item-action"><i class="zi zi_box"
                                                                                            zico="箱子"></i> 收藏
                    </button>
                </a>
            </div>
        </div>
        <div class="col-lg-9 main">
            <figure class="figure">
                <img src="${pageContext.servletContext.contextPath}/assets/img/bg-default.jpg" class="img-fluid"
                     alt="Responsive image">
                <figcaption class="figure-caption">个性签名：A caption for the above image.</figcaption>
            </figure>
            <button type="button" id="refresh" class="btn btn-primary btn-lg btn-block refresh ">点击刷新</button>
            <!--模板-->
            <%--<div class="card" style="">
                <div class="card-body card-body-main">
                    <div class="row">
                        <div class="col-6 col-sm-1"><a href="javascript:void(0)"><img
                                src="${pageContext.servletContext.contextPath}/assets/img/timg.jpg" alt="头像"
                                class="rounded-circle touxiang"></a></div>
                        <div class="col-6 col-sm-3 user-info">
                            <a class="h6 font-weight-bold user-name" href="javascript:void(0)">蔡某</a><br>
                            <div class="time">2019-03-01 8:30</div>
                        </div>
                    </div>
                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the
                        card's content.(模板)</p>
                    <div class="user-imgs baguetteBox">
                        <a href="javascript:void(0)"><img src="${pageContext.servletContext.contextPath}/assets/img/01.jpg" alt=""></a>
                        <a href="javascript:void(0)"><img src="${pageContext.servletContext.contextPath}/assets/img/02.jpg" alt=""></a>
                        <a href="javascript:void(0)"><img src="${pageContext.servletContext.contextPath}/assets/img/03.jpg" alt=""></a>
                        <a href="javascript:void(0)"><img src="${pageContext.servletContext.contextPath}/assets/img/04.jpg" alt=""></a>
                        <a href="javascript:void(0)"><img src="${pageContext.servletContext.contextPath}/assets/img/05.jpg" alt=""></a>
                        <a href="javascript:void(0)"><img src="${pageContext.servletContext.contextPath}/assets/img/06.jpg" alt=""></a>
                        <a href="javascript:void(0)"><img src="${pageContext.servletContext.contextPath}/assets/img/07.jpg" alt=""></a>
                        <a href="javascript:void(0)"><img src="${pageContext.servletContext.contextPath}/assets/img/08.jpg" alt=""></a>
                        <a href="javascript:void(0)"><img src="${pageContext.servletContext.contextPath}/assets/img/09.jpg" alt=""></a>
                    </div>
                    <div class="row">
                        <div class="col-12 col-sm-3">
                            <div class="zi zi_love"></div>
                            <a href="javascript:void(0)" class="card-link">123人觉得很赞</a></div>
                        <div class="col-12 col-sm-3">
                            <div class="zi zi_msgchat"></div>
                            <a href="javascript:void(0)" class="card-link">Another link</a></div>
                        <div class="col-12 col-sm-2"></div>
                        <div class="col-12 col-sm-1"></div>
                        <div class="col-12 col-sm-1"><a href="javascript:void(0)" class="alert-link" title="点赞"><i
                                class="zi zi_digg"></i></a></div><!--点赞图标-->
                        <div class="col-12 col-sm-1"><a href="javascript:void(0)" class="alert-link" title="评论"><i
                                class="zi zi_fxqp"></i></a></div><!--评论图标-->
                        <div class="col-12 col-sm-1"><a href="javascript:void(0)" class="alert-link" title="收藏"><i class="zi zi_box"
                                                                                                  zico="箱子"></i></a>
                        </div>
                    </div>
                </div>
                <div class="input-group mb-3 comment">
                    <input type="text" class="form-control" placeholder="评论" aria-label="Recipient's username"
                           aria-describedby="basic-addon2">
                    <div class="input-group-append">
                        <button class="btn btn-outline-secondary" type="button">发表</button>
                    </div>
                </div>
            </div>--%>

            <s:iterator value="#request.allCircleList" var="circle">
                <div class="card" style="">
                    <div class="card-body card-body-main">
                        <div class="row">
                            <div class="col-6 col-sm-1"><a href="javascript:void(0)"><img
                                    src="<s:property value="#circle.user.userAvatar"/>" alt="头像"
                                    class="rounded-circle touxiang"></a></div>
                            <div class="col-6 col-sm-3 user-info">
                                <a class="h6 font-weight-bold user-name"
                                   href="${pageContext.servletContext.contextPath}/alumniCircle/myCircleMine.action?userId=<s:property value="#circle.user.userId"/>"><s:property
                                        value="#circle.user.userName" /></a><br> <!--发动态的用户名-->
                                <div class="time"><s:property value="#circle.date" /></div>
                            </div>
                        </div>
                        <p class="card-text"><s:property value="#circle.content" /></p>
                        <div class="user-imgs baguetteBox">
                            <s:generator val="#circle.picAddress" separator="," var="p">
                                <s:if test="#circle.picCount==1">
                                    <s:iterator status="st">
                                        <a href="http://10.2.16.131/images/<s:property/>" target="_Blank">
                                            <img src="http://10.2.16.131/images/<s:property/>" alt=""
                                                 style="width: 300px;">
                                        </a>
                                    </s:iterator>
                                </s:if>
                                <s:else>
                                    <s:iterator status="st">
                                        <a href="http://10.2.16.131/images/<s:property/>" target="_Blank">
                                            <img src="http://10.2.16.131/images/<s:property/>" alt="">
                                        </a>
                                    </s:iterator>
                                </s:else>
                            </s:generator>
                        </div>
                        <div class="row">
                            <div class="col-12 col-sm-3">
                                <div class="zi zi_love"></div>
                                <a href="javascript:void(0);" class="card-link"><s:property value="#circle.likes" />人觉得很赞</a>
                            </div>
                            <div class="col-12 col-sm-3">
                                <div class="zi zi_msgchat"></div>
                                <a href="javascript:void(0);"
                                   onclick="comment_show(this,<s:property value="#circle.dynamicId"/>)"
                                   class="card-link all-comments">所有评论</a></div>
                            <div class="col-12 col-sm-2"></div>
                            <div class="col-12 col-sm-1"></div>
                            <div class="col-12 col-sm-1"><a href="javascript:void(0)" class="alert-link dianzan"
                                                            title="点赞"><i
                                    class="zi zi_digg"></i></a></div><!--点赞图标-->
                            <div class="col-12 col-sm-1"><a href="javascript:void(0)" class="alert-link pinglun"
                                                            title="评论"><i
                                    class="zi zi_fxqp"></i></a></div><!--评论图标-->
                            <div class="col-12 col-sm-1"><a href="javascript:void (0);"
                                                            onclick="add_collection(<s:property
                                                                    value="#circle.dynamicId"/>)"
                                                            class="alert-link shoucang" title="收藏"><i class="zi zi_box"
                                                                                                      zico="箱子"></i></a>
                            </div>
                        </div>
                    </div>
                    <div id="all-comment">评论</div>
                    <div class="input-group mb-3 comment">
                        <input type="text" class="form-control" placeholder="评论" aria-label="Recipient's username"
                               aria-describedby="basic-addon2">
                        <div class="input-group-append">
                            <button class="btn btn-outline-secondary"
                                    onclick="publish_comment(this,<s:property value="#circle.dynamicId"/>);"
                                    type="button">发表
                            </button>
                        </div>
                    </div>
                </div>
            </s:iterator>
            <button type="button" class="btn btn-primary btn-lg btn-block load-more" id="load-more">查看更多消息</button>
        </div>
    </div>
</div>
<jsp:include page="../components/tipModal.jsp" />
<script>
  $(function () {
    pic_see();
    $("#all-comment").hide();
    $("#load-more").click(function () {
      loadMore();
    });
    $("#refresh").click(function () {
      refresh();
    });
    $(".pinglun").click(function (e) {
      e.preventDefault();
      $(this).parent().parent().parent().next().next().children(".form-control").focus();
    });
  });

  //图片查看插件
  function pic_see() {
    baguetteBox.run('.baguetteBox', {
      //options
    });
  }

  //发表评论
  function publish_comment(dom, dynamicId) {
    var comment_text = $(dom).parent().prev().val();
    $.ajax({
      type: "post",
      url: "alumniCircle/publishZCQ.action",
      data: { commentText: comment_text, dynamicId: dynamicId },
      dataType: "html",//预期服务器返回的数据类型
      success: function (msg) {
        $(dom).parent().parent().prev().children("p").remove();
        $(dom).parent().parent().prev().children("ul").append(msg);
        $(dom).parent().prev().val("").blur(); //清空input,并且失去焦点
      },
      error: function (e) {
        alert("评论失败" + e);
      }
    });
  }

  <!--查看评论-->
  function comment_show(dom, dynamicId) {
    var $this_comment = $(dom).parent().parent().parent().next("#all-comment");
    var comment_content = $(dom).parent().parent().parent().next("#all-comment");
    if ($this_comment.is(':visible')) {
      $this_comment.hide();
    } else {
      $this_comment.show();
      $.ajax({
        type: "post",
        url: "alumniCircle/commentZCQ.action",
        data: { dynamicId: dynamicId },
        dataType: "html",//预期服务器返回的数据类型
        success: function (msg) {
          $this_comment.empty().append(msg);
        },
        error: function (e) {
          alert("查看评论失败" + e);
        }
      });
    }
  }

  <!--添加收藏-->
  function add_collection(dynamicId) {
    var $modalBody = $('.modal-body p');
    var $tip = $('#tip-modal');
    $.ajax({
      type: "post",
      url: "alumniCircle/addCollectionZCQ.action",
      data: { dynamicId: dynamicId },
      dataType: "text",//预期服务器返回的数据类型
      success: function (msg) {
        if (msg == "success") {
          $modalBody.html('收藏成功！');
          $tip.modal();
        } else {
          $modalBody.html('收藏失败！');
          $tip.modal();
        }
      },
      error: function (e) {

      }
    });
  }

  <!--查看更多的动态-->
  function loadMore() {
    $.ajax({
      type: "post",
      url: "alumniCircle/loadMoreZCQ.action",
      dataType: "html",//预期服务器返回的数据类型
      success: function (msg) {
        $("#load-more").before($(msg));
        pic_see(); //每重新加进来的动态，重新加载插件
      },
      error: function (e) {
        alert("返回失败" + e);
      }
    });
  }

  <!--动态刷新-->
  function refresh() {
    $.ajax({
      type: "post",
      url: "alumniCircle/refreshZCQ.action",
      dataType: "html",//预期服务器返回的数据类型
      success: function (msg) {
        $("#refresh").after($(msg));
        pic_see(); //每重新加进来的动态，重新加载插件
      },
      error: function (e) {
        alert("返回失败" + e);
      }
    });
  }
</script>
</body>
</html>

