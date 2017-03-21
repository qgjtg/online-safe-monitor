package cn.com.qytx.hotline.org.action;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.apache.struts2.ServletActionContext;

import cn.com.qytx.cbb.util.StringUtil;
import cn.com.qytx.hotline.org.service.IHotlineUser;
import cn.com.qytx.platform.base.action.BaseActionSupport;
import cn.com.qytx.platform.org.domain.GroupInfo;
import cn.com.qytx.platform.org.domain.UserInfo;
import cn.com.qytx.platform.org.service.IGroup;
import cn.com.qytx.platform.org.service.IUser;
import cn.com.qytx.platform.utils.tree.TreeNode;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

/**
 * 人员选择action
 * 版本: 1.0
 * 开发人员：黄普友
 * 创建日期: 2013-3-20
 * 修改日期：2013-3-21
 * 修改列表：
 */
@SuppressWarnings("serial")
public class UserSelectAction extends BaseActionSupport
{
    private int type;// 选择类型1 部门 2 角色 3 分组 4 在线
    /** 用户信息 */
    @Resource(name = "userService")
    IUser userService;
    /**
     * 部门/群组管理接口
     */
    @Resource(name = "groupService")
    private IGroup groupService;
    @Resource(name = "hotlineuserService")
    private IHotlineUser hotlineuserService;

//	@Resource
//	private ICompany companyService;
	
    private String searchName;
    private int showType;// 选择类型 1只显示部门 2 显示角色 3 显示人员
    
    private Integer userId;
    private Integer companyId;
    
    /**
     * 模块名称
     */
    private String moduleName;
    
    private String roleName;
    
    private Integer qunzuType;
    
    public Integer getQunzuType() {
		return qunzuType;
	}
	public void setQunzuType(Integer qunzuType) {
		this.qunzuType = qunzuType;
	}

    public Integer getCompanyId() {
        return companyId;
    }

    public void setCompanyId(Integer companyId) {
        this.companyId = companyId;
    }

    /**
     * 根据类型选择人员
     * @return
     */
    
    public String getUserInfo(){
    	try {
			String userIdStr = getRequest().getParameter("userId");
			if(userIdStr!=null && !"".equals(userIdStr)){
				Integer userId = Integer.parseInt(userIdStr);
				UserInfo userInfo = userService.findOne(userId);
				if(userInfo!=null){
					Integer groupId = userInfo.getGroupId();
					GroupInfo g = groupService.findOne(groupId);
					Map<String,Object> map = new HashMap<String,Object>();
					map.put("userId", userInfo.getUserId());
					map.put("userName", userInfo.getUserName());
					if(g!=null){
					    map.put("groupName", g.getGroupName());
					}
					Gson json = new Gson();
			        String jsons = json.toJson(map);
					ajax(jsons);
				}
			}
		} catch (NumberFormatException e) {
			LOGGER.error(e.getMessage());
		} catch (Exception e) {
			LOGGER.error(e.getMessage());
		}
    	return null;
    }
	public String selectUserByType()
    {
    	String contextPath = getRequest().getContextPath()+"/";
        List<TreeNode> treeNodes = new ArrayList<TreeNode>();
        moduleName = (moduleName == null?"":moduleName);
        if (type == 1)
        {
            // 根据部门选择
//            GroupInfo forkGroup = groupService.getForkGroup(getLoginUser().getCompanyId(),getLoginUser().getUserId());
        	GroupInfo forkGroup = null;
            //如果是发文分发，则不区分二级局
            if(moduleName!=null&&moduleName.equals("dispatch")){
                forkGroup = null;
            }
            int key = 0 ;
//            if(forkGroup!=null){
//                key =  forkGroup.getGroupId();
//            }
            UserInfo loginUser = getLoginUser();
            treeNodes = userService.selectUserByGroup(loginUser, forkGroup, moduleName, showType,key,contextPath,type);
//            for(TreeNode tn: treeNodes){
//            	System.out.println(tn.getId() + tn.getName());
//            }
        }
        else if (type == 2)
        {
            // 根据角色选择
            treeNodes = userService.selectUserByRole(getLoginUser(), moduleName, showType,contextPath);
        }
        else if (type == 5)
        {
            // 查找人员
            searchUser(treeNodes);
        }
        
        //add by jiayq,群组人员树
        else if(type == 3){
        	treeNodes = userService.selectUserByQunzu(getLoginUser().getCompanyId(), qunzuType, getRequest().getContextPath()+"/");
        }
     // 根据群组选择
        else if (type==4){
        	treeNodes = userService.selectUserByQunzu(getLoginUser().getCompanyId(),type, getRequest().getContextPath()+"/");
		}
        
        
        // 按角色过滤管理人员
        if (!StringUtils.isEmpty(this.roleName)&&!"undefined".equals(this.roleName))
        {
        	//去掉没有权限的
        	UserInfo adminUser = (UserInfo) this.getSession().getAttribute("adminUser");
            hotlineuserService.removeNoRole(treeNodes,adminUser.getUserId(),adminUser.getCompanyId(),this.roleName);
        }
        Gson json = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create();
        String jsons = json.toJson(treeNodes);
        ajax(jsons);
        return null;
    }
    
    /**
     * 作者：李贺
     * 时间：2015年1月7日
     * 功能：获得人员json手机号不为空的
     * @return
     */
	public String selectUserByTypeNew()
    {
    	String contextPath = getRequest().getContextPath()+"/";
    	List<TreeNode> treeNodes = new ArrayList<TreeNode>();
    	moduleName = (moduleName == null?"":moduleName);
    	if (type == 1)
    	{
    		// 根据部门选择
//            GroupInfo forkGroup = groupService.getForkGroup(getLoginUser().getCompanyId(),getLoginUser().getUserId());
    		GroupInfo forkGroup = null;
    		//如果是发文分发，则不区分二级局
    		if(moduleName!=null&&moduleName.equals("dispatch")){
    			forkGroup = null;
    		}
    		int key = 0 ;
//    		if(forkGroup!=null){
//    			key =  forkGroup.getGroupId();
//    		}
    		UserInfo loginUser = getLoginUser();
    		treeNodes = userService.selectUserByGroup(loginUser, forkGroup, moduleName, showType,key,contextPath,type);
    	}
    	else if (type == 2)
    	{
    		// 根据角色选择
    		treeNodes = userService.selectUserByRole(getLoginUser(), moduleName, showType,contextPath);
    	}
    	else if (type == 5)
    	{
    		// 查找人员
    		searchUser(treeNodes);
    	}
    	
    	//add by jiayq,群组人员树
    	else if(type == 3){
    		treeNodes = userService.selectUserByQunzu(getLoginUser().getCompanyId(), qunzuType, getRequest().getContextPath()+"/");
    	}
    	// 根据群组选择
    	else if (type==4){
    		treeNodes = userService.selectUserByQunzu(getLoginUser().getCompanyId(),type, getRequest().getContextPath()+"/");
    	}
    	
    	
    	// 按角色过滤管理人员
    	if (!StringUtils.isEmpty(this.roleName)&&!"undefined".equals(this.roleName))
    	{
    		//去掉没有权限的
    		UserInfo adminUser = (UserInfo) this.getSession().getAttribute("adminUser");
    		hotlineuserService.removeNoRole(treeNodes,adminUser.getUserId(),adminUser.getCompanyId(),this.roleName);
    	}
    	Gson json = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create();
    	//过滤并删除手机号为空的人员
    	if(treeNodes.size() > 0){
    		for(int i = 0; i < treeNodes.size() ;i++){
    			String id = treeNodes.get(i).getId();
    			if(!"".equals(id) && id.indexOf("uid_") >= 0 && (treeNodes.get(i).getObj() == null || "".equals( treeNodes.get(i).getObj().toString()))){
    				treeNodes.remove(i);
    				i -=1;
    			}
    		}
    	}
    	String jsons = json.toJson(treeNodes);
    	ajax(jsons);
    	return null;
    }

    /**
     * 查找人员
     * @param treeNodes SimpleTreeNode列表
     */
    private void searchUser(Collection<TreeNode> treeNodes)
    {
        HttpServletRequest request = ServletActionContext.getRequest();
        String path = request.getContextPath();
        String basePath = request.getScheme() + "://" + request.getServerName() + ":"
                + request.getServerPort() + path + "/";

        try
        {
            UserInfo adminUser = getLoginUser();
            if (adminUser != null)
            {
                if (StringUtil.isEmpty(searchName))
                {
                    return;
                }
                // 遍历人员
                List<UserInfo> userList = userService.findAllUsers(adminUser.getCompanyId(),
                        searchName);
//                GroupInfo forkGroup = groupService.getForkGroup(adminUser.getCompanyId(),adminUser.getUserId());
//                CompanyInfo companyInfo=companyService.findOne(adminUser.getCompanyId());
//                List<UserInfo> forkUsers = getUsersByForkGroup(forkGroup, companyInfo);
                if (userList != null)
                {
                    for (UserInfo user : userList)
                    {
                        if ("roleManager".equals(this.moduleName) && user.getUserState().intValue() == UserInfo.USERSTATE_UNLOGIN){
                            continue;
                        }
                        
//                        boolean flag = isExist(user,forkUsers);
//                        if(!flag){
//                        	continue;
//                        }
                        
                        TreeNode treeNode = new TreeNode();
                        treeNode.setId("uid_" + user.getUserId());// 部门ID前加gid表示类型为部门
                        treeNode.setName(user.getUserName());
                        treeNode.setObj(user.getPhone()); // 把号码存放到node里面，js里面调用
                        // 职务
                        treeNode.setTarget(user.getJob());
                        if (null != user.getSex() && 0 == user.getSex())
                        {
                            treeNode.setIcon(basePath + "images/woman.png");
                        }
                        else
                        {
                            treeNode.setIcon(basePath + "images/man.png");
                        }
                        treeNodes.add(treeNode);
                    }
                }
            }

        }
        catch (Exception ex)
        {
        	LOGGER.error(ex.getMessage());
        }
    }
    
//    private boolean isExist(UserInfo ui,List<UserInfo> userlist){
//    	for(int i=0; i<userlist.size(); i++){
//    		if(userlist.get(i).getUserId().intValue() == ui.getUserId().intValue()){
//    			return true;
//    		}
//    	}
//    	return false;
//    }

    
//    /**
//     * add by jiayq
//     * 功能：获取指定二级局下的所有人员
//     * @param
//     * @return
//     * @throws   
//     */
//    private List<UserInfo> getUsersByForkGroup(GroupInfo forkGroup,CompanyInfo companyInfo){
//    	List<GroupInfo> grouplist;
//    	if(forkGroup == null){
//    		grouplist = groupService.getGroupList(companyInfo.getCompanyId(), 1);
//    	}else{
//    		grouplist = groupService.getSubGroupList(forkGroup.getGroupId());
//    		grouplist.add(forkGroup);
//    	}
////    	String ids = "";
//    	StringBuffer ids = new StringBuffer();
//    	for(Iterator<GroupInfo> it = grouplist.iterator(); it.hasNext();){
//    		GroupInfo temp = it.next();
////    		ids+=temp.getGroupId();
//    		ids.append(temp.getGroupId());
//    		if(it.hasNext()){
//    			ids.append(",");
//    		}
//    	}
//    	 List<UserInfo> userList = userService.findUsersByGroupId(ids.toString());
//    	return userList;
//    }

    public int getType()
    {
        return type;
    }

    public void setType(int type)
    {
        this.type = type;
    }

    public String getSearchName()
    {
        return searchName;
    }

    public void setSearchName(String searchName)
    {
        this.searchName = searchName;
    }

    public int getShowType()
    {
        return showType;
    }

    public void setShowType(int showType)
    {
        this.showType = showType;
    }

    public String getModuleName()
    {
        return moduleName;
    }

    public void setModuleName(String moduleName)
    {
        this.moduleName = moduleName;
    }
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	
	/**
	 * 功能：获取所有用户
	 * 作者：jiayongqiang
	 * 参数：
	 * 输出：
	 */
	public String all(){
		List<UserInfo> u = userService.findAll("companyId = ?1",companyId);
		Gson json = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create();
	    String jsons = json.toJson(u);
	    ajax(jsons);
	    return null;
	}
	
    @Override
    protected UserInfo getLoginUser() {
        UserInfo ui = super.getLoginUser();
        if(ui == null){
            ui = userService.findOne(userId);
        }
        return ui;
    }
	/**
	 * @return the roleName
	 */
	public String getRoleName() {
		return roleName;
	}
	/**
	 * @param roleName the roleName to set
	 */
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
    
}
