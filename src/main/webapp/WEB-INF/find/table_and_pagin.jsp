<%--
  Created by IntelliJ IDEA.
  User: 臻
  Date: 2019/6/5
  Time: 21:27
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>



<div class="CwzView"></div>



</tbody></table>


<script src="${pageContext.servletContext.contextPath}/js/bootstrap-paginator.min.js"></script>

<ul class="page"></ul>

<script>
    var $page = $('.page');
    var Status = 0;     //测试为1
    var query = false;
    $.fn.bootstrapPaginator.regional["chinese"] = {
        first: "首页",
        prev: "上一页",
        next: "下一页",
        last: "尾页",
        current: "当前页",
        page: "第\${0}页"
    };

    $page.bootstrapPaginator({
        language: "chinese",
        currentPage: 1,
        totalPages: 1,
        onPageChanged: function (e, oldPage, newPage) {
            var url = '${pageContext.servletContext.contextPath}/find/findPage?findPage=' + newPage; //
            <%--if (query) {--%>
            <%--    url = '${pageContext.servletContext.contextPath}/post/' + $('.search-input').val() + '/page/' + newPage; // 搜索的--%>
            <%--}--%>
            $.ajax({
                url: url,
                type: 'GET',
                success: function (result, status, xhr) {
                    var target = $(e.currentTarget);
                    var options = {currentPage: newPage};
                    if (result.totalPages !== target.bootstrapPaginator('getOption').totalPages) {
                        result.totalPages = result.totalPages || 1;
                        options['totalPages'] = result.totalPages;
                    }
                    target.bootstrapPaginator('setOptions', options);
                    var $posts = $('.CwzView'); // class
                   $posts.html('');
                    if (JSON.stringify(result.posts) === '[]') { // 未找到
                        $posts.append('<div class="row align-items-center justify-content-center display-4" style="min-height: 384px"><span class="text-danger">搜索结果不存在</span></div>');
                    } else if (result.Status == 0) {             //首页全部
                        $.each(result.findList, function (index, find) {
                            $posts.append('<div>' + find.findId + '</div>');
                        });
                    } else (JSON.stringify())
                    {             //寻物
                        $posts.append('    <table class="table table-hover table_top">\n' +
                            '        <thead>\n' +
                            '        <tr>\n' +
                            '            <th scope="col">类型</th>\n' +
                            '            <th scope="col">物品</th>\n' +
                            '            <th scope="col">地点</th>\n' +
                            '            <th scope="col">发布时间</th>\n' +
                            '            <th scope="col">具体信息</th>\n' +
                            '        </tr>\n' +
                            '        </thead>\n' +
                            '        <tbody>')
                        $.each(result.findList, function (index, find) {
                            $posts.append('<tr><th scope="row" style="color: red">丢失</th><td>' +
                                find.findId + '</td><td>' +
                                find.desc + '</td><td>' +
                                find.findId + '</td><td>' +
                                find.findId
                                + '</td></tr>'

                            );
                        });

                    }
                }
            });
        }
    });

    $('.posts').css({minHeight: '384px'});

    $(function () {
        var width = $('.search-input').css('width');
        $(document).on('blur', '.search-input', function () {
            var $this = $(this);
            $this.stop();
            $this.animate({width: width});
        }); // 失去焦点

        $(document).on('focus', '.search-input', function () {
            var $this = $(this);
            $this.stop();
            $this.animate({width: width.replace('px', '') * 1.5});
        }); // 获得焦点

        $(document).on('click', '.search', function () {
            query = !!$('.search-input').val().trim();
            var currentPage = $page.bootstrapPaginator('getOption').currentPage;
            if (currentPage === 1) {
                $page.bootstrapPaginator('reload');
            } else {
                $page.bootstrapPaginator('show', 1);
            }
        });

        $(document).on('keydown', '.search-input', function (e) {
            if (e.which === 13) {
                $('.search-input').blur();
                $('.search').click();
            }
        })



    });

</script>

<%--var $post = $('<div class="row mt-3 mb-3 post"></div>');--%>
<%--var $postTitleBody = $('<div class="col-6 pl-5"></div>');--%>
<%--var $postTitle = $('<a href="${pageContext.servletContext.contextPath}/post/view/' + find.postId + '">' + find.postTitle + '</a>');--%>
<%--$postTitleBody.append($postTitle);--%>
<%--$post.append($postTitleBody);--%>
<%--var $postUserName = $('<div class="col-3 text-center">' + find.user.userName + '</div>');--%>
<%--$post.append($postUserName);--%>
<%--var $postCreateTime = $('<div class="col-3 text-center">' + find.createTime.substr(0, 19) + '</div>');--%>
<%--$post.append($postCreateTime);--%>

