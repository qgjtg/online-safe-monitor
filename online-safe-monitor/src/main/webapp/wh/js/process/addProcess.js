var ue;
$(document).ready(function() {
	ue = UE.getEditor('contentInfo', {
		initialFrameWidth : "100%"
		});
	//初始化fileupload
	initfileupload();
	//保存按钮单击事件
	$("#save").bind("click", function(){
		addProcess();
	});
});

/*function initfileupload(){
	var fileupload = qytx.app.fileupload({
		id:"file_upload",
		hiddenID:"attachmentId",
		queueID:"queue",
		moduleName:"training",
		queueSizeLimit:"20"
	});
}*/
function initfileupload(){
	var fileupload = qytx.app.fileupload({
		id:"file_upload",
		hiddenID:"attachmentId1",
		queueID:"queue",
		moduleName:"process",
		queueSizeLimit:"10",
		//fileTypeExts:"*.doc;*.docx;*.pdf",
		callback:function(data){
			$("#attachmentId").val($("#attachmentId").val()+data.id+',');
			var html='<li><div><p>';
			html+=data.attachName;
			html+='</p><p>';
			html+='<a href="javascript:void(0);" name="'+data.id+'" class="deleteAttachment">删除</a></p>';
			html+='<p class="clear"></p>';
			html+='</div></li>';
			$("#attachmentList").html($("#attachmentList").html()+html);
		}
	});
	//动态绑定删除附件事件
	$(".deleteAttachment").live("click", function() {
		deleteAtta(this);
	});
}
/**
 * 附件删除
 * @param domAObj 传this
 */
function deleteAtta(domAObj,id) {
	//把li删除
	$(domAObj).parent().parent().parent().remove();
	//
	var str = $(domAObj).attr("name")+",";
	$("#attachmentId").val($("#attachmentId").val().replace(str,''));
}

/**
 * 保存添加
 */
function addProcess(){
	
	var content=ue.getContent();
	if (null == content || '' == content) {
		showObjError($("#contentInfoInput"), 'process.introduction_not_null');
		return;
	}else {
		hideError($("#contentInfoInput"));
	}
	if(!validator(document.getElementById("form1"))){
		return;
	}
	var title = $.trim($("#title").val());
	$(".formButton_green").attr("disabled", "disabled");
	var attachmentId = $.trim($("#attachmentId").val());
	if(attachmentId!=null &&attachmentId!=null){
		attachmentId = attachmentId.substring(0,attachmentId.length-1);
	}
	//保存
	$.ajax({
		url : basePath + "technologicalProcess/saveOrUpdateProcess.action",
		type : "post",
		dataType : 'json',
		data : {
			"info.title" : title,
			"info.introduction" : content,
			"info.fileIds" : attachmentId
		},
		success : function(data) {
			if (data == 1) {
				window.location.href = basePath+"wh/logined/process/processList.jsp"; 
			} else if (data == 0){
				artDialog.alert("新增失败！");
				$(".formButton_green").removeAttr("disabled");
			}
		}
		
	});
}

	
