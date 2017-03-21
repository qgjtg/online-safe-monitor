<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../../../common/flatHead.jsp"/>
<link type="text/css" href="${ctx }logined/customJPDL/myflow/lib/jquery-ui-1.8.4.custom/css/smoothness/jquery-ui-1.8.4.custom.css"  rel="stylesheet" />
<link href="${ctx }flat/css/reset.css" rel="stylesheet" type="text/css" />
<link href="${ctx }flat/plugins/datatable/skins/datatable_default.css" rel="stylesheet" type="text/css" />
<link href="${ctx }flat/plugins/form/skins/form_default.css" rel="stylesheet" type="text/css" />
<link href="${ctx }flat/css/handle.css" rel="stylesheet" type="text/css" />
<link href="${ctx }flat/plugins/smallTab/skins/smallTab_default.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript">
	var flag = 0;
</script>
<style type="text/css">
#myflow{
background-image: url(<%=request.getContextPath()%>/logined/customJPDL/myflow/img/bg.png);	
}
.node {
	width : 70px;
	text-align : center;
	vertical-align:middle;
	border: 1px solid #fff;
}

.mover{
	border: 1px solid #ddd;
	background-color: #ddd;
}
.selected{
	background-color: #ddd;
}
.state{}

#myflow_props table{
	
}
#myflow_props th {
	letter-spacing: 2px;
	text-align: left;
	padding: 6px;
	background: #ddd;
} 
#myflow_props td {
	background: #fff;
	padding: 6px;
} 

#pointer {
	background-repeat:no-repeat;
	background-position:center;
	
}
#path {
	background-repeat:no-repeat;
	background-position:center;
	
}
#task{
	background-repeat:no-repeat;
	background-position:center;
	
}
#state{
	background-repeat:no-repeat;
	background-position:center;
	
}
</style>
</head>
<body >

  <div class="smallTab">
	  <div class="tab">
	   <ul>
				<li id="viewTab"><a href="#">图形视图</a> </li>
				<li class="current" id="listTab"><a href="#">列表视图</a> </li>
		</ul>	
	  </div>
</div>

<div class="formPage" id="list">
    <div class="formbg">
        <div class="big_title">管理流程步骤(流程名称：${processAttribute.processName})</div>
        <div class="content_form">
          <p class="gray_9 pt5">请设定好各步骤的可写字段和经办权限（此经办权限是经办人员、经办部门、经办角色的合集）</p>
				<table cellpadding="0" cellspacing="0"  class="pretty dataTable">
						<thead>
								<tr>
										<th class="num">序号</th>
										<th width="180px">名称</th>
										<th>说明</th>
										<th width="200px">编辑该步骤的各项属性</th>		
								</tr>
						</thead>
						<tbody>
								<c:forEach items="${processAttribute.nodeSet}" var="node" varStatus="sta">
									<c:if test="${(node.nodeType=='task') || (node.nodeType=='mutilSign') || (node.nodeType=='start')}">
										<tr class=<c:if test="${sta.index%2 ==0}">odd</c:if><c:if test="${sta.index%2 ==1}">even</c:if> >
											<td><script>document.write(++flag);</script></td>
											<td class="data_l"  width="180px">${node.nodeName}</td>
											<td class="longTxt">${node.descri}</td>
											<td class="oper" >
                                                <a href="<%=request.getContextPath()%>/workflow/nodeManager!candidate.action?nodeId=${node.id}">经办权限</a>
                                                <a href="<%=request.getContextPath()%>/workflow/nodeManager!nodeProperties.action?nodeId=${node.id}">节点属性</a>
                                            </td>
										</tr>
									</c:if>
								</c:forEach>
						</tbody>
				</table>

   </div>
      </div>
      <div class="buttonArea"> 
			<input type="button"  type="submit" id="sure" class="formButton_green" value="确定" hidefocus=""/>
        </div>
</div>
<input type="hidden" id="jsonData" value="${processAttribute.procsssDefinByJSON}"/>
<input type="hidden" id="proName" value="<%=request.getContextPath()%>"/>
<div id="myflow" style="display:none">
</div>
</body>
<script type="text/javascript" src="<%=request.getContextPath() %>/logined/workflow/jsp/myflow/lib/raphael-min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath() %>/logined/workflow/jsp/myflow/lib/jquery-ui-1.8.4.custom/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath() %>/logined/workflow/jsp/myflow/lib/jquery-ui-1.8.4.custom/js/jquery-ui-1.8.4.custom.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/logined/workflow/jsp/myflow/myflow.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/logined/workflow/jsp/myflow/myflow.jpdl4.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/logined/workflow/jsp/myflow/myflow.editors.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/logined/workflow/js/view.js"></script>
<script type="text/javascript">
$("#listTab").click(function(){
		$(this).addClass("current");
		$("#viewTab").removeClass("current");
		$("#list").css("display","");
		$("#myflow").css("display","none");
	});
	$("#viewTab").click(function(){
		$(this).addClass("current");
		$("#listTab").removeClass("current");
		$("#list").css("display","none");
		$("#myflow").css("display","");
	});
	$("#sure").click(function(){
        window.location = $("#proName").val()+"/workflow/process!editProcess.action?processAttributeId=${processAttribute.id}";
	});
</script>
</html>