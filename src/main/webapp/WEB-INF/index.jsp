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
        </ol>
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="http://10.2.16.131/images/e005a54837c875b68ed6975b5272e7f9.jpg" alt="" /> <%-- 使用img --%>
            </div>
            <div class="carousel-item">
                <img src="http://10.2.16.131/images/4fae7ea6b08c24d99504d51c3a31bdf8.jpg" alt="" /> <%-- 使用img --%>
            </div>

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
        <div class="row">
            <div class="col-lg-4">
                <svg class="bd-placeholder-img rounded-circle" width="140" height="140"
                     xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false"
                     role="img" aria-label="Placeholder: 140x140">
                    <image x="0" y="0" width="100%" height="100%"
                           xlink:href="http://10.2.16.131/images/ba697970361b521b2ae05594a5404c65.png"></image>
                </svg>
                <h2>帖吧</h2>
                <p>
                    这是一个展示自我风采，结交知音，搭建别具特色的“兴趣主题“互动平台，为校内同学提供一个表达和交流思想的自由网络空间。
                </p >
                <p>
                    <a class="btn btn-secondary" href="${pageContext.servletContext.contextPath}/post" role="button">进入帖吧 »</a>
                </p >
            </div>
            <!-- /.col-lg-4 -->
            <div class="col-lg-4">
                <svg class="bd-placeholder-img rounded-circle" width="140" height="140"
                     xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false"
                     role="img" aria-label="Placeholder: 140x140">
                    <title>Placeholder</title>
                    <rect width="100%" height="100%" fill="#777"></rect>
                    <text x="50%" y="50%" fill="#777" dy=".3em">140x140</text>
                    <image xlink:href="http://10.2.16.131/images/4b0680f5f383eccfd7fe43b8df544f00.jpg" x="0" y="0" height="100%" width="100%" />
                </svg>
                <%-- 使用img --%>
                <h2>校友圈</h2>
                <p>
                    在这里您可以与同学、老师、朋友分享生活中的点点滴滴。赶紧与朋友来体验一下校友网吧！
                </p>
                <p>
                    <a class="btn btn-secondary" href="${pageContext.servletContext.contextPath}/alumniCircle/indexZCQ" role="button">进入校友圈 »</a>
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
                    <image xlink:href="http://10.2.16.131/images/03d464349ead688888ebc2ff3f8e70ae.jpg" x="0" y="0" height="100%" width="100%"/>
                </svg>
                <%-- 使用img --%>
                <h2>任务</h2>
                <p>
                    在这里你可以通过代拿来赚外快，或者发布任务寻找代拿。赶紧来体验一下吧！
                </p >
                <p>
                    <a class="btn btn-secondary" href="${pageContext.servletContext.contextPath}/task/index" role="button">进入任务模块 »</a>
                </p >
            </div>
            <div class="col-lg-6">
                <svg class="bd-placeholder-img rounded-circle" width="140" height="140"
                     xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false"
                     role="img" aria-label="Placeholder: 140x140">
                    <title>Placeholder</title>
                    <rect width="100%" height="100%" fill="#777"></rect>
                    <text x="50%" y="50%" fill="#777" dy=".3em">140x140</text>
                    <image xlink:href="http://10.2.16.131/images/0dcb1eb914315a3d1122fcd46a13a804.jpg" x="0" y="0" height="100%" width="100%"/>
                </svg>
                <%-- 使用img --%>
                <h2>二手市场</h2>
                <p>
                    在这里你可以出售你闲置的物品,你也可能可以淘到你需要的物品,快进来体验一下吧
                </p >
                <p>
                    <a class="btn btn-secondary" href="${pageContext.servletContext.contextPath}/shop/viewIndex" role="button">进入二手市场 »</a>
                </p >
            </div>


            <div class="col-lg-6">
                <svg class="bd-placeholder-img rounded-circle" width="140" height="140"
                     xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false"
                     role="img" aria-label="Placeholder: 140x140">
                    <title>Placeholder</title>
                    <rect width="100%" height="100%" fill="#777"></rect>
                    <text x="50%" y="50%" fill="#777" dy=".3em">140x140</text>
                    <image xlink:href="http://10.2.16.131/images/41b2d214e73bf0afe969e9541260347b.jpg" x="0" y="0" height="100%" width="100%" />
                </svg>
                <h2>失物招领</h2>
                <p>
                    无论你丢了什么，还是捡到了什么，都不妨到失物招领平台来看看或者发张告示。
                    或许拾到物品的好心人，正在此寻找失主。
                    或许失主正在此等待好心人的出现。
                </p>
                <p>
                    <a class="btn btn-secondary" href="${pageContext.servletContext.contextPath}/find/findIndex" role="button">进入失物招领 »</a>
                </p>
            </div>
            <!-- /.col-lg-4 -->
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
    </div>
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