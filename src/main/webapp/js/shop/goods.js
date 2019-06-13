/**
 * Created by Wang on 2019/5/27.
 */
$(function () {
  /**
   * 表单输入验证
   * */
  $("#goodsName").blur(function () {
    // $(this).addClass("is-invalid");
    if (this.value.length > 0 && this.value.length < 25) {
      $(this).addClass("is-valid");
      $(this).removeClass("is-invalid");
    } else {
      $(this).addClass("is-invalid");
    }
  })
  $("#goodsPrice").blur(function () {

    // $(this).addClass("is-invalid");
    if (this.value > 0 && this.value < 99999) {
      $(this).addClass("is-valid");
      $(this).removeClass("is-invalid");
    } else {
      $(this).addClass("is-invalid");
      $(this).removeClass("is-valid");
    }
  })

  /**
   *  图片上传
   * */
  $("#sumbitPic").click(function () {
    $("#goodsPic").click();
  });

  /**
   * 关于图片上传的全局变量
   * */
  var files = [];
  if ($("#getPicURL").val() != undefined) {
    var curPicArr = splitPicURL($("#getPicURL").val());
    curPicArr.splice(curPicArr.length - 1, 1);//删除最后,分割的空元素
  }
  var formData = new FormData();

  /**
   * 选择图片,图片预览
   * */
  $("#goodsPic").on("change", function (e) {
    e.preventDefault();
    //var fileList =getObjectURL(this.FileList[0])
    var i = this.files.length;
    for (var n = 0; n < this.files.length; n++) {
      var picUrl = getObjectURL(this.files[n]);
      files.push(this.files[n]);
      console.log(files);
      if (picUrl) {
        // $("#showPic").attr("src", picUrl); //将图片路径存入src中，显示出图片
        $("#picShow").append(
          "<div class='card float-left '  style='width: 14rem;'>" +
          " <span class='close position-absolute '  aria-hidden='true' style='height: 20px;width: 20px;right:0 ;top: 0; cursor: pointer;' >&times;</span> " +
          " <img src=" + picUrl + " class='showPic' class='col-4 float-left' style='width: 14rem; height: 200px' >")
        + "</div>"
      }
    }

  })

  /**
   * 移除图片,移除图片预览
   * */
  $(document).on("click", ".close", function () {
    console.log($(".close").index(this));

    var picIndex = $(".close").index(this);//图片下标

    if ($("#getPicURL").val() != undefined) {
      console.log(curPicArr.length);//是否是修改,已有图片下标
      files = files.filter(function (s) {
        return s != files[picIndex - curPicArr.length];
      })
      if (curPicArr.length != 0) {
        curPicArr = curPicArr.filter(function (s) {
          return s != curPicArr[picIndex];
        })
      }
    } else {
      files = files.filter(function (s) {
        return s != files[picIndex];
      })
    }
    // console.log(curPicArr);
    $(this).parent().remove();
    console.log(files);
  })

  /**
   * 上传商品信息
   * */
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
        console.log(datas);
        if (datas.error === 0) {
          // $.ajax()  无错误才上传到后台 append表单数据进formdata
          var formData = new FormData();
          formData.append("goods.goodsName", $("#goodsName").val());
          formData.append("goods.goodsType", $("#goodsType").val());
          formData.append("goods.goodsDesc", $("#goodsDesc").val());
          formData.append("goods.goodsPrice", $("#goodsPrice").val());
          formData.append("files", datas.data);
          // console.log($("#goodsName").val());
          $.ajax({
            url: "addGoods.action",
            type: 'POST',
            data: formData,
            cache: false,
            contentType: false,
            processData: false,
            success: function (da) {
              console.log(da);
              if (da.shopError === 0) {
                var $modalBody = $('.modal-body p');
                var $tip = $('#tip-modal');
                $modalBody.html(da.tip);
                $tip.modal();
                $tip.on('hidden.bs.modal', function (e) {
                  $modalBody.html('');
                });
                $('.modal-footer>button').click(function () {
                  window.location.replace("viewIndex");
                })
              }

            }

          })
        }
      }
    })
  })

  /**
   * 修改商品信息
   * */
  $("#saveIcon").click(function (e) {
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
        //  console.log(formData);
        console.log(datas);
        if (datas.error === 0) {
          // $.ajax()  无错误才上传到后台 append表单数据进formdata
          var formData2 = new FormData();
          formData2.append("goods.goodsName", $("#goodsName").val());
          formData2.append("goods.goodsType", $("#goodsType").val());
          formData2.append("goods.goodsDesc", $("#goodsDesc").val());
          formData2.append("goods.goodsPrice", $("#goodsPrice").val());
          formData2.append("goods.goodsId", $("#goodsId").val());
          // formData2.append("files", datas.data);
          for (var n = 0; n < datas.data.length; n++) {
            curPicArr.push(datas.data[n]);
          }
          console.log(curPicArr);
          formData2.append("files", curPicArr);
          $.ajax({
            url: "updateGoods",
            type: 'POST',
            data: formData2,
            cache: false,
            contentType: false,
            processData: false,
            success: function (da) {
              console.log(da);
              if (da.shopError === 0) {
                var $modalBody = $('.modal-body p');
                var $tip = $('#tip-modal');
                $modalBody.html(da.tip);
                $tip.modal();
                $tip.on('hidden.bs.modal', function (e) {
                  $modalBody.html('');
                });
                $('.modal-footer>button').click(function () {
                  window.location.replace("checkOrder");
                })


              }
            }

          })
        }
        if (datas.error === -1) {
          var formData2 = new FormData();
          formData2.append("goods.goodsName", $("#goodsName").val());
          formData2.append("goods.goodsType", $("#goodsType").val());
          formData2.append("goods.goodsDesc", $("#goodsDesc").val());
          formData2.append("goods.goodsPrice", $("#goodsPrice").val());
          formData2.append("goods.goodsId", $("#goodsId").val());

          $.ajax({
            url: "updateGoods",
            type: 'POST',
            data: formData2,
            cache: false,
            contentType: false,
            processData: false,
            success: function (da) {
              console.log(da);
              if (da.shopError === 0) {
                var $modalBody = $('.modal-body p');
                var $tip = $('#tip-modal');
                $modalBody.html(da.tip);
                $tip.modal();
                $tip.on('hidden.bs.modal', function (e) {
                  $modalBody.html('');
                });
                $('.modal-footer>button').click(function () {
                  window.location.replace("checkOrder");
                })


              }
            }

          })
        }
      }
    });
  })

  /**
   * 获取图片url
   * */
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

  /**
   * 图片路径分割
   * */
  function splitPicURL(pic) {
    var picArr;
    picArr = pic.split(",");
    return picArr;
  }
})


