package cn.com.qytx.workflow.jpdl.impl;

import java.util.HashMap;
import java.util.Map;

import cn.com.qytx.workflow.constans.WorkflowConstans;
import cn.com.qytx.workflow.jpdl.parsejson.NodeObject;


/**
 * 功能：汇合节点实现类
 * 版本: 1.0
 * 开发人员：贾永强
 * 创建日期: 2013-3-22 上午11:23:26 
 * 修改日期：2013-3-22 上午11:23:26 
 * 修改列表：
 */
public class JoinGenerateImpl extends AbstractFreemarkerTemplate implements WorkflowConstans{

	/* (non-Javadoc)
	 * @see cn.com.qytx.oa.impl.customJpdl.parseJSON.AbstractFreemarkerTemplate#getXmlTemplatePath()
	 */
	@Override
	public String getXmlTemplatePath() {
		return "jpdl.join.ftl";
	}

	/* (non-Javadoc)
	 * @see cn.com.qytx.oa.impl.customJpdl.parseJSON.AbstractFreemarkerTemplate#generateRoot(cn.com.qytx.oa.service.customJpdl.parseJSON.NodeObject)
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@Override
	public Map generateRoot(NodeObject nodeObject) {
		Map map = new HashMap();
		map.put("name", nodeObject.getText().getText());
		map.put("paths", nodeObject.getPaths());
		return map;
	}

	/* (non-Javadoc)
	 * @see cn.com.qytx.oa.impl.customJpdl.parseJSON.AbstractFreemarkerTemplate#getNodeType()
	 */
	@Override
	public String getNodeType() {
		return NODE_TYPE_JOIN;
	}

}
