(function (w, d, $) { // TODO 修改这个Base64为通用
  w.Base64 = function (imgFile, ele) {
    var img = $(imgFile)[0];
    // 定义方法
    var pattern = /(\.*.jpg$)|(\.*.png$)|(\.*.jpeg$)|(\.*.gif$)|(\.*.bmp$)|(\.*.webp$)/;
    if (!pattern.test(img.value.toLowerCase())) {
      alert("请上传jpg/jpeg/png/gif/bmp/webp格式的照片！");
      img.focus();
    } else {
      //添加显示图片的HTML元素
      //判断浏览器类型
      if (document.all) {
        //兼容IE
        this.ieBase64(img.value, ele);
      } else {
        //兼容主流浏览器
        if (img.files[0] > 20 * 1024 * 1024) {
          alert("照片超过20M，请重新选择");
        } else {
          // this.mainBase64(img.files[0], ele);
          var url = URL.createObjectURL(img.files[0]);
          $(ele).attr('src', url);
          $(ele).on('load', function (e) {
            URL.revokeObjectURL(url);
          });
        }
      }
    }
  };
  Base64.prototype = {
    ieBase64: function (file, ele) {
      var realPath, xmlHttp, xml_dom, tmpNode, imgBase64Data;
      realPath = file; // 获取文件的真实本地路径.
      xmlHttp = new ActiveXObject("MSXML2.XMLHTTP");
      xmlHttp.open("POST", realPath, false);
      xmlHttp.send("");
      xml_dom = new ActiveXObject("MSXML2.DOMDocument");
      tmpNode = xml_dom.createElement("tmpNode");
      tmpNode.dataType = "bin.base64";
      tmpNode.nodeTypedValue = xmlHttp.responseBody;
      imgBase64Data = "data:image/bmp;base64," + tmpNode.text.replace(/\n/g, "");
      $(ele).attr('src', imgBase64Data);
    },
    mainBase64: function (file, ele) {
      var fileReader, imgData, flag;
      fileReader = new FileReader();
      fileReader.readAsDataURL(file);
      fileReader.onload = function () {
        imgData = this.result; //base64数据
        $(ele).attr('src', imgData);
      };
    }
  }
})(window, document, window.jQuery);

//删除图片 ***此方法需要是全局函数，不可声明在匿名函数中
function deleteImg(img) {
  $(img).parent().remove();
}
