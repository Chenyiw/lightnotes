<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>登录</title>

    <link rel="stylesheet" href="/resources/util/bootstrap/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="/resources/css/main.css"/>
    <link rel="stylesheet" href="/resources/css/login/login.css"/>
    

</head>

<body>
<%
    String info = (String)session.getAttribute("info");
    session.removeAttribute("info");


%>

<div class="container">
    <nav class="navbar navbar-inverse navbar-fixed-top">
        <div class="container-fluid">
            <div class="navbar-header">
                <p class="navbar-brand" >轻笔记系统</p>
            </div>
        </div>
    </nav>
</div>

<div class="bg">
    <form action="/user/login" method="post" onsubmit="return validateForm(this);" class="login">
        <span id="user">邮箱：</span><input class="put" type="text" name="usermail" /><br/>
        <span id="password">密码：</span><input class="put"  type="password" name="password" /><br/>
        <input   type="submit"  id="sub" value="" ></input>
    </form>
</div>
<div class="shandow"></div>

<%
    if (info != null){
        out.println("<script>alert(\""+info+"\")</script>");
    }
%>

<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
<script type="text/javascript" src="/resources/util/bootstrap/js/bootstrap.min.js"></script>

<script type="text/javascript">


    function validateForm(form){
        var usermail = form.usermail.value;
        var password = form.password.value;

        //验证为空
        if (usermail == null || usermail == ""){
            alert("用户名为空");
            return false;
        }else if (password == null || password == ""){
            alert("密码为空");
            return false;
        }

        //验证长度
        if (usermail.length > 50) {
            alert("用户名太长");
            return false;
        }else if (password.length > 50) {
            alert("密码太长");
            return false;
        }

        return true;
    }
</script>

</body>
</html>
