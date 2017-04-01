$(document).ready(function(){
	
	//查询按钮绑定事件
	$(".searchButton").bind("click", function() {
		// 清除cookie中的分页信息
		$.removeTableCookie('SpryMedia_DataTables_myTable_dangerchemicalslist.jsp');
		getTableList();
		return false;
	});
	
	//回车事件
	$(document).keydown(function(event){
		var code=event.which;
		if (code == 13) {
			// 清除cookie中的分页信息
			$.removeTableCookie('SpryMedia_DataTables_myTable_dangerchemicalslist.jsp');
			getTableList();
			return false;
		}
	});
	
	//加载列表
	getTableList();
	
});


/**
 * 加载安全生产事故列表
 */
function getTableList(){
	//操作人角色
	var whroletype = $("#whroletype").val();
	
	//部门ID（企业端查询时传自已的部门ID，政府端查询时，传要查询的企业的部门ID）
	var groupId = 0;
	if(whroletype == 2){
		groupId = $("#group_id").val();
	}
	
	//物质名称
	var materialName = $.trim( $('#materialName').val() );
	
	$('#myTable').dataTable({
		"bDestroy" : true,
		"bProcessing" : true,
		"bStateSave" : true, // 状态保存
		'bServerSide' : true,
		'fnServerParams' : function(aoData) {

			aoData.push({
				"name" : "dangerChemicals.groupId",
				"value" : groupId
			}, {
				"name" : "dangerChemicals.materialName",
				"value" : materialName
			}, {
				"name" : "whroletype",
				"value" : whroletype
			});
		},
		"sAjaxSource" : basePath + "dangerchemicals/dangerchemicals_List_list.action",
		"sPaginationType" : "full_numbers",
		"bPaginate" : true, // 翻页功能
		"bLengthChange" : false, // 改变每页显示数据数量
		"bFilter" : false, // 过滤功能
		"bSort" : false, // 排序功能
		"bInfo" : true,// 页脚信息
		"bAutoWidth" : false,// 自动宽度
		"iDisplayLength" : 15, // 每页显示多少行
		"aoColumns" : [{
			"mDataProp" : 'no'
		}, {
			"mDataProp" : "materialName",
			"sClass" : "longTxt"
		}, {
			"mDataProp" : 'molecularFormula',
			"sClass" : "longTxt"
		}, {
			"mDataProp" : 'stabilityStr'
		}, {
			"mDataProp" : 'intrusiveWay'
		}, {
			"mDataProp" : 'appearance',
			"sClass" : "longTxt"
		}, {
			"mDataProp" : null
		}],
		"oLanguage" : {
			"sUrl" : basePath + "wh/plugins/datatable/cn.txt" // 中文包
		},
		"fnDrawCallback" : function(oSettings) {

			 $('#myTable tbody  tr td').each(function() {
  				this.setAttribute('title', $(this).text());
  			});
			
		},
		"fnInitComplete" : function() {
			// 重置iframe高度
//			window.parent.frameResize();
		},
		"aoColumnDefs" : [
			{
				"aTargets" : [6], //操作
				"fnRender" : function(oObj) {
					var vid = oObj.aData.vid;
					var html = '<a href="'+basePath+'dangerchemicals/dangerchemicalsToPage_findOne_dangerChemicalsDetail.action?dangerChemicalsInfo.vid='+vid+'">查看</a>';
					html += '<a href="'+basePath+'dangerchemicals/dangerchemicalsToPage_findOne_dangerChemicalsAdd.action?dangerChemicalsInfo.vid='+vid+'">修改</a>';
					html += '<a href="javascript:deleteById('+vid+');">删除</a>';
					return html;
				}
			}
		]
	});
}



/**
 * 删除操作
 */
function deleteById(id) {
	artDialog.confirm("你确定要删除吗？", function(){
		$.ajax({
			url : basePath + "dangerchemicals/dangerchemicals_Load_deleteOne.action",
			type : "post",
			dataType : 'text',
			data : {
				'dangerChemicalsInfo.vid' : id
			},
			success : function(data) {
				if(data == 1){
					//artDialog.alert("删除成功！", function(){
						getTableList();
					//});
				}else {
					//artDialog.alert("删除失败！", function(){
						getTableList();
					//});
				}
			}
			
		});
	});
}

/**
 * 新增操作
 */
function addOne() {
	//window.location.href = basePath + "wh/logined/dangerChemicals/dangerChemicalsAdd.jsp";
	window.location.href = basePath + "dangerchemicals/dangerchemicalsToPage_findOne_dangerChemicalsAdd.action?dangerChemicalsInfo.vid=";
}