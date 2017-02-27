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
    <title>用户注册</title>

    <link rel="stylesheet" href="/resources/util/bootstrap/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="/resources/css/main.css"/>
</head>

<body>

<div class="container">
    <nav class="navbar navbar-inverse navbar-fixed-top">
        <div class="navbar-header">
            <!-- 自适应的nav下拉框 -->
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <p class="navbar-brand" >轻笔记用户注册</p>
        </div>
        <div id="navbar" class="navbar-collapse collapse">


            <ul class="nav navbar-nav navbar-left pull-right">
                <li><a href="/user/logout"><span class="glyphicon glyphicon-remove-circle" aria-hidden="true"></span>&nbsp;退出</a></li>
            </ul>
        </div>
    </nav>
    <div class="container-fluid">
        <div class="row">
            <%--<div class="col-sm-3 col-md-2 sidebar">--%>
                <%--<ul class="nav nav-sidebar">--%>
                    <%--<li class="active"><a href="">我的信息</a></li>--%>
                    <%--<li><a href="/user/resetPassword">修改密码</a></li>--%>

                <%--</ul>--%>
            <%--</div>--%>
            <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
                <h2 class="page-header">
                    <a href="/user/userDetail">用户注册</a>
                </h2>

                <h4 class="page-header main-header">填入信息</h4>
                <div class="row main-input">
                    <form class=" form-horizontal input-form" action="/user/doSignUp" method="post" onSubmit="return validateForm(this)">
                        <div class="col-md-6 form-group">
                            <label for="input1" class="col-sm-3 control-label">用户邮箱</label>
                            <div class="col-sm-9">
                                <input type="text" name="usermail" class="form-control" id="input1" value="">
                            </div>
                        </div>

                        <div class="col-md-6 form-group">
                            <label for="input2" class="col-sm-3 control-label">用户名称</label>
                            <div class="col-sm-9">
                                <input type="text" name="name" class="form-control" id="input2" value="">
                            </div>
                        </div>



                        <div class="col-md-6 form-group">
                            <label for="input3" class="col-sm-3 control-label">用户性别</label>
                            <div class="col-sm-9">
                                <input type="text" name="gender" class="form-control" id="input3" value="">
                            </div>
                        </div>

                        <div class="col-md-6 form-group">
                            <label for="input4" class="col-sm-3 control-label">用户年龄</label>
                            <div class="col-sm-9">
                                <input type="text" name="age" class="form-control" id="input4" value="">
                            </div>
                        </div>

                        <div class="col-md-6 form-group">
                            <label for="input5" class="col-sm-3 control-label">输入密码</label>
                            <div class="col-sm-9">
                                <input type="password" name="password" class="form-control" id="input5">
                            </div>
                        </div>


                        <div class="col-md-6 form-group">
                            <label for="input6" class="col-sm-3 control-label">确认密码</label>
                            <div class="col-sm-9">
                                <input type="password" name="password1" class="form-control" id="input6">
                            </div>
                        </div>


                        <div class="col-md-6 form-group">
                            <label>  &nbsp</label>
                        </div>
                        <div class="col-md-6 form-group">

                            <label>  &nbsp</label>
                        </div>

                        <div class="col-md-6 pull-right form-group">
                            <div class="col-sm-6 col-sm-offset-6">
                                <input type="submit" value="注册" class="form-control btn btn-primary" >
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<%
    if(session.getAttribute("info")!=null){

        out.print("<script type='text/javascript'>alert('"+session.getAttribute("info")+"');</script>");
        session.setAttribute("info",null);
    }
%>



<script src="/resources/js/jquery.min.js"></script>
<script src="/resources/util/bootstrap/js/bootstrap.min.js"></script>
<script src="/resources/util/laydate/laydate.js"></script>


<script type="text/javascript">
    function validateForm(form){
        var usermail = form.usermail.value;
        var name = form.name.value;
        var gender = form.gender.value;
        var age = form.age.value;




        //验证为空
        if (usermail == null || usermail == ""){
            alert("用户邮箱为空");
            return false;
        }else if (name == null || name == ""){
            alert("用户名称为空");
            return false;
        }else if (gender == null || gender == ""){
            alert("用户性别为空");
            return false;
        }else if (age == null || age == ""){
            alert("用户年龄为空");
            return false;
        }

        if (password == null || password == ""){
            alert("第一次输入密码为空");
            return false;
        }if (password1 == null || password1 == ""){
            alert("第二次输入密码为空");
            return false;
        }if (password != password1){
            alert("前后两次密码输入不一致");
            return false;
        }

        return true;
    }
</script>



</body>
</html>







