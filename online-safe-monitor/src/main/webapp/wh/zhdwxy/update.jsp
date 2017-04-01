<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/ninclude/import.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>重大危险源</title> 
	<%@include file="/ninclude/title.jsp"%>
	<link href="${ctx}wh/plugins/datatable/skins/datatable_default.css?version=${version}" rel="stylesheet" type="text/css"/>
	<script type="text/javascript" src="${ctx}wh/js/js_lang_cn.js"></script>
	<!-- 清除分页cookie start -->
	<script type="text/javascript" src="${ctx}js/common/jquery.cookie.js"></script>
	<!-- 清除分页cookie end -->
	<script type="text/javascript" src="${ctx}wh/js/zhdwxy/update.js"></script>
</head>
<body>
	<!-- 隐藏域：角色（1、政府； 2、企业） -->
	<input type="hidden" id="whroletype" value="<s:property value="#session.whroletype"/>" />
	<!-- 隐藏域：企业ID -->
	<input type="hidden" id="group_id" value='<s:property value="#session.adminUser.groupId"/>' />
	
	<div class="bread-line">
	    <label>当前位置：</label><a href="javascript:void(0);">首页</a>&gt;<a href="javascript:void(0);">重大危险源</a>&gt;&nbsp;重大危险源修改
	</div>
    <div class="formPage">
		<div class="formbg">
			<div class="tabBox">
				<ul>
					<li class="on"><a href="#">重大危险源基本信息</a></li>
					<li><a href="#">危化品信息</a></li>
				</ul>
			</div>
			<div class="tabContent" style="display:block;">
				<div class="formbg">
			        <!-- <div class="big_title">更新档案</div> -->
			        <div class="content_form">
						<form name="addForm" id="addForm" method="post">
			                <table width="100%" cellspacing="0" cellpadding="0" border="0" class="inputTable">
			                    <tbody>
			                    	<tr>
			                            <th><em class="requireField">*</em>填报单位名称：</th>
			                            <td>${sessionScope.companyName}</td>
			                            <th>评价机构：</th>
			                            <td><input type="text" id="mechanism" maxlength="32" class="formText" name="mechanism" value="${whDangerSources.mechanism }"/></td>
			                        </tr>
			                        <tr>
			                            <th><em class="requireField">*</em>重大危险源名称：</th>
			                            <td><input type="text" id="dangerSourcesName" maxlength="32" errmsg="zhdwxy.zhdwxy_name_not_null|zhdwxy.zhdwxy_name_valid" class="formText" name="dangerSourcesName" value="${whDangerSources.danger_sources_name }"/></td>
			                        	<th><em class="requireField">*</em>重大危险源级别：</th>
			                            <td>
			                            	<select valid="required" errmsg="zhdwxy.zhdwxy_danger_grade_valid"  id="danger_grade"><option value="">请选择</option></select>
			                            </td>
			                        </tr>
			                        <tr>
			                            <th>重大危险源投用时间：</th>
			                            <td><input type="text" value="<fmt:formatDate value="${whDangerSources.use_time }" type="both" pattern="yyyy-MM-dd"/>" onfocus="WdatePicker({skin:'default',dateFmt:'yyyy-MM-dd'})" class="formText Wdate" id="use_time"  /></td>
			                        	<th>R值：</th>
			                            <td>
			                            	<input type="text" id="r_value" maxlength="32" class="formText" name="r_value" value="${whDangerSources.r_value }"/>
			                            </td>
			                        </tr>
			                          <tr>
			                            <th><em class="requireField">*</em>重大危险源所在地址：</th>
			                            <td><input type="text" id="address" maxlength="64" valid="required" errmsg="zhdwxy.zhdwxy_address_not_null"  class="formText" name="address" value="${whDangerSources.address }"/></td>
			                        	<th>危险源分类</th>
                        				<td><select class="formSelect" name="grade" id="grade"><option value="0" <s:if test="whDangerSources.grade==0">selected="selected"</s:if>>一般</option><option value="1" <s:if test="whDangerSources.grade==1">selected="selected"</s:if>>重大</option></select></td>
			                        </tr>
			                        <%-- <tr>
			                           <th>评审时间：</th>
			                            <td><input type="text" onblur="putTime();" value="<fmt:formatDate value="${whDangerSources.review_time }" type="both" pattern="yyyy-MM-dd"/>" onfocus="WdatePicker({skin:'default',dateFmt:'yyyy-MM-dd'})" class="formText Wdate" id="review_time"  /></td>
			                           <th>过期时间（3年）：</th>
			                            <td><input type="text"   value="<fmt:formatDate value="${whDangerSources.review_end_time }" type="both" pattern="yyyy-MM-dd"/>" onfocus="WdatePicker({skin:'default',dateFmt:'yyyy-MM-dd'})" class="formText Wdate" id="review_end_time"  /></td>
			                        </tr> --%>
			                       
			                       <tr>
			                            <th><em class="requireField">*</em>单元内主要装置、设施及生产（存储）规模：</th>
			                            <td colspan="3"><textarea valid="required" maxlength="256" errmsg="zhdwxy.zhdwxy_product_scale_not_null" class="formTextarea" rows="3" id="product_scale" value="">${whDangerSources.product_scale }</textarea></td>
			                        </tr>
			                        
			                         <%-- <tr>
			                            <th>安全管理措施：</th>
			                            <td colspan="3"><textarea valid="required" maxlength="256" errmsg="zhdwxy.zhdwxy_safety_measures_not_null" class="formTextarea" rows="3" id="safety_measures" value="">${whDangerSources.safety_measures }</textarea></td>
			                        </tr> --%>
			                        
			                        <tr>
			                            <th>是否位于化工（工业）园区:</th>
			                            <td colspan="3"><textarea maxlength="256" id="is_park" class="formTextarea" rows="1" value="">${whDangerSources.is_park }</textarea></td>
		                       		</tr>
		                       		
			                         <tr>
			                            <th><em class="requireField">*</em>重大危险源与周边重点防护目标最近距离情况（m）:</th>
			                            <td colspan="3"><input type="text" valid="required" maxlength="5" errmsg="zhdwxy.zhdwxy_distance_not_null" id="distance" class="formText" value="${whDangerSources.distance }"/></td>
			                       </tr>
			                       <tr>
			                            <th>厂区边界外500米范围内人数估算值：</th>
			                            <td colspan="3"><textarea maxlength="256" class="formTextarea" rows="1" id="men" value="">${whDangerSources.men }</textarea></td>
			                        </tr>
			                       <tr>
			                            <th><em class="requireField">*</em>近三年内危险化学品事故情况：</th>
			                            <td colspan="3"><textarea valid="required" maxlength="256" errmsg="zhdwxy.zhdwxy_three_year_accident_not_null" class="formTextarea" rows="1" id="three_year_accident" value="">${whDangerSources.three_year_accident }</textarea></td>
			                        </tr>
			                        <%-- <tr>
			                            <th>紧急措施：</th>
			                            <td colspan="3"><textarea valid="required" maxlength="256" errmsg="zhdwxy.zhdwxy_accident_measures_not_null"  class="formTextarea" rows="1" id="accident_measures" value="">${whDangerSources.accident_measures }</textarea></td>
			                        </tr> --%>
			                    </tbody>
			                </table>
						</form>
			        </div>
				</div>
				<div class="buttonArea"> 
					<input type="button" class="formButton_green" value="确定" id="save"/>
					<input type="button" value="取消" class="formButton_grey"  onclick="javascript:history.go(-1);"/>
				</div>
			</div>
			<div class="tabContent">
				<div class="list">
					<div class="searchArea">
						<ul>
							<li><label>危化品名称：</label><input type="text" id="dangerGoodName" class="formText"></li>
							<li><label>危险性类别：<select id="dictId">
								<option value="">请选择</option>
								<s:iterator value="dangerObjTypeMap" id="entry">
									<option value="<s:property value="key"/>"><s:property value="value"/></option>
								</s:iterator>
								</select></li>
							<li><input type="button" class="searchButton" value="查询" class="formText">
							<c:if test="${sessionScope.whroletype!=1 && sessionScope.whroletype!=3}">
							<div class="fButton greenBtn"> <span class="add" onclick="addOne();">新增</span></div>
							</c:if>
							</li>
						</ul>                        
					</div>
					<table cellpadding="0" cellspacing="0"  class="pretty dataTable" id="myTable">
						<thead>
							<tr>
								<th style="width:70px;">序号</th>
								<th>危化品名称</th>
								<th style="width:80px;">危险性类别</th>
								<th style="width:100px;">UN编号</th>
								<th style="width:100px;">生产用途</th>
								<th>生产工艺</th>
								<th>单元内存量</th>
								<th style="width:135px;">操作</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
					</table>
				</div>
		   </div>
		</div>
	</div>
	<div class="clear"></div>
</body>
</html>

<script type="text/javascript" >
	var _name="${whDangerSources.danger_grade}";
	var _vid = "${whDangerSources.vid}";
</script>