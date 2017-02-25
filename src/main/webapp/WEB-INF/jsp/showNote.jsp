<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@ page import="com.neusoft.person_management.vo.*, com.neusoft.person_management.template.*" %>
<%@ page import="com.neusoft.person_management.factory.*" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <meta charset="gbk">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>创建部门</title>

    <link rel="stylesheet" href="/PersonManagement/util/bootstrap/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="/PersonManagement/css/main.css"/>
</head>

<body>
<%
    //获取部门列表
    List<Department> depList = null;
    try{
        depList = DaoFactory.getIDepartmentDaoInstance().getPerInDep(-1, "", "");
    }catch(Exception e){
        e.printStackTrace();
    }

%>


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
                <p class="navbar-brand" >人事管理系统</p>
            </div>
            <div id="navbar" class="navbar-collapse collapse">
                <ul class="nav navbar-nav navbar-left">
                    <li class="active"><a href="/PersonManagement/jsp/department/depSelect.jsp"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>&nbsp;部门岗位</a></li>
                    <li><a href="/PersonManagement/jsp/newEmp/newEmp.jsp"><span class="glyphicon glyphicon-user" aria-hidden="true"></span>&nbsp;人员管理</a></li>
                    <li><a href="/PersonManagement/jsp/empLang/empInfoIndex.jsp"><span class="glyphicon glyphicon-info-sign" aria-hidden="true"></span>&nbsp;人员信息</a></li>
                    <li><a href="/PersonManagement/jsp/report/showReports.jsp"><span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span>&nbsp;报表管理</a></li>
                </ul>
            </div>
        </div>
    </nav>
    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-3 col-md-2 sidebar">
                <ul class="nav nav-sidebar">
                    <li class="active"><a href="/PersonManagement/jsp/department/depSelect.jsp">部门管理</a></li>
                    <li><a href="/PersonManagement/jsp/position/posSelect.jsp">岗位管理</a></li>
                </ul>
            </div>
            <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
                <h2 class="page-header">
                    <a href="/PersonManagement/jsp/department/depSelect.jsp">查询部门</a>
                    <span>｜</span>
                    <a href="/PersonManagement/jsp/department/depCreate.jsp"  class="active">创建部门</a>
                </h2>

                <h4 class="page-header main-header">添加内容</h4>
                <div class="row main-input">
                    <form class=" form-horizontal input-form" action="/PersonManagement/DepCreateServlet" method="post" onSubmit="return validateForm(this)">
                        <div class="col-md-6 form-group">
                            <label for="input1" class="col-sm-3 control-label">部门名称</label>
                            <div class="col-sm-9">
                                <input type="text" name="depName" class="form-control" id="input1" placeholder="部门名称">
                            </div>
                        </div>
                        <div class="col-md-6  form-group">
                            <label for="input2" class="col-sm-3 control-label">部门类型</label>
                            <div class="col-sm-9">
                                <select name="depType" class="form-control" id="input2">
                                    <option value="市场部">市场部</option>
                                    <option value="研发部">研发部</option>
                                    <option value="人力资源部">人力资源部</option>
                                    <option value="测试部">测试部</option>
                                </select>
                            </div>
                        </div>

                        <div class="col-md-6 form-group">
                            <label for="input3" class="col-sm-3 control-label">部门电话</label>
                            <div class="col-sm-9">
                                <input type="text" name="depPhone" class="form-control" id="input3" placeholder="部门电话">
                            </div>
                        </div>
                        <div class="col-md-6 form-group">
                            <label for="input4" class="col-sm-3 control-label">部们传真</label>
                            <div class="col-sm-9">
                                <input type="text" name="depFax" class="form-control" id="input4" placeholder="部门传真">
                            </div>
                        </div>

                        <div class="col-md-6  form-group">
                            <label for="input5" class="col-sm-3 control-label">创建时间</label>
                            <div class="col-sm-9">
                                <input type="text" name="createDate" class="form-control laydate-icon" id="input5" placeholder="开始时间">
                            </div>
                        </div>
                        <div class="col-md-6 form-group">
                            <label for="input6" class="col-sm-3 control-label">上级部门</label>
                            <div class="col-sm-9">
                                <select class="form-control" id="input-nextdep"  name="preDep">
                                    <option></option>
                                    <%
                                        for (Department dep : depList) {
                                    %>
                                    <option value="<%= dep.getDepID() %>"><%= dep.getDepName() %></option>
                                    <%
                                        }
                                    %>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-6 form-group">
                            <label for="input7" class="col-sm-3 control-label">部门描述</label>
                            <div class="col-sm-9">
                                <textarea name="describe" class="form-control" id="input7" placeholder="部门描述" style="resize:none;"></textarea>
                            </div>
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



<script src="/PersonManagement/js/jquery.min.js"></script>
<script src="/PersonManagement/util/bootstrap/js/bootstrap.min.js"></script>
<script src="/PersonManagement/util/laydate/laydate.js"></script>


<script type="text/javascript">
    function validateForm(form){
        var depName = form.depName.value;
        var depType = form.depType.value;
        var depPhone = form.depPhone.value;
        var depFax = form.depFax.value;
        var createDate = form.createDate.value;
        var preDep = form.preDep.value;
        var describe = form.describe.value;


        //验证为空
        if (depName == null || depName == ""){
            alert("部门名称为空");
            return false;
        }else if (depType == null || depType == ""){
            alert("部门类型为空");
            return false;
        }else if (depPhone == null || depPhone == ""){
            alert("部门电话为空");
            return false;
        }else if (depFax == null || depFax == ""){
            alert("传真为空");
            return false;
        }else if(depName.length>20){
            alert("部门名不能超过10个字节");
            return false;
        }

        //上级部门为空时，servlet控制自动赋值为-1
        //部门编号为-1的部门为数据库的最原始部门，是所有部门的虚拟上级部门
        if (preDep == null || preDep == ""){
            return true;
        }

        var numPattern = /^\+?[1-9][0-9]*$/;
        if(!numPattern.test(preDep)){
            alert("上级部门编号只能为数字");
            return false;
        }



        //验证格式
        var pattern = /((^((1[8-9]\d{2})|([2-9]\d{3}))([-\/\._])(10|12|0?[13578])([-\/\._])(3[01]|[12][0-9]|0?[1-9])$)|(^((1[8-9]\d{2})|([2-9]\d{3}))([-\/\._])(11|0?[469])([-\/\._])(30|[12][0-9]|0?[1-9])$)|(^((1[8-9]\d{2})|([2-9]\d{3}))([-\/\._])(0?2)([-\/\._])(2[0-8]|1[0-9]|0?[1-9])$)|(^([2468][048]00)([-\/\._])(0?2)([-\/\._])(29)$)|(^([3579][26]00)([-\/\._])(0?2)([-\/\._])(29)$)|(^([1][89][0][48])([-\/\._])(0?2)([-\/\._])(29)$)|(^([2-9][0-9][0][48])([-\/\._])(0?2)([-\/\._])(29)$)|(^([1][89][2468][048])([-\/\._])(0?2)([-\/\._])(29)$)|(^([2-9][0-9][2468][048])([-\/\._])(0?2)([-\/\._])(29)$)|(^([1][89][13579][26])([-\/\._])(0?2)([-\/\._])(29)$)|(^([2-9][0-9][13579][26])([-\/\._])(0?2)([-\/\._])(29)$))/ig;
        if(!pattern.test(createDate)){
            alert("日期格式错误");
            return false;
        }

        return true;
    }
</script>


<script>
    var options1 = {
        elem: '#input5',
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







