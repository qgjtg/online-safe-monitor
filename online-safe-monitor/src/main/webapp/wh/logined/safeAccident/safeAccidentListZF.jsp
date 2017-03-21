<%@ page language="java" import="java.util.*"  contentType="text/html; charset=UTF-8" pageEncoding="utf-8"  %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<jsp:include page="../../../common/taglibs.jsp"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<jsp:include page="../head.jsp" />
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>安全生产事故</title>
	<%-- <link rel="stylesheet" type="text/css" href="${ctx}wh/jquery-easyui-1.4.3/themes/default/easyui.css"/> --%>
	<%-- <link rel="stylesheet" type="text/css" href="${ctx}wh/jquery-easyui-1.4.3/themes/icon.css"/> --%>
	<%-- <link rel="stylesheet" type="text/css" href="${ctx}wh/css/style.css"/> --%>
	<%-- <link rel="stylesheet" type="text/css" href="${ctx}wh/plugins/datatable/skins/datatable_default.css" /> --%>
	<link href="${ctx}wh/plugins/datatable/skins/datatable_default.css?version=${version}" rel="stylesheet" type="text/css"/>
	<script type="text/javascript">
		var basePath = "${ctx}";
	</script>
	<%-- <script type="text/javascript" src="${ctx}wh/jquery-easyui-1.4.3/jquery.min.js"></script> --%>
	<%-- <script type="text/javascript" src="${ctx}wh/jquery-easyui-1.4.3/jquery.easyui.min.js"></script> --%>
	<%-- <script type="text/javascript" src="${ctx}wh/plugins/datatable/jquery.dataTables.min.js"></script> --%>
	<%-- <script type="text/javascript" src="${ctx}/wh/js/safeAccident/initType.js"></script> --%>
	<!-- 清除分页cookie start -->
	<script type="text/javascript" src="${ctx}js/common/jquery.cookie.js"></script>
	<!-- 清除分页cookie end -->
	<script type="text/javascript" src="${ctx}wh/js/safeAccident/downloadAttachment.js"></script>
	<script type="text/javascript" src="${ctx}wh/js/safeAccident/safeAccidentListZF.js"></script>
    
</head>
<body>
	<!-- 隐藏域：角色 -->
	<input type="hidden" id="whroletype" value='<s:property value="#session.whroletype"/>' />
	<!-- 隐藏域：企业ID -->
	<input type="hidden" id="group_id" value='<s:property value="#session.adminUser.groupId"/>' />
	
	<div class="bread-line">
		<label>当前位置：</label><a href="#">安全生产事故</a>&gt;&nbsp;安全生产事故列表
	</div>
	<div class="list">
		<div class="searchArea">
			<ul>
				<li><label>事故性质：</label><select id="accidentCharacter">
					<option value="0" >请选择</option>
					<s:iterator value="accidentCharacterTypemap" id="entry2">
						<option value="<s:property value="key"/>" ><s:property value="value"/></option>
					</s:iterator>
				</select></li>
				<s:if test="#session.whroletype == 1||#session.whroletype == 3">
				<li><label>企业名称：</label><select id="companName">
					<option value="0" >请选择</option>
					<s:iterator value="companyMap" id="entry1">
						<option value="<s:property value="key"/>" ><s:property value="value"/></option>
					</s:iterator>
				</select></li>
				<li><label>事故名称：</label><input type="text" class="formText" id="accidentName" maxlength="32" /></li>
				</s:if>
				<s:else>
				<li><label>事故简介：</label><input type="text" class="formText" id="occurredDescription" maxlength="32" /></li>
				</s:else>
				<li><input type="button" class="searchButton"  value="查询" /><s:if test="#session.whroletype == 1"><div class="fButton greenBtn"> <span class="add" onclick="addSafeAccident();">新增</span></div></s:if></li>
			</ul>
		</div>
		<table cellpadding="0" cellspacing="0" class="pretty dataTable" id="myTable">
			<thead>
				<tr>
					<th style="width:70px;">序号</th>
					<th>企业名称</th>
					<th>事故名称</th>
					<th>事故性质</th>
					<!-- <th>企业端是否可见</th> -->
					<th>事故报告</th>
					<th style="width:100px;">操作</th>
				</tr>
			</thead>
			<tbody>
<!-- 				<tr class="odd">
					<td>A01B01</td>
					<td>这是项目名称</td>
					<td>2015-06-10 15:26</td>
					<td class="longTxt">本部门生产装置储存场所</td>
					<td class="longTxt">这是检查目的内容</td>
					<td>通过</td>
					<td>王心卫</td>
					<td class="longTxt">需再次检查</td>
					<td class="right_bdr0"><a href="#">修改</a></td>
				</tr>
				<tr class="even">
					<td>A01B01</td>
					<td>这是项目名称</td>
					<td>2015-06-10 15:26</td>
					<td class="longTxt">本部门生产装置储存场所</td>
					<td class="longTxt">这是检查目的内容</td>
					<td>通过</td>
					<td>王心卫</td>
					<td class="longTxt">需再次检查</td>
					<td class="right_bdr0"><a href="#">修改</a></td>
				</tr> -->
			</tbody>
		</table>
		<%-- <div class="dataTables_info" id="Table_info">共 197 条数据 </div>
		<div class="dataTables_paginate paging_full_numbers" id="Table_paginate">
			<a class="previous paginate_button paginate_button_disabled" tabindex="0" id="Table_previous">«</a>
			<span><a class="paginate_active" tabindex="0">1</a><a class="paginate_button" tabindex="0">2</a><a class="paginate_button" tabindex="0">3</a><a class="paginate_button" tabindex="0">4</a><a class="paginate_button" tabindex="0">5</a></span>
			<a class="next paginate_button" tabindex="0" id="Table_next">»</a>
		</div> --%>
	</div>
	<div class="clear"></div>

</body>
</html>
