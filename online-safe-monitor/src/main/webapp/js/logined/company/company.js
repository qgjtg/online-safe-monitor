// 部门管理页面
$(document).ready(function() {
//	// 重置iframe高度
//	window.parent.frameResize();
	// 初始化区域树
	openSelectTreeArea(zTreeOnCheckResult);

	//默认选择乌海市所有企业
	$("#page").attr("src", basePath + "logined/company/companyList.jsp?parentId=1");
	
});

function zTreeOnCheckResult(data) {
	var groupId = data.Id;
	if (groupId != 0) {
		$("#page").attr("src", basePath + "logined/company/companyList.jsp?parentId=" + groupId);
	}
}
