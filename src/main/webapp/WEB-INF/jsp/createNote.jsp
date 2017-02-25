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
    <title>新建笔记</title>

    <link rel="stylesheet" href="/resources/util/bootstrap/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="/resources/css/main.css"/>
</head>

<body>
<%--<%--%>
    <%--//获取部门列表--%>
    <%--List<Department> depList = null;--%>
    <%--try{--%>
        <%--depList = DaoFactory.getIDepartmentDaoInstance().getPerInDep(-1, "", "");--%>
    <%--}catch(Exception e){--%>
        <%--e.printStackTrace();--%>
    <%--}--%>

<%--%>--%>


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
                    <a href="">查询笔记</a>
                    <span>｜</span>
                    <a href="" class="active">新建笔记</a>
                </h2>

                <h4 class="page-header main-header">添加内容</h4>
                <div class="row main-input">
                    <form class=" form-horizontal input-form" action="/note/doCreateNote" method="post" onSubmit="return validateForm(this)">
                        <div class="col-md-6 form-group">
                            <label for="input1" class="col-sm-3 control-label">笔记主题</label>
                            <div class="col-sm-9">
                                <input type="text" name="theme" class="form-control" id="input1" placeholder="笔记主题">
                            </div>
                        </div>
                        <div class="col-md-6  form-group">
                            <label for="input2" class="col-sm-3 control-label">笔记类型</label>
                            <div class="col-sm-9">
                                <select name="type" class="form-control" id="input2">
                                    <option value=""></option>
                                    <option value="1">文本</option>
                                    <option value="2">图片</option>
                                    <option value="3">视频</option>
                                    <option value="4">音频</option>
                                </select>
                            </div>
                        </div>

                        <div class="col-md-6 form-group">
                            <label for="input3" class="col-sm-3 control-label">笔记标签</label>
                            <div class="col-sm-9">
                                <input type="text" name="label" class="form-control" id="input3" placeholder="笔记标签">
                            </div>
                        </div>


                        <div class="col-md-6  form-group">
                            <label for="input4" class="col-sm-3 control-label">创建时间</label>
                            <div class="col-sm-9">
                                <input type="text" name="time" class="form-control" id="input4" placeholder="创建时间">
                            </div>
                        </div>

                        <div class="col-md-6 form-group">
                            <label for="input5" class="col-sm-3 control-label">笔记内容</label>
                            <div class="col-sm-9">
                                <textarea name="content" class="form-control" id="input5" placeholder="笔记内容" style="resize:none;"></textarea>
                            </div>
                        </div>

                        <div class="col-md-6 form-group">

                            <label>  &nbsp</label>
                        </div>
                        <div class="col-md-6 form-group">

                            <label>  &nbsp</label>
                        </div>
                        <div class="col-md-6 form-group">

                            <label>  &nbsp</label>
                        </div>

                        <div class="col-md-6 pull-right form-group">
                            <div class="col-sm-6 col-sm-offset-6">
                                <input type="submit" value="创建" class="form-control btn btn-primary" >
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<%=
session.getAttribute("info")
%>



<script src="/resources/js/jquery.min.js"></script>
<script src="/resources/util/bootstrap/js/bootstrap.min.js"></script>
<script src="/resources/util/laydate/laydate.js"></script>


<script type="text/javascript">
    function validateForm(form){
        var theme = form.theme.value;
        var type = form.type.value;
        var content = form.content.value;
        var label = form.label.value;
        var time = form.time.value;



        //验证为空
        if (theme == null || theme == ""){
            alert("主题为空");
            return false;
        }else if (type == null || type == ""){
            alert("类型为空");
            return false;
        }else if (label == null || label == ""){
            alert("标签为空");
            return false;
        }else if (content == null || content == ""){
            alert("内容为空");
            return false;
        }

        var pattern = /((^((1[8-9]\d{2})|([2-9]\d{3}))([-\/\._])(10|12|0?[13578])([-\/\._])(3[01]|[12][0-9]|0?[1-9])$)|(^((1[8-9]\d{2})|([2-9]\d{3}))([-\/\._])(11|0?[469])([-\/\._])(30|[12][0-9]|0?[1-9])$)|(^((1[8-9]\d{2})|([2-9]\d{3}))([-\/\._])(0?2)([-\/\._])(2[0-8]|1[0-9]|0?[1-9])$)|(^([2468][048]00)([-\/\._])(0?2)([-\/\._])(29)$)|(^([3579][26]00)([-\/\._])(0?2)([-\/\._])(29)$)|(^([1][89][0][48])([-\/\._])(0?2)([-\/\._])(29)$)|(^([2-9][0-9][0][48])([-\/\._])(0?2)([-\/\._])(29)$)|(^([1][89][2468][048])([-\/\._])(0?2)([-\/\._])(29)$)|(^([2-9][0-9][2468][048])([-\/\._])(0?2)([-\/\._])(29)$)|(^([1][89][13579][26])([-\/\._])(0?2)([-\/\._])(29)$)|(^([2-9][0-9][13579][26])([-\/\._])(0?2)([-\/\._])(29)$))/ig;
        if(!pattern.test(time)){
            alert("日期格式错误");
            return false;
        }


        return true;
    }
</script>


<script>
    var options1 = {
        elem: '#input4',
        event: 'click',
        format: 'YYYY-MM-DD',
        istime: false,
        isclear: true,
        istoday: true,
        issure: false,
        festival: true,
        min: '1900-01-01 00:00:00', //最小日期
        max: '2099-12-31 23:59:59', //最大日期
        fixed: false, //是否固定在可视区域
        zIndex: 99999999
    };
    laydate(options1);
    laydate.skin("danlan");


</script>

</body>
</html>







