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
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/zico.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/zcq/baguetteBox.css" rel="stylesheet">
    <link href="${pageContext.servletContext.contextPath}/css/carousel.css" rel="stylesheet" />
    <script src="${pageContext.servletContext.contextPath}/js/jquery.min.js"></script>
    <script src="${pageContext.servletContext.contextPath}/js/baguetteBox.js"></script>
    <script src="${pageContext.servletContext.contextPath}/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<jsp:include page="../header/header.jsp">
    <jsp:param name="alumniCircleActive" value="active"/>
</jsp:include>
<div class="container">
    <div class="row">
        <div class="col-lg-3 nav">
            <div class="list-group">
                <button type="button" class="list-group-item list-group-item-action active bt" disabled>校友圈</button>
                <a href="${pageContext.servletContext.contextPath}/alumniCircle/indexZCQ.action" class="alert-link">
                    <button type="button" class="list-group-item list-group-item-action this-page"><i class="zi zi_users"></i> 校友动态</button></a>
                <a href="${pageContext.servletContext.contextPath}/alumniCircle/myCircleMine.action?userId=<s:property value="#session.user.userId"/>" class="alert-link">
                    <button type="button" class="list-group-item list-group-item-action"><i class="zi zi_user"></i> 我的动态</button></a>
                <a href="${pageContext.servletContext.contextPath}/alumniCircle/send" class="alert-link">
                    <button type="button" class="list-group-item list-group-item-action"><i class="zi zi_camera" zico="相机"></i> 发动态</button></a>
                <a href="${pageContext.servletContext.contextPath}/alumniCircle/findCollectionDynamicCOLL.action?userId=<s:property value="#session.user.userId"/>" class="alert-link">
                    <button type="button" class="list-group-item list-group-item-action"><i class="zi zi_box" zico="箱子"></i> 收藏</button></a>
            </div>
        </div>
        <div class="col-lg-9 main">
            <figure class="figure">
                <img src="${pageContext.servletContext.contextPath}/assets/img/bg-default.jpg" class="img-fluid" alt="Responsive image">
                <figcaption class="figure-caption">个性签名：A caption for the above image.</figcaption>
            </figure>
            <button type="button" id="refresh" class="btn btn-primary btn-lg btn-block refresh ">点击刷新</button>

            <s:if test="#request.allCircleList.size()==0">
                <div class="card shadow p-3 mb-5 bg-white rounded" style="">
                    <a href="#" class="text-decoration-none text-center">还没有任何动态，快去发条动态看看吧...</a>
                </div>
            </s:if>
            <s:else>
            <s:iterator value="#request.allCircleList" var="circle">
                <div class="card row-top" style="">
                    <div class="card-body card-body-main">
                        <div class="row">
                            <div class="col-6 col-sm-1"><a href="#"><img src="<s:property value="#circle.user.userAvatar"/>" alt="头像" class="rounded-circle touxiang"></a></div>
                            <div class="col-6 col-sm-3 user-info">
                                <a class="h6 font-weight-bold user-name" href="${pageContext.servletContext.contextPath}/alumniCircle/myCircleMine.action?userId=<s:property value="#circle.user.userId"/>"><s:property value="#circle.user.userName"/></a><br> <!--发动态的用户名-->
                                <div class="time"><s:date name="#circle.date" format="yyyy-MM-dd HH:mm:ss" /></div>
                            </div>
                        </div>
                        <p class="card-text"><s:property value="#circle.content"/></p>
                        <div class="user-imgs baguetteBox">
                            <s:generator val="#circle.picAddress" separator="," var="p">
                                <s:if test="#circle.picCount==1">
                                    <s:iterator status="st">
                                        <a href="http://10.2.16.131/images/<s:property/>" target="_Blank">
                                            <img src="http://10.2.16.131/images/<s:property/>" alt="" style="width: 300px;">
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
                            <div class="col-12 col-sm-3"><div class="zi zi_love"></div><a href="javascript:void(0);" onclick="likes_show(this,<s:property value="#circle.dynamicId"/>)" class="card-link">点赞用户</a></div>
                            <div class="col-12 col-sm-3"><div class="zi zi_msgchat"></div><a href="javascript:void(0);" onclick="comment_show(this,<s:property value="#circle.dynamicId"/>)" class="card-link all-comments">所有评论</a></div>
                            <div class="col-12 col-sm-2"></div>
                            <div class="col-12 col-sm-1"></div>
                            <div class="col-12 col-sm-1"><!--点赞图标-->
                                <a href="javascript:void (0);" onclick="add_likes(this,<s:property value="#circle.dynamicId"/>)" class="alert-link dianzan" title="点赞">
                                   <s:if test="#session.allLikes.contains(#circle.dynamicId)"><i class="zi zi_thumbsup"></i></s:if>
                                    <s:else><i class="zi zi_digg"></i></s:else>
                                </a>
                            </div>
                            <div class="col-12 col-sm-1"><a href="javascript:void (0);" onclick="onclick_pl(this)" class="alert-link pinglun" title="评论"><i class="zi zi_fxqp"></i></a></div><!--评论图标-->
                            <div class="col-12 col-sm-1">
                                <a href="javascript:void (0);" onclick="add_collection(this,<s:property value="#circle.dynamicId"/>)" class="alert-link shoucang" title="收藏">
                                    <s:if test="#session.allCollection.contains(#circle.dynamicId)"><i class="zi zi_star"></i></s:if>
                                    <s:else><i class="zi zi_starLine"></i></s:else>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div id="all-comment">评论</div>
                    <div class="input-group mb-3 comment">
                        <input type="text" class="form-control" placeholder="评论" aria-label="Recipient's username" aria-describedby="basic-addon2">
                        <div class="input-group-append">
                            <button class="btn btn-outline-secondary" onclick="publish_comment(this,<s:property value="#circle.dynamicId"/>);" type="button">发表</button>
                        </div>
                    </div>
                </div>
            </s:iterator>
            </s:else>
            <button type="button" class="btn btn-primary btn-lg btn-block load-more" id="load-more">查看更多消息</button>
                <p class="text-center font-weight-bold" style="margin-top: 10px;"><a class="back-top" href="javascript:void(0)">回到顶部</a></p>
        </div>
    </div>
</div>
<jsp:include page="../components/tipModal.jsp" />
<script>
    $(function(){
        pic_see();
        $("#all-comment").hide();
        $("#load-more").click(function(){
            loadMore();
        });
        $("#refresh").click(function(){
            refresh();
        });
        $(document).on('click', '.back-top', function () {
            var $html_body = $('html,body');
            $html_body.stop();
            $html_body.animate({
                scrollTop: 0
            }, 500);
        });
    });

    //点击评论
    function onclick_pl(e){
        $(e).parent().parent().parent().next().next().children("input").focus();
    }

    //图片查看插件
    function pic_see(){
        baguetteBox.run('.baguetteBox', {
            //options
        });
    }

    //发表评论
    function publish_comment(dom,dynamicId){
        var comment_text = $(dom).parent().prev().val();
        $.ajax({
            type:"post",
            url:"alumniCircle/publishZCQ.action",
            data:{commentText: comment_text,dynamicId:dynamicId},
            dataType:"html",//预期服务器返回的数据类型
            success:function(msg){
                var $modalBody = $('.modal-body p');
                var $tip = $('#tip-modal');
                if(msg=="usernull"){
                    $modalBody.html('登录后才能发表评论');
                    $tip.modal();
                }else{
                    $(dom).parent().parent().prev().children("p").remove();
                    $(dom).parent().parent().prev().children("ul").append(msg);
                }
                $(dom).parent().prev().val("").blur(); //清空input,并且失去焦点
            },
            error:function(e){

            },
        });
    }

    <!--查看所有点赞的用户名-->
    function likes_show(dom,dynamicId){
        var $this_comment =  $(dom).parent().parent().parent().next("#all-comment");
        var comment_content =  $(dom).parent().parent().parent().next("#all-comment");
        if($this_comment.is(':visible')){
            $this_comment.hide("slow");
        }else{
            $this_comment.show("slow");
            $.ajax({
                type:"post",
                url:"alumniCircle/likesZCQ.action",
                data:{dynamicId: dynamicId},
                dataType:"html",//预期服务器返回的数据类型
                success:function(msg){
                    $this_comment.empty().append(msg);
                },
                error:function(e){
                    var $modalBody = $('.modal-body p');
                    var $tip = $('#tip-modal');
                    $modalBody.html('查看点赞用户失败，请查看是否登录');
                    $tip.modal();
                },
            });
        }
    }

    <!--查看评论-->
    function comment_show(dom,dynamicId){
        var $this_comment =  $(dom).parent().parent().parent().next("#all-comment");
        var comment_content =  $(dom).parent().parent().parent().next("#all-comment");
        if($this_comment.is(':visible')){
            $this_comment.hide("slow");
        }else{
            $this_comment.show("slow");
            $.ajax({
                type:"post",
                url:"alumniCircle/commentZCQ.action",
                data:{dynamicId: dynamicId},
                dataType:"html",//预期服务器返回的数据类型
                success:function(msg){
                    $this_comment.empty().append(msg);
                },
                error:function(e){
                    var $modalBody = $('.modal-body p');
                    var $tip = $('#tip-modal');
                    $modalBody.html('查看评论失败！');
                    $tip.modal();
                },
            });
        }
    }

    <!--添加收藏-->
    function add_collection(e,dynamicId){
        var $modalBody = $('.modal-body p');
        var $tip = $('#tip-modal');
        $.ajax({
            type:"post",
            url:"alumniCircle/addCollectionZCQ.action",
            data:{dynamicId: dynamicId},
            dataType:"text",//预期服务器返回的数据类型
            success:function(msg){
                if(msg=="success"){
                    $(e).children().removeClass("zi_starLine").addClass("zi_star");
                    $modalBody.html('收藏成功！');
                    $tip.modal();
                }else if(msg=="islikes"){
                    $(e).children().removeClass("zi_starLine").addClass("zi_star");
                    $modalBody.html('你已经收藏过此动态了！');
                    $tip.modal();
                }else if(msg=="usernull"){
                    $modalBody.html('请先登录，才能收藏此动态');
                    $tip.modal();
                }
                else{
                    $modalBody.html('收藏失败！');
                    $tip.modal();
                }
            },
            error:function(e){

            },
        });
    }

    <!--点赞-->
    function add_likes(e,dynamicId){
        var $modalBody = $('.modal-body p');
        var $tip = $('#tip-modal');
        $.ajax({
            type:"post",
            url:"alumniCircle/addLikesZCQ.action",
            data:{dynamicId: dynamicId},
            dataType:"text",//预期服务器返回的数据类型
            success:function(msg){
                if(msg=="usernull"){
                    $modalBody.html('请先登录，才能赞此动态');
                    $tip.modal();
                }else if(msg=="add"){ //成功点赞之后,修改图标的颜色
                    $(e).children().removeClass("zi_digg").addClass("zi_thumbsup");
                }else if(msg=="delete"){//删除点赞之后
                    $(e).children().removeClass("zi_thumbsup").addClass("zi_digg");
                }
            },
            error:function(e){  //请求服务器失败才会从此返回错误信息

            },
        });
    }

    <!--查看更多的动态-->
    function loadMore(){
        $.ajax({
            type:"post",
            url:"alumniCircle/loadMoreZCQ.action",
            dataType:"html",//预期服务器返回的数据类型
            success:function(msg){
                $("#load-more").before($(msg));
                pic_see(); //每重新加进来的动态，重新加载插件
            },
            error:function(e){
                alert("返回失败"+e);
            },
        });
    }

    <!--动态刷新-->
    function refresh(){
        $.ajax({
            type:"post",
            url:"alumniCircle/refreshZCQ.action",
            dataType:"html",//预期服务器返回的数据类型
            success:function(msg){
                $("#refresh").after($(msg));
                pic_see(); //每重新加进来的动态，重新加载插件
            },
            error:function(e){
                alert("返回失败"+e);
            },
        });
    }
</script>
</body>
</html>

