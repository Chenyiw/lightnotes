<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="org.lightnotes.entity.*,org.lightnotes.dto.*" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>管理用户</title>

    <link rel="stylesheet" href="/resources/util/bootstrap/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="/resources/css/main.css"/>
</head>


<body>
<div class="container">
    <nav class="navbar navbar-inverse navbar-fixed-top">
        <div class="container-fluid">
            <div class="navbar-header">
                <!-- 自适应的nav下拉框 -->
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <p class="navbar-brand" >轻笔记</p>
            </div>
            <div id="navbar" class="navbar-collapse collapse">
                <ul class="nav navbar-nav navbar-left">
                    <li class="active"><a href=""><span class="glyphicon glyphicon-user" aria-hidden="true"></span>&nbsp;管理员</a></li>
                </ul>

                <ul class="nav navbar-nav navbar-left pull-right">
                    <li><a href="/user/logout"><span class="glyphicon glyphicon-remove-circle" aria-hidden="true"></span>&nbsp;退出</a></li>
                </ul>
            </div>
        </div>
    </nav>
    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-3 col-md-2 sidebar">
                <ul class="nav nav-sidebar">
                    <li class="active"><a href="">管理用户</a></li>
                    <li><a href="">管理群组</a></li>

                </ul>
            </div>
            <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
                <h2 class="page-header">
                    <a href="" class="active">查询用户</a>
                </h2>

                <h4 class="page-header main-header">选择条件</h4>
                <div class="row main-input">
                    <%--/user/userLimit--%>
                    <form class=" form-horizontal input-form" action="" method="post" onSubmit="return validateForm(this)">
                        <div class="col-md-6 form-group">
                            <label for="input1" class="col-sm-3 control-label">用户邮箱</label>
                            <div class="col-sm-9">
                                <input type="text" name="usermail" class="form-control" id="input1" placeholder="邮箱">
                            </div>
                        </div>

                        <div class="col-md-6 form-group">
                            <label for="input2" class="col-sm-3 control-label">用户名称</label>
                            <div class="col-sm-9">
                                <input type="text" name="name" class="form-control" id="input2" placeholder="名称">
                            </div>
                        </div>
                        <%--<div class="col-md-6  form-group">--%>
                        <%--<label for="input2" class="col-sm-3 control-label">笔记标签</label>--%>
                        <%--<div class="col-sm-9">--%>
                        <%--<input type="text" name="depName" class="form-control" id="input2" placeholder="标签">--%>
                        <%--</div>--%>
                        <%--</div>--%>


                        <div class="col-md-6 pull-right form-group">
                            <div class="col-sm-6 col-sm-offset-6">
                                <input type="submit" value="查询" class="form-control btn btn-primary" action="">
                            </div>
                        </div>
                    </form>
                </div>

                <h4 class="page-header main-header">结果</h4>
                <div class="table-responsive">
                    <table class="table table-striped">
                        <thead>
                        <tr class="info">
                            <th>邮箱</th>
                            <th>名称</th>
                            <th>性别</th>
                            <th>年龄</th>
                            <th>操作</th>

                        </tr>
                        </thead>
                        <tbody>
                        <%
                            if(session.getAttribute("info")!=null){

                                out.print("<script type='text/javascript'>alert('"+session.getAttribute("info")+"');</script>");
                                session.setAttribute("info",null);
                            }
                        %>



                        <c:forEach items="${user}" var="user">
                            <tr>
                                <td>${user.usermail}</td>
                                <td>${user.name}</td>
                                <td>${user.gender}</td>
                                <td>${user.age}</td>
                                <td>
                                    <%--/user/deleteUser--%>
                                    <form class="" action="" method="post" >
                                        <input type="hidden"  name="noteID" value="${user.userID}"/>
                                        <input  type="submit" value="删除" class=" btn btn-sm btn-danger "/>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>


                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="/resources/js/jquery.min.js"></script>
<script src="/resources/util/bootstrap/js/bootstrap.min.js"></script>






</body>
</html>







