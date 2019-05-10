<%--
  Created by IntelliJ IDEA.
  User: SnoopyAquarius
  Date: 2019/4/30
  Time: 23:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en" class="h-100">
<head>
    <title>注册</title>
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/bootstrap.min.css">
    <%--<link href="css/carousel.css" rel="stylesheet" />--%>
    <script src="${pageContext.servletContext.contextPath}/js/jquery.min.js"></script>
    <script src="${pageContext.servletContext.contextPath}/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.servletContext.contextPath}/js/utils/core.js"></script>
</head>
<body class="bg-light d-flex align-items-center h-100">
<jsp:include page="header/header.jsp" />

<div class="m-auto w-50">
    <div class="col">
        <h4 class="mb-3 text-center">注册</h4>
        <div class="col-md-12 order-md-1 card">

            <form class="needs-validation mt-3" method="post">
                <div class="mb-3">
                    <label for="userName">用户名</label>
                    <div class="input-group">
                        <input type="text" class="form-control" id="userName" name="user.userName"
                               placeholder="用户名" min="2" max="15" required>
                        <div class="invalid-feedback"></div>
                    </div>
                </div>

                <div class="mb-3">
                    <label for="userPass">密码</label>
                    <input type="password" class="form-control" id="userPass" name="user.userPass"
                           placeholder="密码" min="6" max="20" required>
                    <div class="invalid-feedback"></div>
                </div>

                <div class="mb-3">
                    <label for="password">确认密码</label>
                    <input type="password" class="form-control" id="password" placeholder="确认密码" min="6"
                           max="20" required>
                    <div class="invalid-feedback"></div>
                </div>

                <div class="mb-3">
                    <label for="phone">手机号</label>
                    <input type="number" class="form-control" name="user.userPhone" id="phone" maxlength="11"
                           placeholder="手机号" required>
                    <div class="invalid-feedback"></div>
                </div>

                <button class="btn btn-primary btn-lg btn-block mb-3" type="submit">注册</button>
                <p class="border rounded-lg bg-white text-lg-center p-2 text-center font-weight-bold mb-0">已经有帐号？<a
                        href="${pageContext.servletContext.contextPath}/login">去登录 &gt; </a></p>
            </form>
        </div>
    </div>
</div>
<div class="modal fade" id="tip-modal" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">提示</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <p></p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal">确定</button>
            </div>
        </div>
    </div>
</div>
<script>
  $(function () {
    $('form').submit(function (event) {
      event.preventDefault(); // 阻止默认的提交行为
      if ($('.is-invalid').length > 0) {
        return;
      }
      var flag = true;
      $('input[required]').each(function (index, target) {
        if ($(target).val() === '') {
          return flag = false;
        } else {
          flag = true;
        }
      });
      if (!flag) {
        $('input[required]').next().each(function (index, target) {
          var $next = target.next();
          if ($(target).val() === '') {
            $false($next, target, '必填项');
          } else {
            $true($next, target);
          }
        });
        return;
      }
      var $tip = $('#tip-modal');
      var $modalBody = $('.modal-body p');
      $.ajax({
        url: 'user_register',
        type: 'POST',
        data: $(this).serialize(),
        success: function (result, status, xhr) {
          if (result.code !== 1) {
            $modalBody.html(result.tip);
            $tip.modal();
          } else {
            $modalBody.html('注册成功');
            $tip.on('shown.bs.modal', function (e) {
              setTimeout(function () {
                $tip.modal('hide');
              }, 3000);
            });
            $tip.modal();
            $tip.on('hidden.bs.modal', function (e) {
              window.location.replace("login");
            });
          }
        }
      });
    });

    var $input = $('input');
    $input.on('input', function (e) { // <%-- TODO 待抽象 --%>

      var pass = $input.eq(1);
      var cp = $input.eq(2);

      var $this = $(this);
      var $next = $this.next(); //  <%--  invalid-feedback  --%>
      var index = $input.index($this);
      var phoneReg = /^0?(13[0-9]|14[5-9]|15[012356789]|166|17[0-8]|18[0-9]|19[8-9])[0-9]{8}$/;
      switch (index) {
        case 0: // 用户名 2-15
          if (checkLength(2, 15, $this.val())) {
            $true($next, $this);
          } else {
            $false($next, $this, '用户名长度必须在2-15个字符之间');
          }
          break;
        case 1: // 密码   6-20
        case 2:
          if (checkLength(6, 20, pass.val())) {
            $true(pass.next(), pass);
          } else {
            $false(pass.next(), pass, '密码长度必须在6-20个字符之间');
            return;
          }
          var userPass = pass.val(); // 密码
          var password = cp.val(); // 确认密码
          if (userPass !== password) {
            $false(cp.next(), cp, '两次密码输入不一致');
          } else {
            $true(cp.next(), cp);
          }
          break;
        case 3: // 手机号ajax验证
          if (!phoneReg.test($(this).val())) { // 客户端验证
            $false($next, $this, "手机号格式不正确");
            return;
          }
          $.ajax({
            url: 'user_checkUserPhone',
            type: 'POST',
            data: $this.serialize(),
            success: function (result, status, xhr) {
              if (result.code !== 1) {
                // 失败
                $false($next, $this, result.tip);
              } else {
                // 成功
                $true($next, $this);
              }
            }
          });
          break;
        default: // 客户端验证
          break;
      }
    });
  });
</script>
</body>
</html>
