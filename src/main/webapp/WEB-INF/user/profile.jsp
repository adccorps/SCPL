<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: SnoopyAquarius
  Date: 2019/5/3
  Time: 17:18
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
    <title><s:if test="#session.user!=null">${sessionScope.user.userName} | </s:if>校园生活</title>
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/bootstrap.min.css">
    <link href="${pageContext.servletContext.contextPath}/css/carousel.css" rel="stylesheet">
    <script src="${pageContext.servletContext.contextPath}/js/jquery.min.js"></script>
    <script src="${pageContext.servletContext.contextPath}/js/bootstrap.bundle.min.js"></script>
    <%--<script src="${pageContext.servletContext.contextPath}/js/utils/base64.js"></script>--%>
    <script src="${pageContext.servletContext.contextPath}/js/utils/core.js"></script>
    <script src="${pageContext.servletContext.contextPath}/js/utils/tips.js"></script>
</head>
<body class="h-100">
<jsp:include page="../header/header.jsp" />

<div class="container">
    <div class="col mt-5">
        <div class="row">
            <div class="col-3 text-center col-offset-2">
                <div class="list-group">
                    <a class="list-group-item list-group-item-action active" href="#">个人信息设置</a>
                    <a class="list-group-item list-group-item-action" href="#">...</a>
                </div>
            </div>
            <div class="col-9">
                <ul class="list-group">
                    <li class="list-group-item">
                        <div class="row no-gutters align-items-center">
                            <div class="col-md-3">
                                <div class="p-3 text-right border-right">
                                    <h5 class="mb-0">头像</h5>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="p-3 text-left">
                                    <h5 class="mb-0"><%--<img src="${sessionScope.user.userAvatar}" class="card-img" alt="...">--%>
                                        <img src="${user.userAvatar}"
                                             class="rounded-circle" alt="..." width="50" height="50"></h5>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="p-3 text-center">
                                    <h5 class="mb-0">
                                        <button type="button" class="btn btn-primary" data-toggle="modal"
                                                data-target="#avatar-modal">修改
                                        </button>
                                    </h5>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li class="list-group-item">
                        <div class="row no-gutters align-items-center">
                            <div class="col-md-3">
                                <div class="p-3 text-right border-right">
                                    <h5 class="mb-0">用户名</h5>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="p-3 text-left">
                                    <h5 class="mb-0">${sessionScope.user.userName}</h5>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="p-3 text-center">
                                    <h5 class="mb-0">
                                        <button type="button" class="btn btn-primary" data-toggle="modal"
                                                data-target="#username-modal">修改
                                        </button>
                                    </h5>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li class="list-group-item">
                        <div class="row no-gutters align-items-center">
                            <div class="col-md-3">
                                <div class="p-3 text-right border-right">
                                    <h5 class="mb-0">密码</h5>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="p-3 text-left">
                                    <h5 class="mb-0">●●●●●●</h5>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="p-3 text-center">
                                    <h5 class="mb-0">
                                        <button type="button" class="btn btn-primary" data-toggle="modal"
                                                data-target="#password-modal">修改
                                        </button>
                                    </h5>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li class="list-group-item">
                        <div class="row no-gutters align-items-center">
                            <div class="col-md-3">
                                <div class="p-3 text-right border-right">
                                    <h5 class="mb-0">地址</h5>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="p-3 text-left">
                                    <h5 class="mb-0">${sessionScope.user.userAddress}</h5>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="p-3 text-center">
                                    <h5 class="mb-0">
                                        <button type="button" class="btn btn-primary" data-toggle="modal"
                                                data-target="#address-modal">修改
                                        </button>
                                    </h5>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li class="list-group-item">
                        <div class="row no-gutters align-items-center">
                            <div class="col-md-3">
                                <div class="p-3 text-right border-right">
                                    <h5 class="mb-0">手机号</h5>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="p-3 text-left">
                                    <h5 class="mb-0"><s:set var="phone" value="#session.user.userPhone" /> <s:set
                                            var="phone"
                                            value="#phone.replace(#phone.substring(3, 7), '●●●●')" /> ${phone}</h5>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="p-3 text-center">
                                    <h5 class="mb-0">
                                        <button type="button" class="btn btn-primary" data-toggle="modal"
                                                data-target="#phone-modal">修改
                                        </button>
                                    </h5>
                                </div>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>
<div class="modal-group">
    <div class="modal fade" id="avatar-modal" tabindex="-1" role="dialog">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">修改头像</h5>
                    <button type="button" class="close cancel" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <form class="modal-body text-center">
                    <input class="d-none avatar-hook" name="files" type="file" accept="image/*">
                    <img src="${user.userAvatar}" class="toggle-avatar"
                         alt="" width="200" height="200"> <%-- 初始图片是用户原本的头像 --%>
                </form>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary cancel" data-dismiss="modal">取消</button>
                    <button type="button" class="btn btn-primary update">保存</button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="username-modal" tabindex="-1" role="dialog">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">修改用户名</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group row">
                        <span class="col-sm-4 text-right">当前用户名：</span><span
                            class="col-sm-8">${user.userName}</span>
                    </div>
                    <div class="form-group row">
                        <label for="username" class="col-sm-4 col-form-label text-right">新用户名：</label>
                        <div class="col-sm-8">
                            <input id="username" class="form-control username" type="text" required>
                            <div class="invalid-feedback"></div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
                    <button type="button" class="btn btn-primary update">保存</button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="password-modal" tabindex="-1" role="dialog">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">修改密码</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group row">
                        <label for="old-password" class="col-sm-4 col-form-label text-right">原密码：</label>
                        <div class="col-sm-8">
                            <input id="old-password" class="form-control" type="password" required>
                            <div class="invalid-feedback"></div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="new-password" class="col-sm-4 col-form-label text-right">新密码：</label>
                        <div class="col-sm-8">
                            <input id="new-password" class="form-control need-valida" type="password" required>
                            <div class="invalid-feedback"></div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="new-password2" class="col-sm-4 col-form-label text-right">确认密码：</label>
                        <div class="col-sm-8">
                            <input id="new-password2" class="form-control need-valida" type="password" required>
                            <div class="invalid-feedback"></div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
                    <button type="button" class="btn btn-primary update">确定</button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="address-modal" tabindex="-1" role="dialog">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">修改地址</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group row">
                        <span class="col-sm-4 text-right">当前地址：</span><span
                            class="col-sm-8">${sessionScope.user.userAddress}</span>
                    </div>
                    <div class="form-group row">
                        <label for="address" class="col-sm-4 col-form-label text-right">新地址：</label>
                        <div class="col-sm-8">
                            <input id="address" class="form-control" type="text" required>
                            <div class="invalid-feedback"></div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
                    <button type="button" class="btn btn-primary update">确定</button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="phone-modal" tabindex="-1" role="dialog">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">修改手机号</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group row">
                        <label for="password" class="col-sm-4 col-form-label text-right">密码：</label>
                        <div class="col-sm-8">
                            <input id="password" class="form-control" type="password" required>
                            <div class="invalid-feedback"></div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="old-phone" class="col-sm-4 col-form-label text-right">原手机号：</label>
                        <div class="col-sm-8">
                            <input id="old-phone" class="form-control phone" type="text" required>
                            <div class="invalid-feedback"></div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="phone" class="col-sm-4 col-form-label text-right">新手机号：</label>
                        <div class="col-sm-8">
                            <input id="phone" class="form-control phone" type="text" required>
                            <div class="invalid-feedback"></div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
                    <button type="button" class="btn btn-primary update">确定</button>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="../components/tipModal.jsp" />
</div>
<script>
  $(function () {
    var imgUrl = $('.toggle-avatar').attr('src');

    $('.cancel').on('click', function (e) {
      $('#avatar-modal').on('hidden.bs.modal', function (e) {
        $('.toggle-avatar').attr('src', imgUrl);
      });
    });

    $('.toggle-avatar').on('click', function () {
      $('.avatar-hook').click();
    });

    $('.avatar-hook').on('change', function () {
      var img = $('.avatar-hook')[0];
      var ele = $('.toggle-avatar');
      var pattern = /(\.*.jpg$)|(\.*.png$)|(\.*.jpeg$)|(\.*.gif$)|(\.*.bmp$)|(\.*.webp$)/;
      if (!pattern.test(img.value.toLowerCase())) {
        alert("请上传jpg/jpeg/png/gif/bmp/webp格式的照片！");
        img.focus();
      } else {
        if (img.files[0] > 20 * 1024 * 1024) {
          alert("照片超过20M，请重新选择");
        } else {
          var url = URL.createObjectURL(img.files[0]);
          ele.attr('src', url);
          /*ele.on('load', function () {
            URL.revokeObjectURL(url);
          });*/
        }
      }
      <%--new Base64('.avatar-hook', '.toggle-avatar'); // &lt;%&ndash; base64.js待修改 &ndash;%&gt;--%>
    });

    $('.update').on('click', function (e) { // <%-- TODO 待续 --%>
      var index = $('.update').index($(this));
      // 更新使用ajax????
      // 使用ajax更新用户信息后需要更新页面上用户的信息，使用WebSocket通知用户手动刷新页面????，或者用jQuery直接修改????，或者客户端重定向????
      switch (index) {
        case 0: // <%-- 头像  --%> <%-- TODO 等图片服务器 --%>
          // 1. 用户点击保存后，(是否要判断图片是否已经改变????)通过ajax上传到服务器
          var formData = new FormData();
          var files = $('.avatar-hook')[0].files[0];
          formData.append('files', files);
          $.ajax({
            url: 'http://10.2.16.131:8080/UploadImg/upload',
            data: formData,
            type: 'POST',
            cache: false,
            contentType: false,
            processData: false,
            success: function (result, status, xhr) {
              if (result.error === 0) {
                $.ajax({
                  url: '${pageContext.servletContext.contextPath}/user_update',
                  type: 'POST',
                  data: 'user.userAvatar=' + result.data[0],
                  success: $success.bind(this, index)
                });
              }
            }
          });
          break;
        case 1: // 用户名
          // 1. 用户点击保存后，通过ajax上传名字到服务器
          var $username = $('#username');
          var username = $username.val();
          if (username.trim() === '') {
            $false($username.next(), $username, '请输入新用户名');
            return;
          }
          $.ajax({
            url: '${pageContext.servletContext.contextPath}/user_update',
            type: 'POST',
            data: 'user.userName=' + username,
            success: $success.bind(this, index)
          });
          break;
        case 2: // 密码
          var flag = true;
          $('#password-modal input[required]').each(function (index, target) { // <%-- TODO 提示用户要输入 --%>
            var $this = $(target);
            if ($this.val().trim() === '') {
              $false($this.next(), $this, '请输入' + $('label[for=' + $this.attr('id') + ']').text().replace('：', ''));
              flag = false;
            }
          });
          if ($('.is-invalid').length > 0 || !flag) {
            return;
          }
        <%--
            1. 用户点击保存后，先判断原密码(服务端)是否正确
            2. 如果原密码不正确，提示用户输入的原密码不正确，否则，通过ajax上传密码到服务器
        --%>
          var oldPassword = $('#old-password').val();
          var newPassword = $('#new-password').val();
          $.ajax({
            url: '${pageContext.servletContext.contextPath}/user_updatePassword',
            type: 'POST',
            data: 'user.userPass=' + newPassword + '&oldPassword=' + oldPassword,
            success: $success.bind(this, index)
          });
          break;
        case 3: // 地址
          // 1. 用户点击保存后，通过ajax上传地址到服务器
          var $address = $('#address');
          var address = $address.val();
          if (address.trim() === '') {
            $false($address.next(), $address, '请输入新地址');
            return;
          }
          $.ajax({
            url: '${pageContext.servletContext.contextPath}/user_update',
            type: 'POST',
            data: 'user.userAddress=' + address,
            success: $success.bind(this, index)
          });
          break;
        case 4: // 手机号
          // 1. 用户点击保存后，先判断原密码是否正确
          // 2. 如果原密码不正确，提示用户输入的原密码不正确，否则，判断原手机号是否正确
          // 3. 如果原手机号不正确，提示用户输入的原手机号不正确，否则，通过ajax上传手机号到服务器
          var flag = true;
          $('#phone-modal input[required]').each(function (index, target) {
            var $this = $(target);
            if ($this.val().trim() === '') {
              $false($this.next(), $this, '请输入' + $('label[for=' + $this.attr('id') + ']').text().replace('：', ''));
              flag = false;
            }
          });
          if (!flag) {
            return;
          }
          var password = $('#password').val();
          var oldPhone = $('#old-phone').val();
          var phone = $('#phone').val();
          $.ajax({
            url: '${pageContext.servletContext.contextPath}/user_updatePhone',
            type: 'POST',
            data: 'user.userPass=' + password + '&user.userPhone=' + phone + '&oldPhone=' + oldPhone,
            success: $success.bind(null, index)
          });
          break;
        default:
          break;
      }
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

    $('input.phone').on('input', function (e) {
      var $this = $(this);
      var $next = $this.next();
      var phoneReg = /^0?(13[0-9]|14[5-9]|15[012356789]|166|17[0-8]|18[0-9]|19[8-9])[0-9]{8}$/;
      var flag = phoneReg.test($this.val());
      if (!flag) {
        $false($next, $this, '手机号格式不正确');
        return;
      }
      var $phone = $('#phone');
      if (this === $phone.get(0)) {
        var $phoneFeedback = $phone.next();
        $.ajax({
          url: '${pageContext.servletContext.contextPath}/user_checkUserPhone',
          type: 'POST',
          data: 'user.userPhone=' + $phone.val(),
          success: function (result, status, xhr) {
            if (result.code !== 1) {
              // 失败
              $false($phoneFeedback, $phone, result.tip);
            } else {
              // 成功
              $true($phoneFeedback, $phone);
            }
          }
        });
      }
    });

    $('input[type="password"]').on('input', function (e) {
      var $this = $(this);
      var $next = $this.next();
      if (checkLength(6, 20, $this.val())) {
        $default($next, $this);
      } else {
        $false($next, $this, '密码长度必须在6-20个字符之间');
      }
    });

    $('input.username').on('input', function (e) {
      var $this = $(this);
      var $next = $this.next();
      if (checkLength(2, 15, $this.val())) {
        $default($next, $this);
      } else {
        $false($next, $this, '用户名长度必须在2-15个字符之间')
      }
    });

    function $success(index, result, status, xhr) {
      console.log(this);
      var $modal = $('.modal').eq(index);
      $modal.modal('hide');
      var $tipModal = $('#tip-modal');
      var $tip = $('#tip-modal .modal-body p');
      if (result.code === 1) { // 成功
        // 成功
        showTip({
          body: $tip,
          modal: $tipModal,
          lazy: true,
          hidden: function (e) {
            window.location.replace("profile");
          },
          before: function () {
            $modal.one('hidden.bs.modal', function (e) {
              $tip.html('修改成功');
              $tipModal.modal();
            });
          }
        });
      } else { // 失败
        showTip({
          body: $tip,
          modal: $tipModal,
          before: function () {
            $modal.one('hidden.bs.modal', function (e) {
              $tip.html(result.tip);
              $tipModal.modal();
            });
          }
        })
      }
    }

    var $password = $('.need-valida');
    $password.on('input', function (e) {
      var pass = $password.eq(0);
      var cp = $password.eq(1);

      if (pass.val() !== cp.val()) {
        $false(cp.next(), cp, '两次密码输入不一致');
      } else {
        $true(cp.next(), cp);
      }
    });

    $('.modal:not(#tip-modal):not(#avatar-modal)').on('hidden.bs.modal', function (e) {
      $(this).find('input').each(function (index, target) {
        $(target).val('');
        $default($(target).next(), $(target));
      });
    });
  });
</script>
</body>
</html>
