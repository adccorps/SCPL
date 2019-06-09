/**
 * Created by Wang on 2019/5/27.
 */
$(function () {
    /**
     * 进页面执行查询商品
     * */
    // showAll();

    queryGoods();
    function queryGoods() {
        $.ajax({
            url: "queryGoods",
            Type: "post",
            dataType: "json",
            data:'pageNum='+1,
            success: function (datas) {
                console.log(datas);
                $("#show").empty();
                getGoods(datas);
             /*   getPage(url,datas.totalPages);*/
                $("#page1").siblings().empty();
                $('#page1').bootstrapPaginator({
                    language: "chinese",
                    currentPage: 1,
                    totalPages:datas.totalPages,
                    // ${totalPages}
                    onPageChanged: function (e, oldPage, newPage) {
                        if (oldPage !== newPage) {
                            $.ajax({
                                url: 'queryGoods?pageNum='+ newPage,
                                type: 'GET',
                                success: function (datas) {
                                    //显示商品card
                                    $("#show").empty();
                                    getGoods(datas);
                                }
                            });
                        }
                    }
                });
            }})
        }
   /* function getPage(url,totalPages) {
        $('.page').bootstrapPaginator({
            language: "chinese",
            currentPage: 1,
            totalPages:totalPages,
            // ${totalPages}
            onPageChanged: function (e, oldPage, newPage) {
                if (oldPage !== newPage) {
                    $.ajax({
                        url: url+'?pageNum='+ newPage,
                        type: 'GET',
                        success: function (datas) {
                            //显示商品card
                            $("#show").empty();
                            getGoods(datas);
                        }
                    });
                }
            }
        });
    }*/

    $("#chooseType").on("click", "li>a", function () {
        var Type = $(this).html();
        findByType(Type);
    })

    /**
     * 根据类型查找对应类型项
     * */
    function findByType(type) {
       // console.log(type);
        $.ajax({
            url: "findGoodsByType.action",
            data: {
                "goods.goodsType": type,
                "pageNum":1},
            type: 'POST',
            success: function (datas) {
                console.log(datas);
                $("#show").empty();
                $("#page2").siblings().empty();
                $('#page2').bootstrapPaginator({
                    language: "chinese",
                    currentPage: 1,
                    totalPages:datas.totalPages,
                    onPageChanged: function (e, oldPage, newPage) {
                        if (oldPage !== newPage) {
                            $.ajax({
                                url: 'findGoodsByType?pageNum='+ newPage+"&goods.goodsType="+type,
                                type: 'GET',
                                success: function (datas) {
                                    //显示商品card
                                    $("#show").empty();
                                    getGoods(datas);
                                }
                            });
                        }
                    }
                });
                if (type=="所有商品"){
                    queryGoods();
                }else {
                  //  console.log(datas.totalPages);
                    getGoods(datas);
                }
                if(datas.shopError==-4){
                    $("#show").html("此分类暂时没有商品")
                }
            }
        });
    }

    /**
     * 获取json,显示商品
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

    /**
    * 模糊搜索
    * */
    $("#searchBtn").click(function () {
        var searchName =$("#searchInput").val()
     //   console.log($("#searchInput").val());
        search(searchName)
    })
    function search(Name) {
        $.ajax({
            url: "findGoodsByName",
            data:{
                "goods.goodsName" : Name,
                "pageNum":1,
            },
            type: 'POST',
            success: function (datas) {
                $("#show").empty();
                getGoods(datas);
                $("#page3").siblings().empty();
                $('#page3').bootstrapPaginator({
                    language: "chinese",
                    currentPage: 1,
                    totalPages:datas.totalPages,
                    onPageChanged: function (e, oldPage, newPage) {
                        if (oldPage !== newPage) {
                            $.ajax({
                                url: 'findGoodsByName?pageNum='+ newPage+"&goods.goodsName="+Name,
                                type: 'GET',
                                success: function (datas) {
                                    //显示商品card
                                    $("#show").empty();
                                    getGoods(datas);
                                }
                            });
                        }
                    }
                });

                if(datas.shopError==-4){
                    $("#show").html("没有此商品,请确认关键字是否错误")
                }
            }
        });
    }

    /**
    * 获取图片数据分割成数组
    * */
function splitPicURL(pic) {
        var picArr;
    picArr= pic.split(",");
   return picArr;
}



});