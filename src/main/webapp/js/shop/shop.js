/**
 * Created by Wang on 2019/5/27.
 */
$(function () {
    /**
     * 进页面执行查询商品
     * */
    // showAll();
    $.ajax({
        url: "queryGoods.action",
        Type: "post",
        dataType: "json",
        success: function (dates) {
            $("#show").empty();
            getGoods(dates);
        }})

    $("#chooseType").on("click", "li>a", function () {
        var Type = $(this).html();
        findByType(Type);
    })


    /**
     * 显示所有商品
     * */
    function showAll() {
        $.ajax({
        url: "queryGoods.action",
        Type: "post",
        dataType: "json",
        success: function (dates) {
            $("#show").empty();
            getGoods(dates);
        }
    })
}

    /**
     * 根据类型查找对应类型项
     * */
    function findByType(type) {
       // console.log(type);
        $.ajax({
            url: "findGoodsByType.action",
            data: "goods.goodsType=" + type,
            type: 'POST',
            success: function (datas) {
                $("#show").empty();
                if (type=="所有商品"){
                    showAll();
                }else {
                    getGoods(datas);
                }
                if(datas.shopError==-4){
                    $("#show").html("此分类暂时没有商品")
                }
            }
        });
    }

    /**
     * 获取json并且显示到首页
     * */
    function getGoods(datas) {
        // console.log(datas);
        $.each(datas.goodsList, function (n, obj) {
          pArr = splitPicURL(datas.goodsList[n].goodsPic);
            //console.log(datas);
            $("#show").append(
                "<div class='card ml-3 mt-1 mr-3 mb-2' style='width: 14.5rem'''>" +
                "<a href='getGoodsInfo.action?goods.goodsId=" + datas.goodsList[n].goodsId + "'>" +
                "<img class='card-img-top' src='" + pArr[0]+ "'  style='height: 14.5rem; width: 14.4rem'> </a>" +
                "<div class='car=body pt-3' style='height: 5rem'>" + "<a class='card-link text-center'  href='getGoodsInfo.action?goods.goodsId=" + datas.goodsList[n].goodsId + "'> <p class='text-center' style='margin: 0'>" + datas.goodsList[n].goodsName + "</p></a>" +
                "<h6 class='card-text pl-3' > ¥" + datas.goodsList[n].goodsPrice + " 元</h6> " +
                "</div>" + "</div>"
            );
        });
    }


    $("#searchBtn").click(function () {
        var searchName =$("#searchInput").val()
     //   console.log($("#searchInput").val());
        search(searchName)
    })
    function search(Name) {
        $.ajax({
            url: "findGoodsByName",
            data: "goods.goodsName=" + Name,
            type: 'POST',
            success: function (datas) {
                $("#show").empty();
                getGoods(datas);
                if(datas.shopError==-4){
                    $("#show").html("没有此商品,请确认关键字是否错误")
                }
            }
        });
    }

function splitPicURL(pic) {
        var picArr;
    picArr= pic.split(",");
   return picArr;
}



});