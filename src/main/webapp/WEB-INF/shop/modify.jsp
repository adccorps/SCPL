<%--
  Created by IntelliJ IDEA.
  User: Wang
  Date: 2019/6/1
  Time: 10:57
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="content-language" content="zh-CN"/>
    <title><s:if test="#session.user!=null">${sessionScope.user.userName} | </s:if>我的订单</title>
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/bootstrap.min.css">
    <link href="${pageContext.servletContext.contextPath}/css/carousel.css" rel="stylesheet"/>
    <script src="${pageContext.servletContext.contextPath}/js/jquery.min.js"></script>
    <script src="${pageContext.servletContext.contextPath}/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.servletContext.contextPath}/js/shop/goods.js"></script>
    <script>
        $(function () {
            $("#goodsDesc").html("${goods.goodsDesc}")

            /**
             * 图片路径分割
             * */
            function splitPicURL(pic){
                var picArr;
                picArr= pic.split(",");
                return picArr;
            }

            var goodsPicArr=splitPicURL($("#getPicURL").val());

            /**
             * 处理商品的图片显示
             * */
            for (var n=0;n<goodsPicArr.length -1;n++) {
                $("#picShow").append(
                    "<div class='card float-left '  style='width: 14rem;'>" +
                    " <span class='close position-absolute '  aria-hidden='true' style='height: 20px;width: 20px;right:0 ;top: 0; cursor: pointer;' >&times;</span> " +
                    " <img src=" + goodsPicArr[n] + " class='showPic' class='col-4 float-left' style='width: 14rem; height: 200px' >")
                + "</div>"
            }
        })

    </script>
</head>
<body>
<jsp:include page="../header/header.jsp">
    <jsp:param name="shopActive" value="active"/>
</jsp:include>
<div class="container">
    <form class="m-auto" action="saveGoods.action" method="get">
        <div class="form-row">
            <div class="col-md-12 mb-3 ">
                <input id="goodsId" value="${goods.goodsId}" type="hidden">
                <label for="goodsName">商品名称</label>
                <input type="text" class="form-control " name="goods.goodsName" id="goodsName" placeholder="商品名称"
                       value="${goods.goodsName}" required>
                <div class="valid-feedback"></div>
                <div class="invalid-feedback">输入不得为空</div>
            </div>
        </div>
        <div class="form-row">
            <div class="col-md-12 mb-3  ">
                <label for="goodsPrice">商品价格</label>
                <input type="text" class="form-control " name="goods.goodsPrice" id="goodsPrice" placeholder="商品价格"
                       value="${goods.goodsPrice}" required>
                <div class="valid-feedback">
                </div>
                <div class="invalid-feedback">请在价格区间0-99999中输入</div>
            </div>
        </div>

        <div class="form-row">
            <div class="from-group col-md-12 mb-3">
                <label for="goodsType">商品类别</label>
                <select class=" form-control" id="goodsType" name="goods.goodsType">
                    <option disabled>Choose...</option>
                    <option value="电子数码" ${goods.goodsType=='电子数码'?"selected" : ""}>电子数码</option>
                    <option value="书籍教材" ${goods.goodsType=='书籍教材'?"selected" : ""}>书籍教材</option>
                    <option value="二手衣物"${goods.goodsType=='二手衣物'?"selected" : ""}>二手衣物</option>
                    <option value="日常用品" ${goods.goodsType=='日常用品'?"selected" : ""}>日常用品</option>
                    <option value="运动健身" ${goods.goodsType=='运动健身'?"selected" : ""}>运动健身</option>
                    <option value="其他闲置" ${goods.goodsType=='其他闲置'?"selected" : ""}>其他闲置</option>
                </select>
            </div>
        </div>


        <div class="form-row">
            <div class="form-group col-md-12 mb-3">
                <label for="goodsDesc">商品描述</label>
                <textarea class="form-control" name="goods.goodsDesc" id="goodsDesc" rows="3"
                          value="${goods.goodsDesc}"></textarea>
            </div>
        </div>
        <div class="form-row" id="picRow">
            <div class="form-group">
                <label for="goodsPic">上传商品图片</label><br>
                <input type="file" name="goods.goodsPic" class="form-control-file" id="goodsPic" multiple style="display: none">
                <button  id="sumbitPic" type="button">上传图片</button>

            </div>
            <div id="picShow" class="col-md-12 ">
                <input type="hidden" value="${goods.goodsPic}" id="getPicURL" >
            </div>

        </div>
        <button class="btn btn-primary" id="saveIcon" type="submit">保存</button>
    </form>
</div>

<jsp:include page="../components/tipModal.jsp"></jsp:include>
</body>
</html>
