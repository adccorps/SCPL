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
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/zcq/myCircle.css">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/zico.min.css" rel="stylesheet">
    <link href="${pageContext.servletContext.contextPath}/css/carousel.css" rel="stylesheet" />
    <script src="${pageContext.servletContext.contextPath}/js/jquery.min.js"></script>
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
                <a href="${pageContext.servletContext.contextPath}/alumniCircle/index" class="alert-link">
                    <button type="button" class="list-group-item list-group-item-action"><i class="zi zi_users"></i> 校友动态</button></a>
                <a href="${pageContext.servletContext.contextPath}/alumniCircle/myCircle" class="alert-link">
                    <button type="button" class="list-group-item list-group-item-action"><i class="zi zi_user"></i> 我的动态</button></a>
                <a href="${pageContext.servletContext.contextPath}/alumniCircle/send" class="alert-link">
                    <button type="button" class="list-group-item list-group-item-action"><i class="zi zi_camera" zico="相机"></i> 发动态</button></a>
                <a href="${pageContext.servletContext.contextPath}/alumniCircle/message" class="alert-link">
                    <button type="button" class="list-group-item list-group-item-action"><i class="zi zi_commentdots" zico="消息黑"></i> 消息</button></a>
                <a href="${pageContext.servletContext.contextPath}/alumniCircle/collection" class="alert-link">
                    <button type="button" class="list-group-item list-group-item-action"><i class="zi zi_box" zico="箱子"></i> 收藏</button></a>
            </div>
        </div>
        <div class="col-lg-9 main">
            <figure class="figure">
                <img src="${pageContext.servletContext.contextPath}/assets/img/bg-default.jpg" class="img-fluid" alt="Responsive image">
                <figcaption class="figure-caption">个性签名：A caption for the above image.</figcaption>
            </figure>


            <s:iterator value="#request.allCircleList" var="circle">
                <div class="card" style="" id="circle-node<s:property value="#circle.dynamicId"/>">
                    <div class="card-body card-body-main">
                        <div class="row">
                            <div class="col-12 col-sm-1"><a href="#"><img src="<s:property value="#circle.user.userAvatar"/>" alt="头像" class="rounded-circle touxiang"></a></div>
                            <div class="col-12 col-sm-6 user-info">
                                <a class="h6 font-weight-bold user-name" href="#"><s:property value="#circle.user.userName"/></a><br> <!--发动态的用户名-->
                                <div class="time"><s:property value="#circle.date"/></div>
                            </div>
                            <div class="col-12 col-sm-4"></div>
                            <div class="col-12 col-sm-1"><!--删除此动态-->
                                <a href="" id="delete" title="删除此动态" onClick="javascript:return del(<s:property value="#circle.dynamicId"/>)">
                                    <i class="zi zi_times" zico="错号粗黑"></i>
                                </a>
                            </div>
                        </div>
                        <p class="card-text"><s:property value="#circle.content"/></p>
                        <div class="user-imgs">
                            <s:generator val="#circle.picAddress" separator=";" var="p">
                                <s:if test="#circle.picCount==1">
                                    <s:iterator status="st">
                                        <a href="http://10.2.16.131/images/<s:property/>" target="_Blank">
                                            <img src="http://10.2.16.131/images/<s:property/>" alt="" style="width: 300px;">
                                        </a>
                                    </s:iterator>
                                </s:if>
                                <s:else>
                                    <s:iterator status="st">
                                        <a href="http://10.2.16.231:8088/UploadImg/images/<s:property/>" target="_Blank">
                                            <img src="http://10.2.16.231:8088/UploadImg/images/<s:property/>" alt="">
                                        </a>
                                    </s:iterator>
                                </s:else>
                            </s:generator>
                        </div>
                        <div class="row">
                            <div class="col-12 col-sm-3"><div class="zi zi_love"></div><a href="#" class="card-link"><s:property value="#circle.likes"/>人觉得很赞</a></div>
                            <div class="col-12 col-sm-3"><div class="zi zi_msgchat"></div><a href="#" class="card-link"><s:property value="#circle.commentCount"/>条评论</a></div>
                            <div class="col-12 col-sm-2"></div>
                            <div class="col-12 col-sm-1"></div>
                            <div class="col-12 col-sm-1"><a href="" class="alert-link" title="点赞"><i class="zi zi_digg"></i></a></div><!--点赞图标-->
                            <div class="col-12 col-sm-1"><a href="" class="alert-link" title="评论"><i class="zi zi_fxqp"></i></a></div><!--评论图标-->
                            <div class="col-12 col-sm-1"><a href="" class="alert-link" title="收藏"><i class="zi zi_box" zico="箱子"></i></a></div>
                        </div>
                    </div>
                    <div class="input-group mb-3 comment">
                        <input type="text" class="form-control" placeholder="评论" aria-label="Recipient's username" aria-describedby="basic-addon2">
                        <div class="input-group-append">
                            <button class="btn btn-outline-secondary" type="button">发表</button>
                        </div>
                    </div>
                </div>
            </s:iterator>

        </div>
    </div>
</div>
<jsp:include page="../components/tipModal.jsp" />
<script>
    function del(dynamic_id) {
        var msg = "删除后无法恢复，确定要删除吗？";
        if (confirm(msg)==true){

            deleteCircle(dynamic_id);
            return false;
        }else{
            return false;
        }
    }
    function deleteCircle(dynamic_id){
        var $modalBody = $('.modal-body p');
        var $tip = $('#tip-modal');
        $.ajax({
            type:"post",
            url:"alumniCircle/deleteCircleMine.action",
            dataType:"text",//预期服务器返回的数据类型
            data: { dynamicid: dynamic_id },
            success:function(msg){
                if(msg=="success"){
                    $divID = "#circle-node"+dynamic_id;
                    $($divID).hide("slow");
                }else{
                    $modalBody.html('删除失败，请稍后重试...');
                    $tip.modal();
                }
            },
            error:function(e){
                $modalBody.html('删除失败，请稍后重试...');
                $tip.modal();
            },
        });
    }
</script>
</body>
</html>


