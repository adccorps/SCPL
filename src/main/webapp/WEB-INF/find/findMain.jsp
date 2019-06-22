<%--
  Created by IntelliJ IDEA.
  User: 臻
  Date: 2019/6/21
  Time: 0:10
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="zh-CN">
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <meta http-equiv="content-language" content="zh-CN" />
    <title><s:if test="#session.user!=null">${sessionScope.user.userName} | </s:if>寻物界面首页</title>
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/find.index.css">
    <link href="${pageContext.servletContext.contextPath}/css/carousel.css" rel="stylesheet" />
    <script src="${pageContext.servletContext.contextPath}/js/jquery.min.js"></script>
    <script src="${pageContext.servletContext.contextPath}/js/bootstrap.bundle.min.js"></script>
</head>
<body>

<div class="container">
    <jsp:include page="findHeader.jsp">
        <jsp:param name="" value="" />
    </jsp:include>


    <div class="col-12">
        <ul class="list-group">
            <li class="list-group-item">
                <div >物品当前状态：${session.find.status}</div>
            </li>
            <li class="list-group-item">
                <div >物品名称：${session.find.title}</div>
            </li>
            <li class="list-group-item">
                <div >物品类型：${session.find.type}</div>
            </li>
            <li class="list-group-item">
                <div >丢失/捡取时间：${session.find.date}</div>
            </li>
            <li class="list-group-item">
                <div>丢失/拾取地点：${session.find.adders}</div>
            </li>
            <li class="list-group-item">
                <div>联系手机：${session.find.mobile}</div>
            </li>
            <li class="list-group-item">
                <div>联系人：${session.find.name}</div>
            </li>

            <li class="list-group-item">
                <div>详细描述：${session.find.desc}</div>
            </li>

            <li class="list-group-item">


                <div id="imgUrl"></div>


            </li>

            <s:if test="#session.find.status==2">
                <s:if test="#session.find.up.userId!=#session.user.userId">
                    <li class="list-group-item">
                        <button class="btn-primary btn"  data-toggle="modal" data-target="#noModal">我有异议</button>
                    </li>
                </s:if>

            </s:if>

            <s:if test="#session.find.status==0" >
                <s:if test="#session.find.up.userId==#session.user.userId">
                <li class="list-group-item">
                    <button class="btn-primary btn"  data-toggle="modal" data-target="#FindmyModal">我已找到</button>
                </li>
                </s:if>
                <s:else>
                <li class="list-group-item">
                    <button class="btn-primary btn"  data-toggle="modal" data-target="#myModal">我是失主</button>
                </li>
                </s:else>
            </s:if>

            <s:if test="#session.find.status==1" >
                <s:if test="#session.find.up.userId!=#session.user.userId">
                    <li class="list-group-item">
                        <button class="btn-primary btn"  data-toggle="modal" data-target="#myModal">我是失主</button>
                    </li>
                </s:if>
            </s:if>

        </ul>
    </div>


</div>
<!-- 模态框 -->
<div class="modal fade" id="FindmyModal">
    <div class="modal-dialog">
        <div class="modal-content">

            <!-- 模态框头部 -->
            <div class="modal-header">
                <h4 class="modal-title">感谢信</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>

            <!-- 模态框主体 -->
            <div class="modal-body">
                感谢内容：<br>
                &nbsp;&nbsp;&nbsp;我在此平台发布的失物信息已被完整找回，感谢平台
                <br>感谢人：${sessionScope.user.userName}
            </div>

            <!-- 模态框底部 -->

            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal" id="ganxie">确认</button>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
            </div>

        </div>
    </div>
</div>

<div class="modal fade" id="noModal">
    <div class="modal-dialog">
        <div class="modal-content">

            <!-- 模态框头部 -->
            <div class="modal-header">
                <h4 class="modal-title">我对此公示有异议</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>

            <!-- 模态框主体 -->
            <div class="modal-body">
                公示内容：<br>
                &nbsp;&nbsp;&nbsp;我对此物品的领取人的身份有异议，请求平台进行重新审核。
                <br>发起人：${sessionScope.user.userName}
            </div>

            <!-- 模态框底部 -->

            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal" id="yijian">确认</button>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
            </div>

        </div>
    </div>
</div>
<div class="modal fade" id="myModal">
    <div class="modal-dialog">
        <div class="modal-content">

            <!-- 模态框头部 -->
            <div class="modal-header">
                <h4 class="modal-title">请求公示</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>

            <!-- 模态框主体 -->
            <div class="modal-body">
               公示内容：<br>
                &nbsp;&nbsp;&nbsp;我是当前物品的真正失主，并且已经与信息发布者取得联系，为了平台公正性，我愿意将此条信息公示。
                <br>公示人：${sessionScope.user.userName}
            </div>

            <!-- 模态框底部 -->

            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal" id="gongshi">确认</button>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
            </div>

        </div>
    </div>
</div>
</body>
<script>
    function say(){ //点击自定义函数
        $.ajax({        //更改数据库数据并更改当前seesion值
            url: '${pageContext.servletContext.contextPath}/find/changeStatus',
            type: 'POST',
            data: {},
            success: function (result, status, xhr) {
                console.log(result)
                if (result.code !== 1) {
                    alert("失败，请重新公示");
                } else {
                    window.location.replace( '${pageContext.servletContext.contextPath}/find/findPersonal');
                }
            }
        });
    }

    function thanks(){ //点击自定义函数
        $.ajax({        //更改数据库数据并更改当前seesion值
            url: '${pageContext.servletContext.contextPath}/find/toend',
            type: 'POST',
            data: {},
            success: function (result, status, xhr) {
                console.log(result)
                if (result.code !== 1) {
                    alert("失败，请重新公示");
                } else {
                    window.location.replace( '${pageContext.servletContext.contextPath}/find/findPersonal');
                }
            }
        });
    }
    function yijian(){ //点击自定义函数
        $.ajax({        //更改数据库数据并更改当前seesion值
            url: '${pageContext.servletContext.contextPath}/find/yijian',
            type: 'POST',
            data: {},
            success: function (result, status, xhr) {
                console.log(result)
                if (result.code !== 1) {
                    alert("失败，请重新公示");
                } else {
                    window.location.replace( '${pageContext.servletContext.contextPath}/find/findPersonal');
                }
            }
        });
    }
    $(function(){
        $('#gongshi').click(function(){//ID为test的元素点击时
            say();
        });
        $('#ganxie').click(function(){//ID为test的元素点击时
            thanks();
        });
        $('#yijian').click(function () {
            yijian();
        })
        var img=new Array();
        var str = '${session.find.picUrl}'
        if(str.split(",")!=null) {
            img.push(str.split(","));
            str = str.split(",")[1];
        }
        $('#imgUrl').append("图片：")
        console.log(img);
        for(var i =0;i<img[0].length-1;i++) {
            $('#imgUrl').append('<img style="height:200px;width: 200px" src='+img[0][i]+'>')
            console.log(i);
        }
    });
</script>
</html>
