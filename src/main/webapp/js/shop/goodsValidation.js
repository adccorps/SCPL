/**
 * Created by Wang on 2019/5/27.
 */
$(function () {
    $("#goodsName").blur(function () {

        // $(this).addClass("is-invalid");
        if(this.value.length>0 && this.value.length<10){
            $(this).addClass("is-valid");
            $(this).removeClass("is-invalid");
        }else{
            $(this).addClass("is-invalid");
        }
    })

    $("#goodsPrice").blur(function () {

        // $(this).addClass("is-invalid");
        if(this.value>0 && this.value<100){
            $(this).addClass("is-valid");
            $(this).removeClass("is-invalid");
        }else{
            $(this).addClass("is-invalid");
            $(this).removeClass("is-valid");
        }
    })



    /*
     *  图片上传
     * */
    $("#sumbitPic").click(function () {
        $("#goodsPic").click();
        $("#goodsPic").on("change",function () {
            var picUrl = getObjectURL(this.files[0]);
            if (picUrl) {
                $("#showPic").attr("src", picUrl) ; //将图片路径存入src中，显示出图片
            }
        })
        var url=$("#goodsPic").value;
       /* var formData = new FormData();
        formData.append('file', $('#goodsPic')[0].files[0]);*/
        $.ajax({
            url:"http://10.2.16.231:8088/UploadImg/upload.action",
            fileElementId: "goodsPic",
            contentType: "application/x-www-form-urlencoded; charset=utf-8",
            // data:formData,
            dataType:"json",
            success:function (datas) {
                console.log(datas);
            }
        })
    })

    function getObjectURL(file) {
        var url = null ;
        if (window.createObjectURL!=undefined) { // basic
            url = window.createObjectURL(file) ;
        } else if (window.URL!=undefined) { // mozilla(firefox)
            url = window.URL.createObjectURL(file) ;
        } else if (window.webkitURL!=undefined) { // webkit or chrome
            url = window.webkitURL.createObjectURL(file) ;
        }
        return url ;
    }
});