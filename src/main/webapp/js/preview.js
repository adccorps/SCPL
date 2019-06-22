(function () {
  var util = {
    css: function (elem, obj) {
      for (var i in obj) {
        elem.style[i] = obj[i];
      }
    }, addEvent: (function (window, undefined) {
      var _eventCompat = function (event) {
        var type = event.type;
        if (type == 'DOMMouseScroll' || type == 'mousewheel') {
          event.delta = (event.wheelDelta) ? event.wheelDelta / 120 : -(event.detail || 0) / 3;
        }
        if (event.srcElement && !event.target) {
          event.target = event.srcElement;
        }
        if (!event.preventDefault && event.returnValue !== undefined) {
          event.preventDefault = function () {event.returnValue = false;};
        }
        return event;
      };
      if (window.addEventListener) {
        return function (el, type, fn, capture) {
          if (type === "mousewheel" && document.mozFullScreen !== undefined) {
            type = "DOMMouseScroll";
          }
          el.addEventListener(type, function (event) {fn.call(this, _eventCompat(event));}, capture || false);
        };
      } else if (window.attachEvent) {
        return function (el, type, fn, capture) {
          el.attachEvent("on" + type, function (event) {
            event = event || window.event;
            fn.call(el, _eventCompat(event));
          });
        };
      }
      return function () {};
    })(window)
  };

  function Preview(opt) {
    var _this = this;
    if (!opt.imgWrap || opt.imgWrap == "") {
      alert("请填写图片容器id");
      return;
    }
    this.Opt = { imgWrap: '', beforeCreat: function () {}, afterCreat: function () {} };
    for (var i in this.Opt) {
      if (opt[i]) this.Opt[i] = opt[i];
    }
    this.elemPreviewContain = document.getElementsByTagName("body")[0];
    this.elemContain = document.querySelectorAll(this.Opt.imgWrap);
    this.elemPreviewImg = null;
    this.elemPreviewClose = null;
    this.elemPreviewCloseBj = null;
    this.imgBg = null;
    this.moveObj = null;
    this.init();
    this.LEFT = this.elemPreviewContain.offsetWidth / 2;
    this.TOP = this.elemPreviewContain.offsetHeight / 2;
    this.onOff = true;
    this.startX = 0;
    this.startY = 0;
    this.moveX = 0;
    this.moveY = 0;
    this._WIDTH = 0;
    this._HEIGHT = 0;
    this.WIDTH = 0;
    this.HEIGHT = 0;
  }

  Preview.VERSION = '1.0.0';
  var randomNum = new Date().getTime();
  Preview.initParams = { bgClass: "img_bgmask" };
  Preview.prototype = {
    constructor: Preview, init: function () {
      var _this = this;
      var element = document.querySelector('.img_bgmask');
      if (element) {
        this.imgBg = element;
      }
      if (!this.imgBg) {
        this.imgBg = document.createElement("div");
        this.imgBg.className = 'img_bgmask';
        util.css(this.imgBg, {
          position: "fixed",
          left: 0,
          top: 0,
          width: '100%',
          height: "100%",
          fontSize: 0,
          background: 'rgba(0,0,0,.6)',
          display: "none"
        });
        this.imgBg.innerHTML = '<div class="popurNode" style="position: absolute;left:0;top:0;width:100%;height:100%;z-index:1"></div><span style="position: absolute;top: 70px;right:70px;z-index: 10;height: 48px;width: 48px;background:red;cursor:pointer;border-radius:50%;" class="close_bgmask"></span><div style="position:absolute;left:50%;top:50%;" class="view_img_wrap"><img style="width:100%;height:100%;position: relative;z-index: -1;" src="" alt=""></div>';
        this.elemPreviewContain.appendChild(this.imgBg);
      }
      this.elemPreviewImg = this.imgBg.getElementsByTagName("img")[0];
      this.moveObj = this.elemPreviewImg.parentNode;
      this.elemPreviewClose = this.imgBg.getElementsByTagName("span")[0];
      this.elemPreviewCloseBj = this.imgBg.querySelector(".popurNode");
      NodeList.prototype.forEach = NodeList.prototype.forEach || Array.prototype.forEach;
      this.elemContain.forEach(function (item, index) {
        item.style.cursor = "pointer";
        item.addEventListener("click", preview, false);
      });

      function preview(e) {
        e = e || window.event;
        e.stopPropagation();
        var target = e.target;
        var tag = target.tagName.toLowerCase();
        if (tag !== 'img') return;
        _this.elemPreviewImg.src = target.src;
        util.css(_this.imgBg, { display: "block" });
        _this._WIDTH = _this.WIDTH = _this.elemPreviewImg.offsetWidth;
        _this._HEIGHT = _this.HEIGHT = _this.elemPreviewImg.offsetHeight;
        util.css(_this.moveObj, {
          width: _this.WIDTH + "px",
          marginLeft: -_this.WIDTH / 2 + "px",
          marginTop: -_this.HEIGHT / 2 + "px",
          left: '50%',
          top: '50%'
        })
      }

      this.moveObj.addEventListener("mousedown", mousedown, false);

      function mousedown(e) {
        e = e || window.event;
        e.stopPropagation();
        _this.onOff = true;
        _this.startX = e.pageX;
        _this.startY = e.pageY;
        document.addEventListener("mousemove", mousemove, false);

        function mousemove(ev) {
          _this.onOff = false;
          _this.moveX = ev.pageX - _this.startX + _this.LEFT;
          _this.moveY = ev.pageY - _this.startY + _this.TOP;
          util.css(_this.moveObj, { "left": _this.moveX + "px", "top": _this.moveY + "px" });
          ev.preventDefault();
        }

        document.addEventListener("mouseup", mouseup, false);

        function mouseup(ev) {
          document.removeEventListener("mousemove", mousemove, false);
          document.removeEventListener("mouseup", mouseup, false);
          if (_this.onOff) return false;
          _this.LEFT = _this.moveX;
          _this.TOP = _this.moveY;
        }

        e.preventDefault();
      }

      this.elemPreviewClose.onclick = function () {_this.previewClose();};
      this.elemPreviewCloseBj.onclick = function () {_this.previewClose();};
      util.addEvent(this.imgBg, "mousewheel", function (event) {
        this.WIDTH = _this.elemPreviewImg.offsetWidth;
        if (event.delta > 0) {
          util.css(_this.moveObj, { width: (this.WIDTH + 20) + "px" });
        } else {
          util.css(_this.moveObj, { width: (this.WIDTH - 20) + "px" });
        }
        this.HEIGHT = _this.elemPreviewImg.offsetHeight;
        util.css(_this.moveObj, { marginLeft: -this.WIDTH / 2 + "px", marginTop: -this.HEIGHT / 2 + "px" });
      });
    }, previewClose: function () {
      this.LEFT = this.elemPreviewContain.offsetWidth / 2;
      this.TOP = this.elemPreviewContain.offsetHeight / 2;
      util.css(this.moveObj, { width: this._WIDTH + "px" });
      util.css(this.imgBg, { display: "none" });
    }
  };
  window.Preview = Preview;
})();