<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@ page import="com.neusoft.person_management.vo.*, com.neusoft.person_management.template.*" %>
<%@ page import="com.neusoft.person_management.factory.*" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <meta charset="gbk">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>��������</title>

    <link rel="stylesheet" href="/PersonManagement/util/bootstrap/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="/PersonManagement/css/main.css"/>
</head>

<body>
<%
    //��ȡ�����б�
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
                <!-- ����Ӧ��nav������ -->
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <p class="navbar-brand" >���¹���ϵͳ</p>
            </div>
            <div id="navbar" class="navbar-collapse collapse">
                <ul class="nav navbar-nav navbar-left">
                    <li class="active"><a href="/PersonManagement/jsp/department/depSelect.jsp"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>&nbsp;���Ÿ�λ</a></li>
                    <li><a href="/PersonManagement/jsp/newEmp/newEmp.jsp"><span class="glyphicon glyphicon-user" aria-hidden="true"></span>&nbsp;��Ա����</a></li>
                    <li><a href="/PersonManagement/jsp/empLang/empInfoIndex.jsp"><span class="glyphicon glyphicon-info-sign" aria-hidden="true"></span>&nbsp;��Ա��Ϣ</a></li>
                    <li><a href="/PersonManagement/jsp/report/showReports.jsp"><span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span>&nbsp;�������</a></li>
                </ul>
            </div>
        </div>
    </nav>
    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-3 col-md-2 sidebar">
                <ul class="nav nav-sidebar">
                    <li class="active"><a href="/PersonManagement/jsp/department/depSelect.jsp">���Ź���</a></li>
                    <li><a href="/PersonManagement/jsp/position/posSelect.jsp">��λ����</a></li>
                </ul>
            </div>
            <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
                <h2 class="page-header">
                    <a href="/PersonManagement/jsp/department/depSelect.jsp">��ѯ����</a>
                    <span>��</span>
                    <a href="/PersonManagement/jsp/department/depCreate.jsp"  class="active">��������</a>
                </h2>

                <h4 class="page-header main-header">�������</h4>
                <div class="row main-input">
                    <form class=" form-horizontal input-form" action="/PersonManagement/DepCreateServlet" method="post" onSubmit="return validateForm(this)">
                        <div class="col-md-6 form-group">
                            <label for="input1" class="col-sm-3 control-label">��������</label>
                            <div class="col-sm-9">
                                <input type="text" name="depName" class="form-control" id="input1" placeholder="��������">
                            </div>
                        </div>
                        <div class="col-md-6  form-group">
                            <label for="input2" class="col-sm-3 control-label">��������</label>
                            <div class="col-sm-9">
                                <select name="depType" class="form-control" id="input2">
                                    <option value="�г���">�г���</option>
                                    <option value="�з���">�з���</option>
                                    <option value="������Դ��">������Դ��</option>
                                    <option value="���Բ�">���Բ�</option>
                                </select>
                            </div>
                        </div>

                        <div class="col-md-6 form-group">
                            <label for="input3" class="col-sm-3 control-label">���ŵ绰</label>
                            <div class="col-sm-9">
                                <input type="text" name="depPhone" class="form-control" id="input3" placeholder="���ŵ绰">
                            </div>
                        </div>
                        <div class="col-md-6 form-group">
                            <label for="input4" class="col-sm-3 control-label">���Ǵ���</label>
                            <div class="col-sm-9">
                                <input type="text" name="depFax" class="form-control" id="input4" placeholder="���Ŵ���">
                            </div>
                        </div>

                        <div class="col-md-6  form-group">
                            <label for="input5" class="col-sm-3 control-label">����ʱ��</label>
                            <div class="col-sm-9">
                                <input type="text" name="createDate" class="form-control laydate-icon" id="input5" placeholder="��ʼʱ��">
                            </div>
                        </div>
                        <div class="col-md-6 form-group">
                            <label for="input6" class="col-sm-3 control-label">�ϼ�����</label>
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
                            <label for="input7" class="col-sm-3 control-label">��������</label>
                            <div class="col-sm-9">
                                <textarea name="describe" class="form-control" id="input7" placeholder="��������" style="resize:none;"></textarea>
                            </div>
                        </div>
                        <div class="col-md-6 pull-right form-group">
                            <div class="col-sm-6 col-sm-offset-6">
                                <input type="submit" value="����" class="form-control btn btn-primary" >
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


        //��֤Ϊ��
        if (depName == null || depName == ""){
            alert("��������Ϊ��");
            return false;
        }else if (depType == null || depType == ""){
            alert("��������Ϊ��");
            return false;
        }else if (depPhone == null || depPhone == ""){
            alert("���ŵ绰Ϊ��");
            return false;
        }else if (depFax == null || depFax == ""){
            alert("����Ϊ��");
            return false;
        }else if(depName.length>20){
            alert("���������ܳ���10���ֽ�");
            return false;
        }

        //�ϼ�����Ϊ��ʱ��servlet�����Զ���ֵΪ-1
        //���ű��Ϊ-1�Ĳ���Ϊ���ݿ����ԭʼ���ţ������в��ŵ������ϼ�����
        if (preDep == null || preDep == ""){
            return true;
        }

        var numPattern = /^\+?[1-9][0-9]*$/;
        if(!numPattern.test(preDep)){
            alert("�ϼ����ű��ֻ��Ϊ����");
            return false;
        }



        //��֤��ʽ
        var pattern = /((^((1[8-9]\d{2})|([2-9]\d{3}))([-\/\._])(10|12|0?[13578])([-\/\._])(3[01]|[12][0-9]|0?[1-9])$)|(^((1[8-9]\d{2})|([2-9]\d{3}))([-\/\._])(11|0?[469])([-\/\._])(30|[12][0-9]|0?[1-9])$)|(^((1[8-9]\d{2})|([2-9]\d{3}))([-\/\._])(0?2)([-\/\._])(2[0-8]|1[0-9]|0?[1-9])$)|(^([2468][048]00)([-\/\._])(0?2)([-\/\._])(29)$)|(^([3579][26]00)([-\/\._])(0?2)([-\/\._])(29)$)|(^([1][89][0][48])([-\/\._])(0?2)([-\/\._])(29)$)|(^([2-9][0-9][0][48])([-\/\._])(0?2)([-\/\._])(29)$)|(^([1][89][2468][048])([-\/\._])(0?2)([-\/\._])(29)$)|(^([2-9][0-9][2468][048])([-\/\._])(0?2)([-\/\._])(29)$)|(^([1][89][13579][26])([-\/\._])(0?2)([-\/\._])(29)$)|(^([2-9][0-9][13579][26])([-\/\._])(0?2)([-\/\._])(29)$))/ig;
        if(!pattern.test(createDate)){
            alert("���ڸ�ʽ����");
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
        min: '1900-01-01 00:00:00', //��С����
        max: '2099-12-31 23:59:59', //�������
        fixed: false, //�Ƿ�̶��ڿ�������
        zIndex: 99999999
    };
    laydate(options1);
    laydate.skin("danlan");


</script>

</body>
</html>







