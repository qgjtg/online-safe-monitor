/** 
 * @author 作者姓名  E-mail: email地址 
 * @version 创建时间：2015-8-25 上午10:37:50 
 * 类说明 
 */
package cn.com.wh.zhdwxy.service;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.com.qytx.platform.base.query.Page;
import cn.com.qytx.platform.base.query.Pageable;
import cn.com.qytx.platform.base.service.impl.BaseServiceImpl;
import cn.com.wh.zhdwxy.dao.WhDangerSourcesDao;
import cn.com.wh.zhdwxy.domain.WhDangerSources;


/**
 * @ClassName:     WhDangerSourcesServiceImpl.java
 * @Description:   TODO(用一句话描述该文件做什么) 
 * 
 * @author         wangxj
 * @version        V1.0  
 * @Date           2015-8-25 上午10:37:50 
 */
@Service("whDangerSourcesServiceImpl")
public class WhDangerSourcesServiceImpl extends BaseServiceImpl<WhDangerSources> implements WhDangerSourcesService {
	private static Log logger = LogFactory.getLog(WhDangerSourcesServiceImpl.class);
	@Autowired
    public WhDangerSourcesDao whDangerSourcesDao;
	/* 
	 * @see cn.com.wh.zhdwxy.service.WhDangerSourcesService#queryByConPage(cn.com.qytx.platform.base.query.Pageable, java.lang.String, java.lang.String, java.lang.String)
	 */
	@Override
	public Page<WhDangerSources> queryByConPage(Pageable page, String groupId,String dangerSourcesName, String safetyMeasures,Integer grade) {
		Page<WhDangerSources> _page = null;
		try{
			_page = whDangerSourcesDao.queryByConPage(page, groupId,dangerSourcesName, safetyMeasures,grade);
		}catch(Exception e){
			logger.error("分页查询重大危险源列表出现异常："+e.toString());
			return null;
		}
		return _page;
	}
	/* 
	 * @see cn.com.wh.zhdwxy.service.WhDangerSourcesService#queryDetail(java.lang.String)
	 */
	@Override
	public WhDangerSources queryDetail(String vid) {
		WhDangerSources whDangerSources	= new WhDangerSources();
		try{
			whDangerSources = whDangerSourcesDao.findOne(Integer.parseInt(vid));
		}catch(Exception e){
			logger.error("查询重大危险源详情出现异常："+e.toString());
			return null;
		}
		return whDangerSources;
	}

}
