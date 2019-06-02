<%--
  Created by IntelliJ IDEA.
  User: Wang
  Date: 2019/5/28
  Time: 16:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<nav class="navbar navbar-light bg-light mt-3">
    <form class="form-inline col-md-5">
        <div class="input-group" style="width: 100%">
            <input  class="form-control "  type="text"  id="searchInput" placeholder="Search" >
            <div class="input-group-append" >
                <button class="btn btn-primary" id="searchBtn" >Search</button>
            </div>
        </div>
    </form>
    <a href="viewAdd.action"> <button type="button" class="btn btn-outline-primary float-md-right" >上传二手商品</button></a>
</nav>
