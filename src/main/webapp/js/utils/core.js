function checkLength(min, max, str) {
  var regExpStr = '^.{' + min + ',' + max + '}$';
  var regExp = new RegExp(regExpStr);
  return regExp.test(str);
}

function $default($next, $this) {
  $this.removeClass('is-valid');
  $this.removeClass('is-invalid');
  $next.removeClass('valid-feedback');
  $next.removeClass('invalid-feedback');
  $next.html('');
  $next.hide();
}

function $true($next, $this) {
  $this.addClass('is-valid');
  $this.removeClass('is-invalid');
  $next.addClass('valid-feedback');
  $next.removeClass('invalid-feedback');
  $next.html('');
  $next.hide();
}

function $false($next, $this, tip) {
  $next.show();
  $this.removeClass('is-valid');
  $this.addClass('is-invalid');
  $next.removeClass('valid-feedback');
  $next.addClass('invalid-feedback');
  $next.html(tip);
}