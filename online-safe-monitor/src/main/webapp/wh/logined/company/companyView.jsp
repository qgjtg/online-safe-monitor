<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<jsp:include page="../head.jsp" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>企业信息</title>
</head>
<body>
<div class="bread-line">
  <label>当前位置：</label><a href="#">首页</a>&gt;&nbsp;<a href="#">企业信息</a>
</div>
<div class="tabBox">
  <ul>
    <li class="on"><a href="#">企业信息</a></li>
    <li><a href="${ctx}wh/logined/company/legalPersonView.jsp?groupId=<s:property value="cpy.groupId"/>">法人信息</a></li>
    <li><a href="${ctx}companywh/toPhotoView.action?groupId=<s:property value="cpy.groupId"/>">企业证照</a></li>
    <li><a href="${ctx}companywh/sis_jmpPage.action?operation=4&whCompany.groupId=<s:property value="cpy.groupId"/>">安全机构管理</a></li>
  </ul>
</div>


   <div class="formPage">
   <div class="formbg">
	<input type="hidden" id="groupId" value='<s:property value="#session.adminUser.groupId"/>'/>
        <div class="big_title">企业基本信息</div>
        <div class="content_form">
                <table width="100%" cellspacing="0" cellpadding="0" border="0" class="inputTable">
                    <tbody>
                        <tr>
                            <th>企业名称：</th>
                            <td><s:property value="cpy.companyName"/>
                            </td>
                            <th>工商注册地址：</th>
                            <td><s:property value="cpy.registrationAddress"/></td>
                        </tr>
                        <tr>
                            <th>经纬度：</th>   
                            <td>
                            	<s:property value="cpy.precision"/>&nbsp;&nbsp;
                            	<s:property value="cpy.dimension"/>
                            </td>
                            <th>省市县：</th>
                            <td>
                            	<s:property value="cpy.cityId"/>
                            </td>
                        </tr>
                         <tr>
                            <th>单位性质：</th>
                            <td><s:property value="cpy.companyProperty"/></td>
                            <th>成立时间：</th>
                            <td>
                            	<s:date format="yyyy-MM-dd" name="#request.cpy.establishmentTime" />
							</td>
                        </tr>
                         <tr>
                            <th>营业执照注册号：</th>
                            <td><s:property value="cpy.businessLicence"/></td>
                             <th>营业执照生产范围：</th>
                            <td><s:property value="cpy.productionScope"/></td>
                        </tr>
                         <tr>
                            <th>法定代表人：</th>
                            <td><s:property value="cpy.legalRepresentative"/></td>
                            <th>经济类型：</th>
                            <td>
                            	<s:property value="cpy.economicType"/>
                            </td>
                        </tr>
                         <tr>
                            <th>组织机构代码：</th>
                            <td><s:property value="cpy.unitCode"/></td>
                            <th>生产场所地址：</th>
                            <td><s:property value="cpy.productAddress"/></td>
                        </tr>
                         <tr>
                            <th>企业网站：</th>
                            <td><s:property value="cpy.website"/></td>
                            <th>邮政编码：</th>
                            <td><s:property value="cpy.postalcode"/></td>
                        </tr>
                         <tr>
                            <th>是否在工业园区：</th>
                            <td>
                            <s:if test="cpy.isIn==1 ">
                           	是
                            </s:if>
                            <s:if test="cpy.isIn==0 ">
                           	否
                            </s:if>
                            </td>
		                   <th></th>
		                   <td>
		                   	</td>
		                 </tr>
		                 <tr>
		                 <th>行业类型：</th>
		                   <td colspan="3">
		                   <s:property value="cpy.industryClassification"/>
		                   	</td>
		                 </tr>
                    </tbody>
                </table>
        </div>
        <div class="big_title">企业其他信息</div>
        <div class="content_form">
                <table width="100%" cellspacing="0" cellpadding="0" border="0" class="inputTable">
                    <tbody>
                        <tr>
                            <th>单位代码：</th>
                            <td><s:property value="cpy.companyCode"/></td>
                            <th>销售收入（万元）：</th>
                            <td><s:property value="cpy.sales"/></td>
                        </tr>
                         <tr>
                            <th>职工人数：</th>
                            <td><s:property value="cpy.workersNum"/></td>
                            <th>企业规模：</th>
                            <td>
                            <s:if test="cpy.enterpriseScale==1 ">
                           	20人以下
                            </s:if>
                            <s:if test="cpy.enterpriseScale==2 ">
                           	20-99人
                            </s:if>
                            <s:if test="cpy.enterpriseScale==3 ">
                           	100-499人
                            </s:if>
                            <s:if test="cpy.enterpriseScale==4 ">
                           	500-999人
                            </s:if>
                            <s:if test="cpy.enterpriseScale==5 ">
                           	1000-9999人
                            </s:if>
                            <s:if test="cpy.enterpriseScale==6 ">
                           	10000人以上
                            </s:if>
                            </td>
                             </tr>
                         <tr>
		                   <th>生产状况：</th>
		                   <td>
                            <s:property value="productTypeName"/>
		                   	</td>
		                   	<th></th>
		                   	<td></td>
		                 </tr>
		                 <tr>
		                 	<th>生产投入提取标准：</th>
		                   <td colspan="3">
		                   <s:property value="cpy.extractDescription"/>
		                   	</td>
		                 </tr>
                    </tbody>
                </table>
        </div>
        
        <div class="big_title">安全生产管理人员信息</div>
        <div class="content_form">
                <table width="100%" cellspacing="0" cellpadding="0" border="0" class="inputTable">
                    <tbody>
                        <tr>
                         	<th>管理人员人数：</th>
                            <td><s:property value="cpy.safeManageUserNum"/></td>
                            <th>负责人：</th>
                            <td><s:property value="cpy.safeManageUserName"/></td>
                        </tr>
                         <tr>
                            <th>负责人移动电话：</th>
                            <td><s:property value="cpy.safeManageUserPhone"/></td>
                            <th>负责人办公电话：</th>
                            <td><s:property value="cpy.safeManageUserTel"/></td>
                        </tr>
                         <tr>
                            <th>负责人电子邮箱：</th>
                            <td><s:property value="cpy.safeManageUserEmail"/></td>
                        </tr>
                    </tbody>
                </table>
        </div>
        
        
        <div class="big_title">特种作业相关信息</div>
        <div class="content_form">
                <table width="100%" cellspacing="0" cellpadding="0" border="0" class="inputTable">
                    <tbody>
                       <tr>
                            <th>特种作业人员人数：</th>
                            <td><s:property value="cpy.specialUserNum"/></td>
                            <th>安全生产标准等级：</th>
                            <td>
                            	<s:property value="safeProductGrade"/>
                            </td>
                        </tr>
                         <tr>
                            <th>应急咨询服务号码：</th>
                            <td><s:property value="cpy.emergencyPhone"/></td>
                            <th>安全值班电话：</th>
                            <td><s:property value="cpy.safeDutyPhone"/></td>
                        </tr>
                    </tbody>
                </table>
        </div>
        
        <div class="big_title">企业相关资质信息</div>
        <div class="content_form">
                <table width="100%" cellspacing="0" cellpadding="0" border="0" class="inputTable">
                    <tbody>
                       <tr>
                            <th>进口企业资质证明名称：</th>
                            <td>
                            	<s:property value="importCompanyQualification"/>
                            </td>
                            <th>进口企业资质证明编号：</th>
                            <td><s:property value="cpy.importCompanyQualificationNum"/></td>
                        </tr>
                        <tr>
                            <th>主要产品及生产规模：</th>
                            <td colspan="3">
                            	<s:property value="cpy.product"/>
		                    </td>
                        </tr>
                        <tr>
                            <th>企业简介：</th>
                            <td colspan="3">
                            	<s:property value="cpy.introduction"/>
		                    </td>
                        </tr>
                        <tr>
		                   <th>单位或设备情况：</th>
		                   <td colspan="3" style="width: 200px">
		                   <s:property value="cpy.outsideSituation"/>
		                   		<!-- <label class="radio"><input id="1" name="dwsb" type="checkbox" value="医院"/>医院</label>
		                   		<label class="radio"><input id="2" name="dwsb" type="checkbox" value="学校" />学校</label>
		                   		<label class="radio"><input id="3" name="dwsb" type="checkbox" value="工厂" />工厂</label>
		                   		<label class="radio"><input id="4" name="dwsb" type="checkbox" value="社区" />社区</label>
		                   		<label class="radio"><input id="5" name="dwsb" type="checkbox" value="铁路" />铁路</label>
		                   		<label class="radio"><input id="6" name="dwsb" type="checkbox" value="居民区" />居民区</label>
		                   		<label class="radio"><input id="7" name="dwsb" type="checkbox" value="矿山" />矿山</label>
		                   		<label class="radio"><input id="8" name="dwsb" type="checkbox" value="高速公路" />高速公路</label>
		                   		<label class="radio"><input id="9" name="dwsb" type="checkbox" value="河流" />河流</label>
		                   		<label class="radio"><input id="0" name="dwsb" type="checkbox" value="其他" />其他</label>
		                   		<br/><em class="tip">(厂区边界外1000米范围内)</em> -->
		                   	</td>
		                 </tr>
                    </tbody>
                </table>
        </div>
        
        
   </div>
    <div class="buttonArea"> 
    		<input type="button" value="返回" class="formButton_grey"  hidefocus="" onclick="javascript :history.back(-1);"/>
	</div>
   </div>


</body>
</html>

