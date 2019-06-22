<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: SnoopyAquarius
  Date: 2019/4/30
  Time: 23:52
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
    <title>登录</title>
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/bootstrap.min.css">
    <script src="${pageContext.servletContext.contextPath}/js/jquery.min.js"></script>
    <script src="${pageContext.servletContext.contextPath}/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.servletContext.contextPath}/js/utils/tips.js"></script>
</head>
<body class="bg-light d-flex align-items-center h-100">
<jsp:include page="header/header.jsp" />

<div class="m-auto w-50">
    <div class="col">
        <h4 class="mb-3 text-center">登录</h4>
        <div class="col-md-12 order-md-1 card">

            <form class="mt-3" method="post">
                <div class="mb-3">
                    <label for="userPhone">手机号</label>
                    <div class="input-group">
                        <input type="number" class="form-control" id="userPhone" name="user.userPhone" placeholder="手机号"
                               required><%-- valid验证成功  invalid验证失败 --%>
                        <div class="invalid-feedback"></div>
                        <%-- valid-feedback验证成功  invalid-feedback验证失败 --%>
                    </div>
                </div>

                <div class="mb-3">
                    <label for="userPass">密码</label>
                    <input type="password" class="form-control" id="userPass" name="user.userPass" placeholder="密码"
                           required>
                    <div class="invalid-feedback"></div>
                </div>

                <button class="btn btn-primary btn-lg btn-block mb-3" type="submit">登录</button>
                <p class="border rounded-lg bg-white text-lg-center p-2 text-center font-weight-bold">还没有帐号？<a
                        href="${pageContext.servletContext.contextPath}/register">去注册 &gt; </a></p>
            </form>
        </div>
    </div>
</div>
<jsp:include page="components/tipModal.jsp" />
<script>
  $(function () {
    var $modalBody = $('.modal-body p');
    var $tip = $('#tip-modal');
    <s:if test="#parameters.error[0]=='-1'">
    showTip({
      body: $modalBody,
      modal: $tip,
      tip: '请先登录！',
      hidden: function (e) {
        $modalBody.html('');
      }
    });
    </s:if>
    $('form').on('submit', function (event) {
      event.preventDefault(); // <%-- 阻止默认的提交行为 --%>
      $.ajax({
        url: 'user_login',
        type: 'POST',
        data: $(this).serialize(),
        success: function (result, status, xhr) {
          if (result.code !== 1) {
            showTip({
              body: $modalBody,
              modal: $tip,
              tip: result.tip,
              hidden: function (e) {
                $modalBody.html('');
                $('form')[0].reset();
              }
            });
          } else {
            showTip({
              body: $modalBody,
              modal: $tip,
              tip: '登录成功',
              lazy: true,
              hidden: function (e) {
                window.location.replace("index");
              }
            });
          }
        }
      });
    });
  });
</script>
</body>
</html>
