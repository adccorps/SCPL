function checkLength(min, max, str) {
  var regExpStr = '^.{' + min + ',' + max + '}$';
  var regExp = new RegExp(regExpStr);
  return regExp.test(str);
}

function $default($next, $this) {
  $this.removeClass('is-valid').removeClass('is-invalid');
  $next.removeClass('valid-feedback').removeClass('invalid-feedback');
  $next.html('').hide();
}

function $true($next, $this) {
  $this.addClass('is-valid').removeClass('is-invalid');
  $next.addClass('valid-feedback').removeClass('invalid-feedback');
  $next.html('').hide();
}

function $false($next, $this, tip) {
  $this.removeClass('is-valid').addClass('is-invalid');
  $next.removeClass('valid-feedback').addClass('invalid-feedback');
  $next.html(tip).show();
}