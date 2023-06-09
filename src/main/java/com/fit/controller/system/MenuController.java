package com.fit.controller.system;

import com.fit.base.AjaxResult;
import com.fit.base.IController;
import com.fit.entity.PageData;
import com.fit.entity.TreeData;
import com.fit.entity.system.Menu;
import com.fit.service.system.LogService;
import com.fit.service.system.MenuService;
import com.fit.util.*;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 菜单管理处理类
 */
@Controller
@RequestMapping("/menu")
public class MenuController extends IController {

	@Autowired
	private MenuService menuService;
	@Autowired
	private LogService logService;

	/**
	 * 菜单列表ztree(菜单管理)
	 */
	@RequestMapping(value = "/listAllMenu")
	@RequiresPermissions("menu:list")
	@ResponseBody
	public Object listAllMenu() throws Exception {
		Map<String, Object> map = AjaxResult.success();
		List<TreeData> resultList = new ArrayList<TreeData>();
		List<Menu> list = menuService.listAllMenu("0");
		if (list.size() > 0) {
			convertMenu(resultList, list);
		}
		map.put("data", resultList);
		return map;
	}

	/**
	 * 菜单列表
	 */
	@RequestMapping(value = "/list")
	@RequiresPermissions("menu:list")
	@ResponseBody
	public Object list(String MENU_ID) throws Exception {
		Map<String, Object> map = AjaxResult.success();
		PageData pd = new PageData();
		pd = this.getPageData();
		MENU_ID = Tools.isEmpty(MENU_ID) ? "0" : MENU_ID;
		List<Menu> menuList = menuService.listSubMenuByParentId(MENU_ID);
		map.put("pd", menuService.getMenuById(pd));                                    //传入父菜单所有信息
		map.put("MSG", null == pd.get("MSG") ? "'list'" : pd.get("MSG").toString());    //MSG=change 则为编辑或删除后跳转过来的
		map.put("data", menuList);
		return map;
	}

	/**
	 * 请求新增菜单页面
	 */
	@RequestMapping(value = "/toAdd")
	@RequiresPermissions("menu:add")
	@ResponseBody
	public Object toAdd() throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		String errInfo = "success";
		PageData pd = new PageData();
		pd = this.getPageData();
		String MENU_ID = (null == pd.get("MENU_ID") || "".equals(pd.get("MENU_ID").toString())) ? "0" : pd.get("MENU_ID").toString();//接收传过来的上级菜单ID,如果上级为顶级就取值“0”
		pd.put("MENU_ID", MENU_ID);
		map.put("pds", menuService.getMenuById(pd));    //传入父菜单所有信息
		map.put("result", errInfo);
		return map;
	}

	/**
	 * 新增菜单
	 *
	 * @param menu
	 */
	@RequestMapping(value = "/add")
	@RequiresPermissions("menu:add")
	@ResponseBody
	public Object add(Menu menu) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		String errInfo = "success";
		PageData pd = new PageData();
		menu.setMENU_ID(String.valueOf(Integer.parseInt(menuService.findMaxId(pd).get("MID").toString()) + 1));
		menu.setMENU_ICON("");                                                    //默认无菜单图标
		menuService.addMenu(menu);                                                //新增菜单
		logService.save(Jurisdiction.getUsername(), "新增菜单:" + menu.getMENU_NAME());    //记录日志
		map.put("result", errInfo);
		return map;
	}

	/**
	 * 请求编辑菜单页面
	 *
	 * @param
	 * @return
	 */
	@RequestMapping(value = "/toEdit")
	@RequiresPermissions("menu:edit")
	@ResponseBody
	public Object toEdit(String MENU_ID) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		String errInfo = "success";
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = menuService.getMenuById(pd);                        //读取此ID的菜单数据
		map.put("pd", pd);
		pd.put("MENU_ID", pd.get("PARENT_ID").toString());        //用作读取父菜单信息
		map.put("pds", menuService.getMenuById(pd));            //传入父菜单所有信息
		map.put("result", errInfo);
		return map;
	}

	/**
	 * 保存编辑
	 *
	 * @param
	 * @return
	 */
	@RequestMapping(value = "/edit")
	@RequiresPermissions("menu:edit")
	@ResponseBody
	public Object edit(Menu menu) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		String errInfo = "success";
		menuService.edit(menu);
		logService.save(Jurisdiction.getUsername(), "修改菜单:" + menu.getMENU_NAME());                //记录日志
		map.put("result", errInfo);
		return map;
	}

	/**
	 * 删除菜单
	 */
	@RequestMapping(value = "/delete")
	@ResponseBody
	@RequiresPermissions("menu:del")
	public Object delete(@RequestParam String MENU_ID) throws Exception {
		Map<String, String> map = new HashMap<String, String>();
		String errInfo = "success";
		if (menuService.listSubMenuByParentId(MENU_ID).size() > 0) {//判断是否有子菜单，是：不允许删除
			errInfo = "error";
		} else {
			menuService.deleteMenuById(MENU_ID);
			errInfo = "success";
			logService.save(Jurisdiction.getUsername(), "删除的菜单ID为:" + MENU_ID);                //记录日志
		}
		map.put("result", errInfo);
		return map;
	}

	/**
	 * 保存菜单图标
	 *
	 * @param
	 * @return
	 */
	@RequestMapping(value = "/editicon")
	@RequiresPermissions("menu:edit")
	@ResponseBody
	public Object editicon() throws Exception {
		Map<String, String> map = new HashMap<String, String>();
		String errInfo = "success";
		PageData pd = new PageData();
		pd = this.getPageData();
		menuService.editicon(pd);
		map.put("result", errInfo);
		return map;
	}

	/**
	 * 显示菜单列表ztree(拓展左侧四级菜单)
	 *
	 * @return
	 */
	@RequestMapping(value = "/otherlistMenu")
	@ResponseBody
	public Object otherlistMenu(String MENU_ID) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		String errInfo = "success";
		PageData pd = new PageData();
		pd.put("MENU_ID", MENU_ID);
		String MENU_URL = menuService.getMenuById(pd).getString("MENU_URL");
		if ("#".equals(MENU_URL.trim()) || "".equals(MENU_URL.trim()) || null == MENU_URL) {
			MENU_URL = "../index/default.html";
		}
		String roleRights = Jurisdiction.getSession().getAttribute(Jurisdiction.getUsername() + Const.SESSION_ROLE_RIGHTS).toString();    //获取本角色菜单权限
		List<Menu> athmenuList = menuService.listAllMenuQx(MENU_ID);                    //获取某菜单下所有子菜单
		athmenuList = this.readMenu(athmenuList, roleRights);                            //根据权限分配菜单
		String json = JacksonUtils.obj2json(athmenuList);
		json = json.replaceAll("MENU_ID", "id").replaceAll("PARENT_ID", "pId").replaceAll("MENU_NAME", "name").replaceAll("subMenu", "nodes").replaceAll("hasMenu", "checked").replaceAll("MENU_URL", "url").replaceAll("#", "");
		map.put("zTreeNodes", json);
		map.put("MENU_URL", MENU_URL);        //本ID菜单链接
		map.put("result", errInfo);
		return map;
	}

	/**
	 * 根据角色权限获取本权限的菜单列表(递归处理)
	 *
	 * @param menuList：传入的总菜单
	 * @param roleRights：加密的权限字符串
	 */
	public List<Menu> readMenu(List<Menu> menuList, String roleRights) {
		for (int i = 0; i < menuList.size(); i++) {
			menuList.get(i).setHasMenu(RightsHelper.testRights(roleRights, menuList.get(i).getMENU_ID()));
			if (menuList.get(i).isHasMenu() && "1".equals(menuList.get(i).getMENU_STATE())) {    //判断是否有此菜单权限并且是否隐藏
				this.readMenu(menuList.get(i).getSubMenu(), roleRights);                    //是：继续排查其子菜单
			} else {
				menuList.remove(i);
				i--;
			}
		}
		return menuList;
	}

}
