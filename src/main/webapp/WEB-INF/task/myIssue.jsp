<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: 残
  Date: 2019/5/26
  Time: 11:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="zh-CN">
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="content-language" content="zh-CN"/>
    <title><s:if test="#session.user!=null">${sessionScope.user.userName} | </s:if>我发布的任务</title>
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/bootstrap.min.css">
    <link href="${pageContext.servletContext.contextPath}/css/carousel.css" rel="stylesheet"/>
    <script src="${pageContext.servletContext.contextPath}/js/jquery.min.js"></script>
    <script src="${pageContext.servletContext.contextPath}/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.servletContext.contextPath}/js/utils/core.js"></script>
    <jsp:include page="../components/tipModal.jsp"/>
    <script>
        $(function () {
            $('.delete').on('click', function (e) {
                var $tip = $('#tip-modal');
                var $modalBody = $('.modal-body p');
                var taskId = $(this).parent().parent().data('taskId');
                var data = 'task.taskId=' + taskId;
                $.ajax({
                    url: '${pageContext.servletContext.contextPath}/task/add/task_delete',
                    type: 'POST',
                    data: data,
                    success: function (result, status, xhr) {
                        if (result.code !== 1) {
                            $modalBody.html(result.tip);
                            $tip.modal();
                        } else {
                            $modalBody.html('删除成功');
                            $tip.one('shown.bs.modal', function (e) {
                                setTimeout(function () {
                                    $tip.modal('hide');
                                }, 3000);
                            });
                            $tip.modal();
                            $tip.one('hidden.bs.modal', function (e) {
                                window.location.replace("${pageContext.servletContext.contextPath}/task/index");
                            });
                        }
                    }
                });
            });
        })
    </script>
</head>
<body>
<jsp:include page="../header/header.jsp">
    <jsp:param name="taskActive" value="active"/>
</jsp:include>
<div class="container">
    <div class="row mt-4">
        <div class="col-2">
            <a href="javascript:history.go(-1)">
                <button class="btn btn-primary">返回</button>
            </a>
        </div>
    </div>
    <s:iterator value="list" status="st">
    <s:if test="#st.first">
    <div class="card-deck  mt-5"></s:if>
        <div class="card" data-task-id="${taskId}">
            <div class="card-body">
                <h5 class="card-title">姓名：<s:property value="user.userName"/><br></h5>
                <p class="card-text">
                    电话：<s:property value="user.userPhone"/><br>
                    地址：<s:property value="user.userAddress"/><br>
                    公司/商家：<s:property value="taskCompany"/><br>
                    数量：<s:property value="taskQuantity"/><br>
                    <s:if test="taskType==0">大小：<s:property value="taskSize"/><br></s:if>
                    费用：<s:property value="taskMoney"/><br>
                    备注信息：<s:property value="taskMessage"/><s:if test="taskMessage==null">无</s:if>
                </p>
            </div>
            <div class="card-footer">
                <small class="text-muted">类型：<s:if test="taskType==0">快递</s:if><s:else>外卖</s:else></small>
                <s:if test="taskStatus == -1">
                    <small style="color:red;align:center;">已被接受</small>
                </s:if>
                <button type="button" class="btn btn-link text-muted delete"
                        style="padding-top:1px;float:right;font-size:12.8px "
                        <s:if test="taskStatus == -1">disabled</s:if>
                >删除
                </button>
                <div style="padding-top:1px;float:right;font-size:12.8px ">/</div>
                <a href="${pageContext.servletContext.contextPath}/task/modify?taskId=${taskId}" style="text-decoration:none">
                    <button type="button" class="btn btn-link text-muted"
                            style="padding-top:1px;float:right;font-size:12.8px "
                            <s:if test="taskStatus == -1">disabled</s:if>
                    >修改
                    </button>
                </a>
            </div>
        </div>
        <s:if test="#st.count % 3 == 0 "></div>
    <div class="card-deck  mt-5"></s:if>
        </s:iterator>
        <s:if test="#st.count % 3 == 0 "> </div>
    </s:if>

</div>
</body>
</html>
