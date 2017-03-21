/** 
 * @author 作者姓名  E-mail: email地址 
 * @version 创建时间：2015-8-25 上午10:33:41 
 * 类说明 
 */
package cn.com.wh.zhdwxy.service;

import cn.com.qytx.platform.base.query.Page;
import cn.com.qytx.platform.base.query.Pageable;
import cn.com.qytx.platform.base.service.BaseService;
import cn.com.wh.zhdwxy.domain.WhDangerSources;


/**
 * @ClassName:     WhDangerSourcesService.java
 * @Description:   TODO(用一句话描述该文件做什么) 
 * 
 * @author         wangxj
 * @version        V1.0  
 * @Date           2015-8-25 上午10:33:41 
 */
public interface WhDangerSourcesService extends BaseService<WhDangerSources>{
	
	public Page<WhDangerSources> queryByConPage(Pageable page,String group_id,String danger_sources_name,String safety_measures,Integer grade);
	
	public WhDangerSources queryDetail(String vid);
	
}
