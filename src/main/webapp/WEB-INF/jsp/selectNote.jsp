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
    <title>我的笔记</title>

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
                    <li class="active"><a href=""><span class="glyphicon glyphicon-book" aria-hidden="true"></span>&nbsp;笔记</a></li>
                    <li><a href=""><span class="glyphicon glyphicon-user" aria-hidden="true"></span>&nbsp;群组</a></li>
                    <li><a href=""><span class="glyphicon glyphicon-info-sign" aria-hidden="true"></span>&nbsp;用户信息</a></li>
                </ul>
            </div>
        </div>
    </nav>
    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-3 col-md-2 sidebar">
                <ul class="nav nav-sidebar">
                    <li class="active"><a href="">我的笔记</a></li>
                    <li><a href="">参与的笔记</a></li>

                </ul>
            </div>
            <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
                <h2 class="page-header">
                    <a href="" class="active">查询笔记</a>
                    <span>｜</span>
                    <a href="/note/createNote">新建笔记</a>
                </h2>

                <h4 class="page-header main-header">选择条件</h4>
                <div class="row main-input">
                    <form class=" form-horizontal input-form" action="/note/limit" method="post" onSubmit="return validateForm(this)">
                        <div class="col-md-6 form-group">
                            <label for="input1" class="col-sm-3 control-label">笔记主题</label>
                            <div class="col-sm-9">
                                <input type="text" name="theme" class="form-control" id="input1" placeholder="主题">
                            </div>
                        </div>
                        <%--<div class="col-md-6  form-group">--%>
                            <%--<label for="input2" class="col-sm-3 control-label">笔记标签</label>--%>
                            <%--<div class="col-sm-9">--%>
                                <%--<input type="text" name="depName" class="form-control" id="input2" placeholder="标签">--%>
                            <%--</div>--%>
                        <%--</div>--%>
                        <div class="col-md-6  form-group">
                            <label for="input3" class="col-sm-3 control-label">笔记类型</label>
                            <div class="col-sm-9">
                                <select  name="type" class="form-control" id="input3">
                                    <option value="-1">全部</option>
                                    <option value="1">文本</option>
                                    <option value="2">图片</option>
                                    <option value="3">视频</option>
                                    <option value="4">音频</option>
                                </select>
                            </div>
                        </div>

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
                            <th>主题</th>
                            <th>类型</th>
                            <th>创建者</th>
                            <th>最后编辑者</th>
                            <th>最后编辑时间</th>
                            <th colspan="3" style="text-align: center">操作</th>

                        </tr>
                        </thead>
                        <tbody>
                        <%
                            if(session.getAttribute("info")!=null){

                                out.print("<script type='text/javascript'>alert('"+session.getAttribute("info")+"');</script>");
                                session.setAttribute("info",null);
                            }
                        %>



                        <c:forEach items="${noteDetail}" var="noteDetail">
                        <tr>
                            <td>${noteDetail.theme}</td>
                            <td>${noteDetail.type}</td>
                            <td>${noteDetail.creator}</td>
                            <td>${noteDetail.editor}</td>
                            <td><fmt:formatDate value="${noteDetail.time}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                            <td>
                                <form class="" action="" method="post" >
                                    <input type="hidden"  name="depID" value="${noteDetail.noteID}"/>
                                    <input  type="submit" value="查看" class="  btn btn-sm btn-success"/>
                                </form>
                            </td>
                            <td>
                                <form class="" action="" method="post">
                                    <input type="hidden" name="depID" value="${noteDetail.noteID}"/>
                                    <input  type="submit" value="编辑" class=" btn btn-sm btn-warning "/>
                                </form>
                            </td>
                            <td>
                                <form class="" action="" method="post" >
                                    <input type="hidden"  name="depID" value="${noteDetail.noteID}"/>
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


<script type="text/javascript">
    function validateForm(form){
        var depID = form.depID.value;

        if(depID == "" || depID == null){
            return true;
        }


        var numPattern = /^\+?[1-9][0-9]*$/;
        if(!numPattern.test(depID)){
            alert("部门编号只能为数字");
            return false;
        }

        if (depID.length > 10) {
            alert("部门编号不能超过10个字符长度");
            return false;
        }

        return true;
    }
</script>






</body>
</html>







