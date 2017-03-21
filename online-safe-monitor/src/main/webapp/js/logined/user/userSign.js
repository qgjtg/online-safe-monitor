jQuery(document).ready(function($){
    var flag = $("#userSign").val();
    showSign(flag);

    /*
     *点击签章类型，显示不同操作
     */
    $("#userSign").change(function(){
        var flag = $(this).val();
        showSign(flag);
    });

    function showSign(flag){
        if(flag == 0 ){
            $("#signContent").hide();
        }else if(flag == 1){
            $("#signContent").hide();
        }else if(flag == 2){
            $("#signContent").show();
        }
    }


	/*
	 *初始化个人印章的选择
	 */
	(function(){
		var imgUrl = $("#imgSignUrl").val();
		if(imgUrl){
			$("#imgContent").attr("src",basePath+"filemanager/prevViewByPath.action?filePath="+imgUrl);
            $("#imgContent").show();
		}else{
            //$("#imgContent").hide();
        }
		
		// var signType = $("#signType").val();
		// $("input[name='userSign'][value='"+signType+"']").attr("checked","checked");
		// $("input[name='userSign'][value='"+signType+"']").click();
	})(); 

	/*
	 * 上传图片印章
	 */
 $("#userSign_upload").uploadify({
    //和存放队列的DIV的id一致
    'queueID':'queue',
    //服务器端脚本使用的文件对象的名称 $_FILES个['upload']
    'fileObjName':'fileupload',
    //上传处理程序
    'uploader':basePath+'filemanager/uploadfile.action?module=userSign',
    //按钮文字
    'buttonText' : '上传附件...',
    //附带值
    'formData':{
        'userid':'用户id',
        'username':'用户名',
        'rnd':'加密密文',
        'module':'userSign'
    },
    //浏览按钮的背景图片路径
    'buttonImage':basePath+'flat/images/upload.png',
    //取消上传文件的按钮图片，就是个叉叉
    'cancel': basePath+'plugins/upload/upbutton.png',
    //浏览按钮的宽度
    'width':'48',
    //浏览按钮的高度
    'height':'15',
    //在浏览窗口底部的文件类型下拉菜单中显示的文本
    'fileTypeDesc':'支持的格式:',
    //允许上传的文件后缀
    'fileTypeExts':'*.jpg;*.jpge;*.gif;*.png',
    //上传文件的大小限制
    'fileSizeLimit':'200K',
    //上传数量
    'queueSizeLimit' : 25,
    //开启调试
    'debug' : false,
    //是否自动上传
    'auto':true,
    //上传后是否删除
    'removeComplete':false,
    //清除
    removeTimeout : 0,
    langFile:basePath+'plugins/upload/ZH_cn.js',
    //超时时间
    'successTimeout':99999,
    //flash
    'swf': basePath+'plugins/upload/uploadify.swf',
    //不执行默认的onSelect事件
    'overrideEvents' : ['onDialogClose'],
    //每次更新上载的文件的进展
    'onUploadProgress' : function(file, bytesUploaded, bytesTotal, totalBytesUploaded, totalBytesTotal) {
    },
    //选择上传文件后调用
    'onSelect' : function(file) {
    	this.addPostParam("fileuploadFileName",encodeURI(file.name));//改变文件名的编码
        return true;
    },
    //返回一个错误，选择文件的时候触发
    'onSelectError':function(file, errorCode, errorMsg){
        switch(errorCode) {
            case -100:
            	art.dialog.alert("上传的文件数量已经超出系统限制的"+$('#file_upload').uploadify('settings','queueSizeLimit')+"个文件！");
                break;
            case -110:
            	art.dialog.alert("文件 ["+file.name+"] 大小超出系统限制的"+$('#file_upload').uploadify('settings','fileSizeLimit')+"大小！");
                break;
            case -120:
            	art.dialog.alert("文件 ["+file.name+"] 大小异常！");
                break;
            case -130:
            	art.dialog.alert("文件 ["+file.name+"] 类型不正确！");
                break;
        }
    },
    //检测FLASH失败调用
    'onFallback':function(){
    	art.dialog.alert("您未安装FLASH控件，无法上传图片！请安装FLASH控件后再试。");
    },
    //上传到服务器，服务器返回相应信息到data里
    'onUploadSuccess':function(file, data, response){
    	var obj = eval("("+data+")");
    	var path = basePath + "filemanager/prevViewByPath.action?filePath=" +obj.attachFile;
    	$("#imgContent").attr("src",path);
    	$("#imgSignUrl").val(obj.attachFile);
        $("#imgContent").show();
    },
    //上传前取消文件
    'onCancel' : function(file) {
        // alert('The file ' + file.name + ' was cancelled.');
    } 
});

});

function check(){
	var val = $("#userSign").val();
	if(val == 2){
		if(!$("#imgSignUrl").val()){
			art.dialog.alert("请上传印章图片附件!");
			return false;
		}
	}
	return true;
}

