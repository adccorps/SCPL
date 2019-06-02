<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: Wang
  Date: 2019/5/17
  Time: 20:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="zh-CN">
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <meta http-equiv="content-language" content="zh-CN" />
    <title><s:if test="#session.user!=null">${sessionScope.user.userName} | </s:if>二手市场首页</title>
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/bootstrap.min.css">
    <link href="${pageContext.servletContext.contextPath}/css/carousel.css" rel="stylesheet" />
    <script src="${pageContext.servletContext.contextPath}/js/jquery.min.js"></script>
    <script src="${pageContext.servletContext.contextPath}/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.servletContext.contextPath}/js/shop/goodsValidation.js"></script>
</head>
<body>
<jsp:include page="../header/header.jsp">
    <jsp:param name="shopActive" value="active" />
</jsp:include>
<div class="container">
<jsp:include page="shop_header.jsp"></jsp:include>
</div>
<div class="container col-md-6 mt-3" >

    <h1 class="text-center">商品信息</h1>
    <form class="m-auto" action="addGoods.action" method="get">
        <div class="form-row">
            <div class="col-md-12 mb-3 ">
                <label for="goodsName">商品名称</label>
                <input type="text" class="form-control " name="goods.goodsName" id="goodsName" placeholder="商品名称" value="" required>
                <div class="valid-feedback"></div>
                <div class="invalid-feedback">输入不得为空</div>
            </div>
        </div>
        <div class="form-row">
            <div class="col-md-12 mb-3  ">
                <label for="goodsPrice">商品价格</label>
                <input type="text" class="form-control "  name="goods.goodsPrice" id="goodsPrice" placeholder="商品价格" value="" required>
                <div class="valid-feedback">
                    Looks good!
                </div>
                <div class="invalid-feedback">lohkjlkj</div>
            </div>
        </div>

        <div class="form-row">
            <div class="from-group col-md-12 mb-3">
                <label for="goodsType">商品类别</label>
                <select class=" form-control" id="goodsType" name="goods.goodsType">
                    <option disabled>Choose...</option>
                    <option value="电子数码">电子数码</option>
                    <option value="书籍教材">书籍教材</option>
                    <option value="二手衣物">二手衣物</option>
                    <option value="日常用品">日常用品</option>
                    <option value="运动健身">运动健身</option>
                    <option value="其他闲置">其他闲置</option>
                </select>
            </div>
        </div>


        <div class="form-row">
            <div class="form-group col-md-12 mb-3">
                <label for="goodsDesc">商品描述</label>
                <textarea class="form-control" name="goods.goodsDesc" id="goodsDesc" rows="3"></textarea>
            </div>
        </div>
        <div class="form-row">
            <div class="form-group">
                <label for="goodsPic">上传商品图片</label><br>
                <input type="file" name="goods.goodsPic" class="form-control-file" id="goodsPic" style="display: none">
                <button  id="sumbitPic" type="button">上传图片</button>
            </div>
            <img src="#" id="showPic" class="col-5 float-left  ">
        </div>
        <button class="btn btn-primary" type="submit">Submit form</button>
    </form>
</div>
</body>
</html>
