<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: 残
  Date: 2019/5/15
  Time: 22:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="zh-CN">
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="content-language" content="zh-CN"/>
    <title><s:if test="#session.user!=null">${sessionScope.user.userName} | </s:if>发布任务</title>
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/bootstrap.min.css">
    <link href="${pageContext.servletContext.contextPath}/css/carousel.css" rel="stylesheet" />
    <script src="${pageContext.servletContext.contextPath}/js/jquery.min.js"></script>
    <script src="${pageContext.servletContext.contextPath}/js/bootstrap.bundle.min.js"></script>
    <script>
        $(function () {
            $("#exampleFormControlSelect1").change(function () {
                if ($(this).val()==1){
                    $("#size").attr("hidden",true)
                }else if ($(this).val()==0){
                    $("#size").attr("hidden",false)
                }
            })
            $('.publish').on('click', function (e) {
                var data = $('form').serialize();
                $.ajax({
                    url: '${pageContext.servletContext.contextPath}/task/add/task_add',
                    type: 'POST',
                    data:data,
                    success: function (result, status, xhr) {
                        console.log(result);
                        console.log(xhr);
                    }
                });
            });
        })
    </script>
</head>
<body>
<jsp:include page="../header/header.jsp">
    <jsp:param name="taskActive" value="active" />
</jsp:include>


<div class="container mt-5">


    <form>
        <div class="form-row">
            <div class="col">
                <label for="exampleFormControlInput1">姓名</label>
                <input type="text" class="form-control" id="exampleFormControlInput1" value="<s:property value="#session.user.userName"/>" disabled>
            </div>
            <div class="col">
                <label for="exampleFormControlInput2">手机号</label>
                <input type="text" class="form-control" id="exampleFormControlInput2" value="<s:property value="#session.user.userPhone"/>" disabled>
            </div>
        </div>
        <div class="form-row">
            <div class="col">
                <label for="exampleFormControlInput3">地址</label>
                <input type="text" class="form-control" id="exampleFormControlInput3" value="<s:property value="#session.user.userAddress"/>" disabled>
            </div>
            <div class="col">
                <label for="exampleFormControlSelect1">类型</label>
                <select class="form-control" id="exampleFormControlSelect1" name="task.taskType">
                <option value="0">快递</option>
                <option value="1">外卖</option>
                </select>
            </div>
        </div>
        <div class="form-row">
            <div class="col">
                <label for="exampleFormControlInput4">公司/商家</label>
                <input type="text" class="form-control" id="exampleFormControlInput4" name="task.taskCompany">
            </div>
            <div class="col">
                <label for="exampleFormControlSelect2">数量</label>
                <select class="form-control" id="exampleFormControlSelect2" name="task.taskQuantity">
                <option>1</option>
                <option>2</option>
                <option>3</option>
                <option>4</option>
                <option>5</option>
                </select>
            </div>
        </div>
        <div class="form-row">
            <div class="col" id="size">
                <label for="exampleFormControlSelect3">大小</label>
                <select class="form-control" id="exampleFormControlSelect3" name="task.taskSize">
                <option value="小">小</option>
                <option value="大">大</option>
                <option value="都有">都有</option>
                </select>
            </div>
            <div class="col">
                <label for="exampleFormControlInput5">费用</label>
                <input type="text" class="form-control" id="exampleFormControlInput5" name="task.taskMoney">
            </div>
        </div>
        <div class="form-row">
            <div class="col">
                <label for="exampleFormControlTextarea1">备注</label>
                <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" name="task.taskMessage"></textarea>
            </div>
        </div>
    </form>
    <div class="row mt-4">
        <div class="col-11"></div>
        <div class="col-1">
            <button class="btn btn-primary publish">发表</button>
        </div>
    </div>

</div>
</body>
</html>
