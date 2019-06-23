<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="zh-CN">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta name="referrer" content="no-referrer">
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <meta http-equiv="content-language" content="zh-CN" />
    <title><s:if test="#session.user!=null">${sessionScope.user.userName} | </s:if>主页</title>
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/bootstrap.min.css">
    <link href="${pageContext.servletContext.contextPath}/css/carousel.css" rel="stylesheet" />
    <script src="${pageContext.servletContext.contextPath}/js/jquery.min.js"></script>
    <script src="${pageContext.servletContext.contextPath}/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<jsp:include page="header/header.jsp">
    <jsp:param name="indexActive" value="active" />
</jsp:include>

<main role="main">
    <div id="myCarousel" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#myCarousel" data-slide-to="1"></li>
            <%--<li data-target="#myCarousel" data-slide-to="2"></li>--%>
            <%--<li data-target="#myCarousel" data-slide-to="3"></li>--%>
            <%--<li data-target="#myCarousel" data-slide-to="4"></li>--%>
        </ol>
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="http://10.2.16.131/images/ce9ca152ea3c81359d097f3666b4fb93.jpg" alt="" /> <%-- 使用img --%>
                <%--<div class="container">
                    <div class="carousel-caption text-left">
                        <h1>Example headline.</h1>
                        <p>
                            Cras justo odio, dapibus ac facilisis in, egestas eget quam.
                            Donec id elit non mi porta gravida at eget metus. Nullam id
                            dolor id nibh ultricies vehicula ut id elit.
                        </p>
                        <p>
                            <a class="btn btn-lg btn-primary" href="javascript:void(0)" role="button">Sign up today</a>
                        </p>
                    </div>
                </div>--%>
            </div>
            <%--<div class="carousel-item">
                <img src="http://10.2.16.131/images/ce9ca152ea3c81359d097f3666b4fb93.jpg" alt="" /> &lt;%&ndash; 使用img &ndash;%&gt;
                &lt;%&ndash;<div class="container">
                    <div class="carousel-caption">
                        <h1>Another example headline.</h1>
                        <p>
                            Cras justo odio, dapibus ac facilisis in, egestas eget quam.
                            Donec id elit non mi porta gravida at eget metus. Nullam id
                            dolor id nibh ultricies vehicula ut id elit.
                        </p>
                        <p>
                            <a class="btn btn-lg btn-primary" href="javascript:void(0)" role="button">Learn more</a>
                        </p>
                    </div>
                </div>&ndash;%&gt;
            </div>--%>
            <div class="carousel-item">
                <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTZ36Vu-0zRhsDnYPJQH8hYdA_GB17eNdVdhpTELeFCqqD8T9I5" alt="" /> <%-- 使用img --%>
                <%--<div class="container">
                    <div class="carousel-caption text-right">
                        <h1>One more for good measure.</h1>
                        <p>
                            Cras justo odio, dapibus ac facilisis in, egestas eget quam.
                            Donec id elit non mi porta gravida at eget metus. Nullam id
                            dolor id nibh ultricies vehicula ut id elit.
                        </p>
                        <p>
                            <a class="btn btn-lg btn-primary" href="javascript:void(0)" role="button">Browse gallery</a>
                        </p>
                    </div>
                </div>--%>
            </div>
            <%--<div class="carousel-item">
                <img src="http://10.2.16.131/images/ce9ca152ea3c81359d097f3666b4fb93.jpg" alt="" /> &lt;%&ndash; 使用img &ndash;%&gt;
                &lt;%&ndash;<div class="container">
                    <div class="carousel-caption text-right">
                        <h1>One more for good measure.</h1>
                        <p>
                            Cras justo odio, dapibus ac facilisis in, egestas eget quam.
                            Donec id elit non mi porta gravida at eget metus. Nullam id
                            dolor id nibh ultricies vehicula ut id elit.
                        </p>
                        <p>
                            <a class="btn btn-lg btn-primary" href="javascript:void(0)" role="button">Browse gallery</a>
                        </p>
                    </div>
                </div>&ndash;%&gt;
            </div>--%>
            <%--<div class="carousel-item">
                <img src="http://10.2.16.131/images/ce9ca152ea3c81359d097f3666b4fb93.jpg" alt="" /> &lt;%&ndash; 使用img &ndash;%&gt;
                &lt;%&ndash;<div class="container">
                    <div class="carousel-caption text-right">
                        <h1>One more for good measure.</h1>
                        <p>
                            Cras justo odio, dapibus ac facilisis in, egestas eget quam.
                            Donec id elit non mi porta gravida at eget metus. Nullam id
                            dolor id nibh ultricies vehicula ut id elit.
                        </p>
                        <p>
                            <a class="btn btn-lg btn-primary" href="javascript:void(0)" role="button">Browse gallery</a>
                        </p>
                    </div>
                </div>&ndash;%&gt;
            </div>--%>
        </div>
        <a class="carousel-control-prev" href="#myCarousel" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">上一个</span>
        </a>
        <a class="carousel-control-next" href="#myCarousel" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">下一个</span>
        </a>
    </div>

    <div class="container marketing">
        <!-- Three columns of text below the carousel -->
        <div class="row">
            <div class="col-lg-4">
                <svg class="bd-placeholder-img rounded-circle" width="140" height="140"
                     xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false"
                     role="img" aria-label="Placeholder: 140x140">
                    <title>Placeholder</title>
                    <rect width="100%" height="100%" fill="#777"></rect>
                    <text x="50%" y="50%" fill="#777" dy=".3em">140x140</text>
                </svg>
                <%-- 使用img --%>
                <%--<img width="140" src="" height="140" />--%> <%-- test --%>
                <h2>Heading</h2>
                <p>
                    Donec sed odio dui. Etiam porta sem malesuada magna mollis euismod.
                    Nullam id dolor id nibh ultricies vehicula ut id elit. Morbi leo
                    risus, porta ac consectetur ac, vestibulum at eros. Praesent commodo
                    cursus magna.
                </p>
                <p>
                    <a class="btn btn-secondary" href="javascript:void(0)" role="button">View details »</a>
                </p>
            </div>
            <!-- /.col-lg-4 -->
            <div class="col-lg-4">
                <svg class="bd-placeholder-img rounded-circle" width="140" height="140"
                     xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false"
                     role="img" aria-label="Placeholder: 140x140">
                    <title>Placeholder</title>
                    <rect width="100%" height="100%" fill="#777"></rect>
                    <text x="50%" y="50%" fill="#777" dy=".3em">140x140</text>
                </svg>
                <%-- 使用img --%>
                <h2>Heading</h2>
                <p>
                    Duis mollis, est non commodo luctus, nisi erat porttitor ligula,
                    eget lacinia odio sem nec elit. Cras mattis consectetur purus sit
                    amet fermentum. Fusce dapibus, tellus ac cursus commodo, tortor
                    mauris condimentum nibh.
                </p>
                <p>
                    <a class="btn btn-secondary" href="javascript:void(0)" role="button">View details »</a>
                </p>
            </div>
            <!-- /.col-lg-4 -->
            <div class="col-lg-4">
                <svg class="bd-placeholder-img rounded-circle" width="140" height="140"
                     xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false"
                     role="img" aria-label="Placeholder: 140x140">
                    <title>Placeholder</title>
                    <rect width="100%" height="100%" fill="#777"></rect>
                    <text x="50%" y="50%" fill="#777" dy=".3em">140x140</text>
                </svg>
                <%-- 使用img --%>
                <h2>Heading</h2>
                <p>
                    Donec sed odio dui. Cras justo odio, dapibus ac facilisis in,
                    egestas eget quam. Vestibulum id ligula porta felis euismod semper.
                    Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum
                    nibh, ut fermentum massa justo sit amet risus.
                </p>
                <p>
                    <a class="btn btn-secondary" href="javascript:void(0)" role="button">View details »</a>
                </p>
            </div>
            <div class="col-lg-6">
                <svg class="bd-placeholder-img rounded-circle" width="140" height="140"
                     xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false"
                     role="img" aria-label="Placeholder: 140x140">
                    <title>Placeholder</title>
                    <rect width="100%" height="100%" fill="#777"></rect>
                    <text x="50%" y="50%" fill="#777" dy=".3em">140x140</text>
                </svg>
                <%-- 使用img --%>
                <h2>Heading</h2>
                <p>
                    Donec sed odio dui. Cras justo odio, dapibus ac facilisis in,
                    egestas eget quam. Vestibulum id ligula porta felis euismod semper.
                    Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum
                    nibh, ut fermentum massa justo sit amet risus.
                </p>
                <p>
                    <a class="btn btn-secondary" href="javascript:void(0)" role="button">View details »</a>
                </p>
            </div>
            <div class="col-lg-6">
                <svg class="bd-placeholder-img rounded-circle" width="140" height="140"
                     xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false"
                     role="img" aria-label="Placeholder: 140x140">
                    <title>Placeholder</title>
                    <rect width="100%" height="100%" fill="#777"></rect>
                    <text x="50%" y="50%" fill="#777" dy=".3em">140x140</text>
                </svg>
                <%-- 使用img --%>
                <h2>Heading</h2>
                <p>
                    Donec sed odio dui. Cras justo odio, dapibus ac facilisis in,
                    egestas eget quam. Vestibulum id ligula porta felis euismod semper.
                    Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum
                    nibh, ut fermentum massa justo sit amet risus.
                </p>
                <p>
                    <a class="btn btn-secondary" href="javascript:void(0)" role="button">View details »</a>
                </p>
            </div>
            <!-- /.col-lg-4 -->
        </div>
        <!-- /.row -->

        <!-- START THE FEATURETTES -->

        <hr class="featurette-divider" />

        <div class="row featurette">
            <div class="col-md-7">
                <h2 class="featurette-heading">
                    First featurette heading.
                    <span class="text-muted">It’ll blow your mind.</span>
                </h2>
                <p class="lead">
                    Donec ullamcorper nulla non metus auctor fringilla. Vestibulum id
                    ligula porta felis euismod semper. Praesent commodo cursus magna,
                    vel scelerisque nisl consectetur. Fusce dapibus, tellus ac cursus
                    commodo.
                </p>
            </div>
            <div class="col-md-5">
                <svg class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" width="500"
                     height="500" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice"
                     focusable="false" role="img" aria-label="Placeholder: 500x500">
                    <title>Placeholder</title>
                    <rect width="100%" height="100%" fill="#eee"></rect>
                    <text x="50%" y="50%" fill="#aaa" dy=".3em">500x500</text>
                </svg>
            </div>
        </div>

        <hr class="featurette-divider" />

        <div class="row featurette">
            <div class="col-md-7 order-md-2">
                <h2 class="featurette-heading">
                    Oh yeah, it’s that good.
                    <span class="text-muted">See for yourself.</span>
                </h2>
                <p class="lead">
                    Donec ullamcorper nulla non metus auctor fringilla. Vestibulum id
                    ligula porta felis euismod semper. Praesent commodo cursus magna,
                    vel scelerisque nisl consectetur. Fusce dapibus, tellus ac cursus
                    commodo.
                </p>
            </div>
            <div class="col-md-5 order-md-1">
                <svg class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" width="500"
                     height="500" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice"
                     focusable="false" role="img" aria-label="Placeholder: 500x500">
                    <title>Placeholder</title>
                    <rect width="100%" height="100%" fill="#eee"></rect>
                    <text x="50%" y="50%" fill="#aaa" dy=".3em">500x500</text>
                </svg>
                <%-- 使用img --%>
            </div>
        </div>

        <hr class="featurette-divider" />

        <div class="row featurette">
            <div class="col-md-7">
                <h2 class="featurette-heading">
                    And lastly, this one. <span class="text-muted">Checkmate.</span>
                </h2>
                <p class="lead">
                    Donec ullamcorper nulla non metus auctor fringilla. Vestibulum id
                    ligula porta felis euismod semper. Praesent commodo cursus magna,
                    vel scelerisque nisl consectetur. Fusce dapibus, tellus ac cursus
                    commodo.
                </p>
            </div>
            <div class="col-md-5">
                <svg class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" width="500"
                     height="500" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice"
                     focusable="false" role="img" aria-label="Placeholder: 500x500">
                    <title>Placeholder</title>
                    <rect width="100%" height="100%" fill="#eee"></rect>
                    <text x="50%" y="50%" fill="#aaa" dy=".3em">500x500</text>
                </svg>
                <%-- 使用img --%>
            </div>
        </div>

        <hr class="featurette-divider" />

        <!-- /END THE FEATURETTES -->
    </div>
    <!-- /.container -->

    <!-- FOOTER -->
    <footer class="container">
        <p class="float-right"><a class="back-top" href="javascript:void(0)">回到顶部</a></p>
        <p>
            © 2019 Company, Inc.<%-- · <a href="javascript:void(0)">隐私</a> ·
            <a href="javascript:void(0)">Terms</a>--%>
        </p>
    </footer>
</main>
<script>
  $(function () {
    $(document).on('click', '.back-top', function () {
      var $html_body = $('html,body');
      $html_body.stop();
      $html_body.animate({
        scrollTop: 0
      }, 500);
    });
  });
</script>
</body>
</html>