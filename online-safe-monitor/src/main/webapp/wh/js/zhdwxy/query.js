$(document).ready(function(){
	getSelectCompany();
	
	// 保存按钮绑定事件
	$("#zhdwxysearch").bind("click", function() {
		getTableList();
		return false;
	});
	
	//回车事件
	$(document).keydown(function(event){
		var code=event.which;
		if (code == 13) {
			getTableList();
			return false;
		}
	});
	//加载列表
	getTableList();
});

function getSelectCompany(){
	$.ajax({
		url : basePath + "companywh/getCompanyNameList.action",
		type : "post",
		dataType : 'json',
		data : {
		},
		success : function(data) {
			if (data != null && data!="") {
				var list = eval(data);
				var html = '';
				for (var i = 0; i < list.length; i++) {
						var companyName = list[i].companyName;
						var groupId = list[i].groupId;
						html += '<option value="'+groupId+'"';
						html += '>'+companyName+"</option>";
					}
				}
				$("#companName").html($("#companName").html()+html);
			}
	});
}


function addNotify(){
	window.location.href=basePath+"wh/zhdwxy/add.jsp";
}

function detail(vid){
	window.location.href=basePath+"zhdwxy/queryDetail.action?vid="+vid
}

function update(vid){
	window.location.href=basePath+"zhdwxy/queryDetail.action?ac_flag=upd&vid="+vid;
}

function del(vid){
	art.dialog.confirm("确定要删除吗？",function(){
		
		$.ajax({
			url:basePath+"zhdwxy/del.action",
			type:"post",
			data:"vid="+vid,
			dataType:"json",
			cache:false,
			success:function(data){
				if(data=="0"){
					window.location.href=basePath+"wh/zhdwxy/query.jsp";
				}else{
					artDialog.alert("安全隐患排查信息删除失败，请重试！");
				}
			},error:function(){
				artDialog.alert("安全隐患排查信息删除失败，请重试！");
			}
		});
		
	});
}
function getTableList(){
	if(iszf == 2){//企业
		$('#myTable').dataTable({
			"bDestroy" : true,
			"bProcessing" : true,
			"bStateSave" : true, // 状态保存
			'bServerSide' : true,
			'fnServerParams' : function(aoData) {
			aoData.push(
				    {"name":"dangerSourcesName" ,"value":$.trim( $("#dangerSourcesName").val() )},
				    {"name":"groupId" ,"value":$("#companName").val()},
				    {"name":"grade" ,"value":$("#grade").val()},
				    {"name":"safetyMeasures" ,"value": $.trim( $("#safetyMeasures").val() )});
			},
			"sAjaxSource" : basePath + "zhdwxy/query.action",
			"sPaginationType" : "full_numbers",
			"bPaginate" : true, // 翻页功能
			"bLengthChange" : false, // 改变每页显示数据数量
			"bFilter" : false, // 过滤功能
			"bSort" : false, // 排序功能
			"bInfo" : true,// 页脚信息
			"bAutoWidth" : false,// 自动宽度
			"iDisplayLength" : 15, // 每页显示多少行
			"aoColumns" : [{
				"sTitle" : '序号',
				"mDataProp" : 'id'
			}, {
				"sTitle" : '危险源名称',
				"mDataProp" : "danger_sources_name",
				"sClass" : "longTxt"
			}, {
				"sTitle" : '企业名称',
				"mDataProp" : "companyName",
				"sClass" : "longTxt"
			}, {
				"sTitle" : '危险源分类',
				"mDataProp" : 'grade_name',
			}, {
				"sTitle" : '危险源级别',
				"mDataProp" : 'danger_grade_name',
			}, {
				"sTitle" : '评价机构',
				"mDataProp" : 'mechanism',
			},
			/*{
				"sTitle" : '评审时间',
				"mDataProp" : 'review_time'
			},{
				"sTitle" : '过期时间',
				"mDataProp" : 'review_end_time'
			},{
				"sTitle" : '发生事故时紧急措施',
				"mDataProp" : 'accident_measures',
					"sClass" : "longTxt"
			} ,
			{
				"sTitle" : '安全管理措施',
				"mDataProp" : 'safety_measures',
					"sClass" : "longTxt"
			} ,*/
			{
				"sTitle" : '操作',
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
			},
			"aoColumnDefs" : [
				{
					"aTargets" : [6], //操作
					"fnRender" : function(oObj) {
						var vid = oObj.aData.vid;
						var html = '<a href="javascript:void(0);" onclick="detail('+vid+');">查看</a> &nbsp;';
						if(iszf != 1 && iszf != 3){
							html = html.concat('<a href="javascript:void(0);"  onclick="update('+vid+');">修改</a> &nbsp;');
							html = html.concat('<a href="javascript:void(0);"  onclick="del('+vid+');">删除</a>');
						}
						return html;
					}
				}
			]
		});
	}else{
		$('#myTable').dataTable({
			"bDestroy" : true,
			"bProcessing" : true,
			"bStateSave" : true, // 状态保存
			'bServerSide' : true,
			'fnServerParams' : function(aoData) {
			aoData.push(
				    {"name":"dangerSourcesName" ,"value":$.trim( $("#dangerSourcesName").val() )},
				    {"name":"groupId" ,"value":$("#companName").val()},
				    {"name":"grade" ,"value":$("#grade").val()},
				    {"name":"safetyMeasures" ,"value": $.trim( $("#safetyMeasures").val() )});
			},
			"sAjaxSource" : basePath + "zhdwxy/query.action",
			"sPaginationType" : "full_numbers",
			"bPaginate" : true, // 翻页功能
			"bLengthChange" : false, // 改变每页显示数据数量
			"bFilter" : false, // 过滤功能
			"bSort" : false, // 排序功能
			"bInfo" : true,// 页脚信息
			"bAutoWidth" : false,// 自动宽度
			"iDisplayLength" : 15, // 每页显示多少行
			"aoColumns" : [{
				"sTitle" : '序号',
				"mDataProp" : 'id'
			}, {
				"sTitle" : '危险源名称',
				"mDataProp" : "danger_sources_name",
				"sClass" : "longTxt"
			}, {
				"sTitle" : '企业名称',
				"mDataProp" : "companyName",
				"sClass" : "longTxt"
			}, {
				"sTitle" : '危险源分类',
				"mDataProp" : 'grade_name',
			}, {
				"sTitle" : '危险源级别',
				"mDataProp" : 'danger_grade_name',
			}, {
				"sTitle" : '评价机构',
				"mDataProp" : 'mechanism',
			}
			/*{
				"sTitle" : '评审时间',
				"mDataProp" : 'review_time'
			},{
				"sTitle" : '过期时间',
				"mDataProp" : 'review_end_time'
			},{
				"sTitle" : '发生事故时紧急措施',
				"mDataProp" : 'accident_measures',
					"sClass" : "longTxt"
			} ,
			{
				"sTitle" : '安全管理措施',
				"mDataProp" : 'safety_measures',
					"sClass" : "longTxt"
			} */
			],
			"oLanguage" : {
				"sUrl" : basePath + "wh/plugins/datatable/cn.txt" // 中文包
			},
			"fnDrawCallback" : function(oSettings) {
				 $('#myTable tbody  tr td').each(function() {
	  				this.setAttribute('title', $(this).text());
	  			});
			},
			"fnInitComplete" : function() {
			},
			"aoColumnDefs" : [
				{
					"aTargets" : [1], //名称
					"fnRender" : function(oObj) {
						var vid = oObj.aData.vid;
						var danger_sources_name = oObj.aData.danger_sources_name;
						var html = '<a href="javascript:void(0);" onclick="detail('+vid+');">'+danger_sources_name+'</a>';
						return html;
					}
				}
			]
		});
	}
}