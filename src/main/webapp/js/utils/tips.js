/**
 * option.body modal的body部分，将会修改body中的html
 * option.modal modal
 * option.before before函数，操控tip的流程，如果只有option.before，则option.body和option.modal是不必要的
 * option.tip 提示信息
 * option.lazy 延迟隐藏，默认为false，为true时延迟3秒隐藏
 * option.hidden hidden函数，操控隐藏后的流程
 * @param option
 */
function showTip(option) {
  option.lazy = option.lazy || false;
  var $body = option.body; // $('.modal-body p')
  var $modal = option.modal; // $('#tip-modal')
  if (option.before) {
    option.before();
  } else {
    $body.html(option.tip);
    $modal.modal();
  }
  if (option.lazy) {
    $modal.one('shown.bs.modal', function (e) {
      setTimeout(function () {
        $modal.modal('hide');
      }, 3000);
    });
  }
  option.hidden && $modal.one('hidden.bs.modal', option.hidden);
}