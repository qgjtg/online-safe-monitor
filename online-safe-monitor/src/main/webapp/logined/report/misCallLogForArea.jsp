<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<jsp:include page="../../common/taglibs.jsp" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>查询统计-来电区域分布表</title>
<jsp:include page="../../common/head.jsp" />
<link href="${ctx}common/css/reset.css" rel="stylesheet" type="text/css" />
<link href="${ctx}common/plugins/datatable/skins/datatable_default.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${ctx}common/js/base.js"></script>
<script type="text/javascript" src="${ctx}plugins/datatable/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="${ctx}common/plugins/datatable/selecedForDatatablePagination.js"></script>
<script type="text/javascript" src="${ctx}common/plugins/dialog/artDialog.js?skin=default"></script>
<script type="text/javascript" src="${ctx}common/plugins/dialog/iframeTools.js"></script>
<script type="text/javascript" src="${ctx}common/is/placeholder.js"></script>
<!-- 引用js -->
<script type="text/javascript" src="${ctx}js/logined/report/misCallLogForArea.js?version=${version}"></script>
</head>
<body>
<input type="hidden" id="isForkGroup"/>
<div class="list">
  <div class="searchArea">
    <table cellspacing="0" cellpadding="0">
      <tbody>
        <tr>
          <td class="right">
          <label id="showDS">所属地市：</label>
          <select id= "groupId">
          </select>
          <label>时间范围：</label>
            <input id="beginTime" type="text" class="formText Wdate" onfocus="WdatePicker({ maxDate: '#F{$dp.$D(\'endTime\')}',skin:'default',dateFmt:'yyyy-MM-dd'})" />
			&nbsp;-&nbsp;
			<input id="endTime" type="text" class="formText Wdate" onfocus="WdatePicker({ minDate: '#F{$dp.$D(\'beginTime\')}',skin:'default',dateFmt:'yyyy-MM-dd'})" />
            <input type="button" id="search" class="searchButton" value="查询"/>
            </td>
           <td style="width:102px; "><div class="fButton blueBtn" style="margin-left:10px" id="areaTableExport">
                <span  class="export">导出</span>
              </div>
           </td>
        </tr>
      </tbody>
    </table>
  </div>
  <div class="dataTables_wrapper" role="grid">
	<div class="dataTables_processing" id="areaTable_processing" style="visibility: hidden;">正在加载数据...</div>
  <table width="100%" cellpadding="0" border="0" cellspacing="0" class="pretty" id="areaTable">
  	<thead>
  		<tr>
  			<th style="width:25px">序号</th>
  			<th style="width:175px">地市</th>
  			<th style="width:175px">呼入总量</th>
  			<th style="width:175px">人工受理</th>
  			<th style="width:175px">放弃</th>
  			<th style="width:175px">自动查询</th>
  		</tr>
  	</thead>
  	<tbody id="areaTable_body">
  	</tbody>
  </table>
  </div>
  <div class="clear"></div>
</div>
</body>
</html>
