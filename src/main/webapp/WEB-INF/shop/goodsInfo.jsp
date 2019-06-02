
<%--
  Created by IntelliJ IDEA.
  User: Wang
  Date: 2019/5/28
  Time: 14:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <meta http-equiv="content-language" content="zh-CN" />
    <title><s:if test="#session.user!=null">${sessionScope.user.userName} | </s:if>二手市场首页</title>
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/bootstrap.min.css">
    <link href="${pageContext.servletContext.contextPath}/css/carousel.css" rel="stylesheet" />
    <script src="${pageContext.servletContext.contextPath}/js/jquery.min.js"></script>
    <script src="${pageContext.servletContext.contextPath}/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.servletContext.contextPath}/js/shop/shop.js"></script>
<script>
    $(function () {

        $("#buyIron").click(function () {
            $.ajax({
                url:"buyGoods.action",
                Type:"post",
                dataType:"json",
                data:{
                    "goods.goods":"${goods.goods}"
                },
                success:function (datas) {
                    console.log(datas);
                    if (datas.shopError!=0){
                        var $modalBody = $('.modal-body p');
                        var $tip = $('#tip-modal');
                        $modalBody.html(datas.tip);
                        $tip.modal();
                        $tip.on('hidden.bs.modal', function (e) {
                            $modalBody.html('');
                        });
                    }

                }
            })
        })
    })
</script>
    <title>Title</title>
</head>

<body>
<jsp:include page="../header/header.jsp">
    <jsp:param name="shopActive" value="active" />
</jsp:include>

<div class="container" >
    <jsp:include page="shop_header.jsp"></jsp:include>
    <div class="float-left col-md-5 mt-5 ml-5 "  >
        <img src="${goods.goodsPic}" style="width: 98%; background-color: #95999c">
    </div>

    <div  class="col-md-5 float-left mt-4 pl-5" >
        <h2  style="color: black; border-left: black solid 3px;"> &nbsp;&nbsp;<b>${goods.goodsName}</b></h2>
        <hr/>
        <p class=" float-left col-md-12  " style="font-size: 17px">商品类型: &nbsp;&nbsp;&nbsp;&nbsp;${goods.goodsType} </p>
        <p class=" float-left col-md-12  " style="font-size: 17px">价格: &nbsp;&nbsp;&nbsp;&nbsp;¥ ${goods.goodsPrice}元 </p>
        <div  class=" float-left ">
             <p class="float-left col-3" style="margin: 0; padding-top: 7px">数量:</p>
            <div class="float-left input-group col-5 ">
                <div class="input-group-prepend">
                    <button class="btn btn-outline-secondary" type="button">-</button>
                </div>
                <input class="form-control  text-center"  type="text" value="1"  ria-describedby="basic-addon1" disabled >
                <div class="input-group-append">
                    <button class="btn btn-outline-secondary" type="button">+</button>
                </div>
            </div>
        </div>
       <p class="float-left col-md-12 " style="color: #95999c;font-size: 13.5px">库存数量: &nbsp;&nbsp;1</p>

        <div class="float-left col-6 text-center mt-4">
           <button type="button" class="btn btn-primary" id="buyIron" >立即购买</button>
            <%--//buyGoods.action?goods.goods=${goods.goods}--%>
        </div>
    </div>


        <div class="col-10 float-left mt-5 ml-5 h-25 border"  >
            <b>卖家商品介绍:</b><br>
            <p class="text-break">${goods.goodsDesc}</p>
        </div>

    </div>
</div>
<jsp:include page="../components/tipModal.jsp"></jsp:include>
</body>
</html>
