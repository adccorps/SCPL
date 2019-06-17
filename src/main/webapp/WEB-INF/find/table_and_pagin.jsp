<%--
  Created by IntelliJ IDEA.
  User: 臻
  Date: 2019/6/5
  Time: 21:27
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<table class="table table-hover table_top">
    <thead>
    <tr>
        <th scope="col">类型</th>
        <th scope="col">物品</th>
        <th scope="col">地点</th>
        <th scope="col">发布时间</th>
        <th scope="col">具体信息</th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <th scope="row" style="color: red">丢失</th>
        <td>Mark</td>
        <td>Otto</td>
        <td>@mdo</td>
        <td>xxxxx</td>
    </tr>
    <tr>
        <th scope="row" style="color: green">拾取</th>
        <td>Mark</td>
        <td>Otto</td>
        <td>@mdo</td>
        <td>xxxxx</td>
    </tr>

    <tr>
        <th scope="row" style="color: #FFCC00">公示</th>
        <td>Mark</td>
        <td>Otto</td>
        <td>@mdo</td>
        <td>xxxxx</td>
    </tr>

    <tr>
        <th scope="row" style="color: #FFCC00">公示</th>
        <td>Mark</td>
        <td>Otto</td>
        <td>@mdo</td>
        <td>xxxxx</td>
    </tr>
    <tr>
        <th scope="row" style="color: #FFCC00">公示</th>
        <td>Mark</td>
        <td>Otto</td>
        <td>@mdo</td>
        <td>xxxxx</td>
    </tr>
    <tr>
        <th scope="row" style="color: #FFCC00">公示</th>
        <td>Mark</td>
        <td>Otto</td>
        <td>@mdo</td>
        <td>xxxxx</td>
    </tr>
    <tr>
        <th scope="row" style="color: #FFCC00">公示</th>
        <td>Mark</td>
        <td>Otto</td>
        <td>@mdo</td>
        <td>xxxxx</td>
    </tr>
    <tr>
        <th scope="row" style="color: #FFCC00">公示</th>
        <td>Mark</td>
        <td>Otto</td>
        <td>@mdo</td>
        <td>xxxxx</td>
    </tr>
    <tr>
        <th scope="row" style="color: #FFCC00">公示</th>
        <td>Mark</td>
        <td>Otto</td>
        <td>@mdo</td>
        <td>xxxxx</td>
    </tr>
    <tr>
        <th scope="row" style="color: #FFCC00">公示</th>
        <td>Mark</td>
        <td>Otto</td>
        <td>@mdo</td>
        <td>xxxxx</td>
    </tr>
    <tr>
        <th scope="row" style="color: #FFCC00">公示</th>
        <td>Mark</td>
        <td>Otto</td>
        <td>@mdo</td>
        <td>xxxxx</td>
    </tr>
    </tbody>
</table>



<nav aria-label="Page navigation example" class="nav_pagination">
    <ul class="pagination">
        <li class="page-item">
            <a class="page-link" href="#" aria-label="Previous">
                <span aria-hidden="true">&laquo;</span>
            </a>
        </li>
        <li class="page-item"><a class="page-link" href="#">1</a></li>
        <li class="page-item"><a class="page-link" href="#">2</a></li>
        <li class="page-item"><a class="page-link" href="#">3</a></li>
        <li class="page-item"><a class="page-link" href="#">4</a></li>
        <li class="page-item"><a class="page-link" href="#">5</a></li>
        <li class="page-item">
            <a class="page-link" href="#" aria-label="Next">
                <span aria-hidden="true">&raquo;</span>
            </a>
        </li>
    </ul>
</nav>

<script>
    $.fn.bootstrapPaginator.regional["chinese"] = {
        first: "首页",
        prev: "上一页",
        next: "下一页",
        last: "尾页",
        current: "当前页",
        page: "第\${0}页"
    };

    $('.page').bootstrapPaginator({
        language: "chinese",
        currentPage: 1,
        totalPages: 1,
        onPageChanged: function (e, oldPage, newPage) {
            if (oldPage !== newPage) {
                if (newPage !== 1) {
                    $.ajax({
                        url: '${pageContext.servletContext.contextPath}/post/page/' + newPage,//
                        type: 'GET',
                        success: function (result, status, xhr) {
                            
                            var $posts = $('.posts');
                            $posts.html('');
                            $.each(result.posts, function (index, post) {
                                var $post = $('<div class="row mt-3 mb-3 post"></div>');
                                var $postTitleBody = $('<div class="col-6 pl-5"></div>');
                                var $postTitle = $('<a href="${pageContext.servletContext.contextPath}/post/view/' + post.postId + '">' + post.postTitle + '</a>');
                                $postTitleBody.append($postTitle);
                                $post.append($postTitleBody);
                                var $postUserName = $('<div class="col-3 text-center">' + post.user.userName + '</div>');
                                $post.append($postUserName);
                                var $postCreateTime = $('<div class="col-3 text-center">' + post.createTime.substr(0, 19) + '</div>');
                                $post.append($postCreateTime);
                                $posts.append($post);
                            });
                        }
                    });
                } else {
                    window.location.reload();
                }
            }
        }
    });

    $('.posts').css({ minHeight: '384px' });

</script>

