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
    <meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="content-language" content="zh-CN"/>
    <title><s:if test="#session.user!=null">${sessionScope.user.userName} | </s:if>校友圈</title>
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/zcq/send.css">
    <link href="${pageContext.servletContext.contextPath}/css/carousel.css" rel="stylesheet"/>
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
                <a href="${pageContext.servletContext.contextPath}/alumniCircle/indexZCQ.action" class="alert-link">
                    <button type="button" class="list-group-item list-group-item-action"><i class="zi zi_users"></i> 校友动态</button></a>
                <a href="${pageContext.servletContext.contextPath}/alumniCircle/myCircleMine.action?userId=<s:property value="#session.user.userId"/>" class="alert-link">
                    <button type="button" class="list-group-item list-group-item-action"><i class="zi zi_user"></i> 我的动态</button></a>
                <a href="${pageContext.servletContext.contextPath}/alumniCircle/send" class="alert-link">
                    <button type="button" class="list-group-item list-group-item-action"><i class="zi zi_camera" zico="相机"></i> 发动态</button></a>
                <%--<a href="${pageContext.servletContext.contextPath}/alumniCircle/message" class="alert-link">
                    <button type="button" class="list-group-item list-group-item-action"><i class="zi zi_commentdots" zico="消息黑"></i> 消息</button></a>--%>
                <a href="${pageContext.servletContext.contextPath}/alumniCircle/findCollectionDynamicCOLL.action?userId=<s:property value="#session.user.userId"/>" class="alert-link">
                    <button type="button" class="list-group-item list-group-item-action"><i class="zi zi_box" zico="箱子"></i> 收藏</button></a>
            </div>
        </div>
        <div class="col-lg-9 main">
            <h3><i class="zi zi_floppyDisk" zico="软盘"></i>&nbsp;&nbsp;这一刻你的想法</h3>
            <form action="" method="post">
                <div class="form-group">
                    <label for="exampleFormControlTextarea1">Content textarea</label>
                    <textarea class="form-control" id="exampleFormControlTextarea1" rows="3"
                              placeholder="请输入动态内容..."></textarea>
                    <div class="user-imgs">
                        <div class="uploadImgBtn" id="uploadImgBtn">
                            <!--****************************************************-->
                            <input id="circlePic" class="uploadImg" type="file" name="file" multiple/>
                        </div>
                        <div id="picShow" class="col-md-12">

                        </div>
                    </div>
                    <button id="formSm" type="submit" class="btn btn-primary btn-lg btn-block send-message">发表</button>
                </div>
            </form>
        </div>
    </div>
    <jsp:include page="../components/tipModal.jsp" />
    <script>
        /*
         * 移除图片,并移除显示
         * */
        $(document).on("click", ".close", function () {
            console.log($(".close").index(this));
            var picIndex = $(".close").index(this);
            files = files.filter(function (item) {
                return item != files[picIndex];
            });
            $(this).parent().remove();
            console.log(files);
        });

        /*
         * 显示图片
         * */
        var files = [];
        var formData = new FormData();
        $("#circlePic").on("change", function (e) {
            e.preventDefault();
            var i = this.files.length;
            for (var n = 0; n < this.files.length; n++) {
                var picUrl = getObjectURL(this.files[n]);
                files.push(this.files[n]);
                console.log(files);
                if (picUrl) {
                    $("#picShow").append(
                        "<div class='card float-left'  style='width:150px;'>" +
                        " <span class='close position-absolute'  aria-hidden='true' style='height: 20px;width: 20px;right:0 ;top: 0; cursor: pointer;'>&times;</span> " +
                        " <img src='" + picUrl + "' class='showPic' class='col-4 float-left' style='width:150px; height:150px'>" +
                        "</div>");
                }
            }

        });

        $("#formSm").click(function (e) {
            e.preventDefault();
            for (var i = 0; i < files.length; i++) {
                formData.append('files', files[i]);
            }
            console.log(formData);
            $.ajax({
                url: 'http://10.2.16.131:8080/UploadImg/upload',
                data: formData,
                type: 'POST',
                cache: false,
                contentType: false,
                processData: false,
                success: function (datas) {
                    console.log(datas);
                    var content_text = $(".form-control").val();
                    var $modalBody = $('.modal-body p');
                    var $tip = $('#tip-modal');
                    if (datas.error === 0) {
                        $.ajax({
                            url: '${pageContext.servletContext.contextPath}/alumniCircle/addCircleZCQ.action',
                            data: "picAddress=" + datas.data + "&content=" + content_text,
                            type: 'POST',
                            success: function (m) {
                                $modalBody.html('发送成功！');
                                $tip.modal();
                                setTimeout(function(){
                                    window.location.href="${pageContext.servletContext.contextPath}/alumniCircle/indexZCQ.action";
                                },1500);
                                console.log(m);
                            }
                        });
                    }else if(datas.error === -1){ //无图片
                        $.ajax({
                            url: '${pageContext.servletContext.contextPath}/alumniCircle/addCircleZCQ.action',
                            data: "content=" + content_text,
                            type: 'POST',
                            success: function (m) {
                                $modalBody.html('发送成功！');
                                $tip.modal();
                                setTimeout(function(){
                                    window.location.href="${pageContext.servletContext.contextPath}/alumniCircle/indexZCQ.action";
                                },1500);
                                console.log(m);
                            }
                        });
                    }
                },
                error:function (e) {
                    console.log("error");
                }
            });
        })

        function getObjectURL(file) {
            var url = null;
            if (window.createObjectURL != undefined) { // basic
                url = window.createObjectURL(file);
            } else if (window.URL != undefined) { // mozilla(firefox)
                url = window.URL.createObjectURL(file);
            } else if (window.webkitURL != undefined) { // webkit or chrome
                url = window.webkitURL.createObjectURL(file);
            }
            return url;
        }
    </script>
</div>
</body>
</html>


