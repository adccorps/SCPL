<%--
  Created by IntelliJ IDEA.
  User: 臻
  Date: 2019/6/8
  Time: 14:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/find_cwz.css">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/zcq/send.css">
    <script src="${pageContext.servletContext.contextPath}/js/jquery.min.js"></script>
    <script src="${pageContext.servletContext.contextPath}/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<%request.setCharacterEncoding("utf-8"); %>
<nav class="navbar-inner" style="background-color:#343a40 !important;color: #343a40 !important">
</nav>

<div class="container">
    <div class="container">
        <nav class="navbar navbar-expand-lg navbar-light bg-light main-nav-width ">

            <a class="navbar-brand nav-icon-li-far" href="${pageContext.servletContext.contextPath}/find/findIndex"><button type="button" class="btn btn-danger"><-返回</button></a>
        </nav>
    </div>

    <form class="form-horizontal"  action="${pageContext.servletContext.contextPath}/find/test.action">
            <link href="${pageContext.servletContext.contextPath}/css/find_cwz.css" rel="stylesheet" />
            <!-- Form Name -->
            <legend>Form Name</legend>

            <!-- Multiple Radios (inline) -->

            <div class="control-group">
                <label class="control-label" >发布类型：</label>
                <div class="controls">
                    <label class="radio inline" for="multipleradiosinline-0-0">
                        <input name="find.status" id="multipleradiosinline-0-0" type="radio" checked="checked" value="0">
                        失物启事
                    </label>
                    <label class="radio inline" for="multipleradiosinline-0-1">
                        <input name="find.status" id="multipleradiosinline-0-1" type="radio" value="1">
                        招领启事
                    </label>
                </div>
            </div>

            <!-- Text input-->
            <div class="control-group">
                <label class="control-label" for="textinput-1">发布标题：</label>
                <div class="controls">
                    <input name="find.title" class="input-xlarge" id="textinput-1" type="text" placeholder="25字内（如：寻找/拾到身份证）">

                </div>
            </div>

            <!-- Select Basic -->
            <div class="control-group">
                <label class="control-label" for="selectbasic-0">物品类型：</label>
                <div class="controls">
                    <select name="find.type" class="input-xlarge" id="selectbasic-0">
                        <option value="钱包/钥匙">钱包/钥匙</option>
                        <option value="衣服/背包">衣服/背包</option>
                        <option value="手机/电脑">手机/电脑</option>
                        <option value="书本/文件">书本/文件</option>
                        <option value="首饰/挂饰">首饰/挂饰</option>
                        <option value="行李/快递">行李/快递</option>
                        <option value="学生证/证件">学生证/证件</option>
                        <option value="其他">其他</option>
                    </select>
                </div>
            </div>

            <!-- Text input-->
            <div class="control-group">
                <label class="control-label" for="textinput-5">丢失/拾取时间：</label>
                <div class="controls">
                    <input name="find.date" value="" class="input-xlarge" id="textinput-5" type="text" placeholder="">

                </div>
            </div>

            <!-- Text input-->
            <div class="control-group">
                <label class="control-label" for="textinput-4">丢失/拾取地点：</label>
                <div class="controls">
                    <input name="find.adders"  value="" class="input-xlarge" id="textinput-4" type="text" placeholder="（如：松田 操场）">

                </div>
            </div>

            <!-- Text input-->
            <div class="control-group">
                <label class="control-label" for="textinput-2">联系手机：</label>
                <div class="controls">
                    <input name="find.mobile" value="" class="input-xlarge" id="textinput-2" type="text" placeholder="11位手机号码">

                </div>
            </div>

            <!-- Text input-->
            <div class="control-group">
                <label class="control-label" for="textinput-3">联系人：</label>
                <div class="controls">
                    <input name="find.name"  value="" class="input-xlarge" id="textinput-3" type="text" placeholder="名字">

                </div>
            </div>

            <!-- File Button -->
            <div class="control-group">
                <label class="control-label" >物品图片：</label>
                <div class="user-imgs" style="padding-top: 5px;padding-left: 120px">
                    <div class="uploadImgBtn" id="uploadImgBtn">
                        <!--****************************************************-->
                        <input id="circlePic" class="uploadImg" type="file" name="file" multiple/>
                    </div>
                    <div id="picShow" class="col-md-12">

                    </div>
                </div>
            </div>

            <!-- Textarea -->
            <div class="control-group">
                <label class="control-label" for="textarea-0">详细描述：</label>
                <div class="controls">
                    <textarea name="find.desc"   value="" id="textarea-0">300字内（如：在食堂丢失名字为xxx的身份证 / 在操场中央捡到一个名字为xxx的学生证）</textarea>
                </div>
            </div>

            <!-- Button (Double) -->
            <div class="control-group">
                <label class="control-label" for="doublebutton-1"></label>
                <div class="controls">
                    <button name="doublebutton-1" class="btn btn-success" id="doublebutton-1">发布</button>
                    <button name="doublebutton2-1" class="btn btn-danger" id="doublebutton2-1">重置</button>
                </div>
            </div>
            <button id="formSm" type="submit" class="btn btn-primary btn-lg btn-block send-message">发表</button>
    </form>
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
            $.ajax({
                url: 'http://10.2.16.131:8080/UploadImg/upload',
                data: formData,
                type: 'POST',
                cache: false,
                contentType: false,
                processData: false,
                success: function (datas) {
                    var formData = new FormData();
                    formData.append("find.status",$("input[type='radio']:checked").val());//单选框的值
                    formData.append("find.title", $("#textinput-1").val());
                    formData.append("find.date", $("#textinput-5").val());
                    formData.append("find.adders",  $("#textinput-4").val());
                    formData.append("find.mobile", $("#textinput-2").val());
                    formData.append("find.name", $("#textinput-3").val());
                    if (datas.error === 0) {
                        // $.ajax()  无错误才上传到后台 append表单数据进formdata
                        formData.append("files", datas.data);;
                        // console.log($("#goodsName").val());
                        $.ajax({
                            url: "${pageContext.servletContext.contextPath}/find/test.action",
                            type: 'POST',
                            data: formData,
                            cache: false,
                            contentType: false,
                            processData: false,
                            success: function (successData) {
                                console.log(successData);
                                //成功之后需要跳转
                                <%--if (da.shopError === 0) {--%>
                                <%--    $('.modal-footer>button').click(function () {--%>
                                <%--        window.location.replace("${pageContext.servletContext.contextPath}/find/findIndex");--%>
                                <%--    })--%>
                                <%--}--%>

                            }

                        })
                    }else if(datas.error === -1){ //无图片
                        console.log(formData);
                        $.ajax({
                            url: '${pageContext.servletContext.contextPath}/find/test.action',
                            data: formData,
                            type: 'POST',
                            success: function (m) {
                                $modalBody.html('发送成功！');
                                $tip.modal();
                                setTimeout(function(){
                                    window.location.href="${pageContext.servletContext.contextPath}/find/test.action";
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
