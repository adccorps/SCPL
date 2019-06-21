<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: 残
  Date: 2019/5/18
  Time: 14:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="zh-CN">
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="content-language" content="zh-CN"/>
    <title><s:if test="#session.user!=null">${sessionScope.user.userName} | </s:if>修改任务</title>
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/bootstrap.min.css">
    <link href="${pageContext.servletContext.contextPath}/css/carousel.css" rel="stylesheet"/>
    <script src="${pageContext.servletContext.contextPath}/js/jquery.min.js"></script>
    <script src="${pageContext.servletContext.contextPath}/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.servletContext.contextPath}/js/utils/core.js"></script>
    <jsp:include page="../components/tipModal.jsp"/>
    <script>
        $(function () {
            //类型为快递时显示大小选项，类型为外卖时隐藏
            $("#type").change(function () {
                if ($(this).val() == 1) {
                    $("#size").attr("hidden", true)
                } else if ($(this).val() == 0) {
                    $("#size").attr("hidden", false)
                }
            });
            $('.publish').on('click', function (e) {
                e.preventDefault();  //阻止元素发生默认的行为
                var $tip = $('#tip-modal');
                var $modalBody = $('.modal-body p');
                var $company = $("#company");
                var $money = $("#money");

                var flag = true;
                if ($money.val().trim() === '') {
                    $false($money.next(), $money, '请输入费用');
                    flag = false;
                }
                if ($company.val().trim() === '') {
                    $false($company.next(), $company, '请输入公司');
                    flag = false;
                }

                if (!flag) {
                    return;
                }


                var data = $('form').serialize();
                $.ajax({
                    url: '${pageContext.servletContext.contextPath}/task/add/task_modify',
                    type: 'POST',
                    data: data,
                    success: function (result, status, xhr) {
                        if (result.code !== 1) {
                            $modalBody.html(result.tip);
                            $tip.modal();
                        } else {
                            $modalBody.html('修改成功');
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

            $('input[required]').on('input', function (e) {
                var $this = $(this);
                var $next = $this.next();
                if ($this.val().trim() === '') {
                    $false($next, $this, '请输入' + $('label[for=' + $this.attr('id') + ']').text().replace('：', ''));
                } else {
                    $default($next, $this);
                }
            });
        })
    </script>
</head>
<body>
<jsp:include page="../header/header.jsp">
    <jsp:param name="taskActive" value="active"/>
</jsp:include>


<div class="container mt-5">
    <form>
        <div class="form-row">
            <div class="col">
                <label for="name">姓名</label>
                <input type="text" class="form-control" id="name" value="<s:property value="#session.user.userName"/>"
                       disabled>
            </div>
            <div class="col">
                <label for="phone">手机号</label>
                <input type="text" class="form-control" id="phone" value="<s:property value="#session.user.userPhone"/>"
                       disabled>
            </div>
        </div>
        <div class="form-row">
            <div class="col">
                <label for="addRess">地址</label>
                <input type="text" class="form-control" id="addRess"
                       value="<s:property value="#session.user.userAddress"/>" disabled>
            </div>
            <div class="col">
                <label for="type">类型</label>
                <select class="form-control" id="type" name="task.taskType">
                    <option value="0">快递</option>
                    <option value="1">外卖</option>
                </select>
            </div>
        </div>
        <div class="form-row">
            <div class="col">
                <label for="company">公司/商家</label>
                <input type="text" class="form-control company" id="company" name="task.taskCompany"
                       value="${task.taskCompany}" required>
                <div class="invalid-feedback"></div>
            </div>
            <div class="col">
                <label for="quantity">数量</label>
                <select class="form-control" id="quantity" name="task.taskQuantity">
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
                <label for="size2">大小</label>
                <select class="form-control" id="size2" name="task.taskSize">
                    <option value="小">小</option>
                    <option value="大">大</option>
                    <option value="都有">都有</option>
                </select>
            </div>
            <div class="col">
                <label for="money">费用</label>
                <input type="text" class="form-control" id="money" name="task.taskMoney" value="${task.taskMoney}"
                       required>
                <div class="invalid-feedback"></div>
            </div>
        </div>
        <div class="form-row">
            <div class="col">
                <label for="message">备注</label>
                <textarea class="form-control" id="message" rows="3" name="task.taskMessage"
                          value="${task.taskMessage}"></textarea>
            </div>
        </div>
    </form>
    <div class="row mt-4">
        <div class="col-10"></div>
        <div class="col-2">
            <button class="btn btn-primary publish">修改</button>
            <a href="javascript:history.go(-1)">
                <button class="btn btn-primary">返回</button>
            </a>
        </div>
    </div>

</div>
</body>
</html>
