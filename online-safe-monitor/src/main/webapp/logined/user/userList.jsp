<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>单位通讯录</title>
<jsp:include page="../../common/flatHead.jsp" />
<link href="${ctx}flat/css/reset.css" rel="stylesheet" type="text/css" />
<link href="${ctx}flat/css/main.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="${ctx}flat/plugins/tree/skins/tree_default.css" type="text/css"/>
<link href="${ctx}flat/plugins/datatable/skins/datatable_default.css" rel="stylesheet" type="text/css" />
<link href="${ctx}flat/plugins/Accormenus/skins/Accormenus_default.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${ctx}plugins/tree/ztree/jquery.ztree.all-3.5.min.js"></script>
<script type="text/javascript" src="${ctx}flat/plugins/datatable/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="${ctx}js/placeholder.js"></script>
<script type="text/javascript" src="${ctx}flat/js/base.js"></script>
<script type="text/javascript" src="${ctx}flat/plugins/tree/skins/jquery.ztree.all-3.2.min.js"></script>
<script type="text/javascript" src="${ctx}flat/plugins/datatable/selecedForDatatablePagination.js"></script>
<script type="text/javascript">
    //点击导入
    jQuery(document).ready(function($){
	    $("#importUser").click(function(){
	        uploadUser();
	        return false;
	    });
    });
</script>

<script type="text/javascript" src="${ctx}js/logined/user/userList.js?version=${version}"></script>
<script type="text/javascript" src="${ctx}js/common/validate_form.js?version=${version}"></script>
<script type="text/javascript" src="${ctx}js/common/showError.js?version=${version}"></script>
<script type="text/javascript" src="${ctx}js/logined/user/importuserFather.js?version=${version}"></script>

<script type="text/javascript" src="${ctx}js/common/ajaxfileupload.js?version=${version}"></script>

<script type="text/javascript" src="${ctx}plugins/My97DatePicker/WdatePicker.js?version=${version}"></script>

</head>
<body>
	<input type="hidden" id="clickTree" value="${param.clickTree }"/>
  <form id="userSelectFrom">
    <input type="hidden" id="type" value="${param.type}" />
	<input name="groupId" type="hidden" id="groupId" value="${param.groupId}" />
	<input type="hidden" id="loginName" value="${param.loginName}" />
	<input type="hidden" id="alterName" value="${param.alterName}" />
	<input name="roleId" type="hidden" id="roleId" value="${param.roleId}" />
	<input  name="loginOrder" type="hidden" id="loginOrder" value="${param.loginOrder}" />	 
  </form>

  <div class="list">
    <div class="searchArea">
      <table cellspacing="0" cellpadding="0">
        <tbody>
          <tr>
            <td class="right"><label>性别：</label>
              <select name="sex" id="sex">
                <option value="">全部</option>
                <option value="1">男</option>
                <option value="0">女</option>
              </select>
              <label>关键字：</label>
              <span class="position:relative;">
              <input type="text"  placeholder="姓名/手机号码" maxlength="30" class="formText searchkey" id="searchName" name="searchName"/>
              </span>
              <input id="searchButton" type="button" value="查询" class="searchButton"/></td>
           <c:if test="${param.type!='view'}">
            <td style="width:388px;">
               <div class="fButton greenBtn" id="userAdd" ><span class="add">新增</span> </div>
              <div class="fButton orangeBtn" id="userDelete"> <span class="delete">删除</span> </div>
	      </c:if>
         <c:if test="${param.type=='view'}">
	      <td style="width:194px">           
         </c:if>
          <div class="fButton greenBtn" id="importUser"> <span class="import">导入</span> </div>
          <div class="fButton blueBtn" id="userExport"> <span class="export">导出</span> </div>
          </td>
          </tr>
        </tbody>
      </table>
    </div>
    <table cellpadding="0" cellspacing="0"  class="pretty dataTable" id="userTable">
     
    </table>
  </div>
<script>funPlaceholder(document.getElementById("searchName"));</script>
</body>
</html>
