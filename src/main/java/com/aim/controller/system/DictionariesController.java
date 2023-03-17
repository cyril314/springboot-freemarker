package com.aim.controller.system;

import com.aim.base.AjaxResult;
import com.aim.base.IController;
import com.aim.entity.Page;
import com.aim.entity.PageData;
import com.aim.entity.TreeData;
import com.aim.entity.system.Dictionaries;
import com.aim.service.system.DictionariesService;
import com.aim.util.FastJsonUtil;
import com.aim.util.Tools;
import com.alibaba.fastjson.JSONArray;
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
 * 数据字典处理类
 */
@Controller
@RequestMapping("/dictionaries")
public class DictionariesController extends IController {

	@Autowired
	private DictionariesService dictionariesService;

	/**
	 * 显示列表ztree
	 */
	@RequestMapping(value = "/listAllDict")
	@RequiresPermissions("dictionaries:list")
	@ResponseBody
	public Object listAllDict() throws Exception {
		Map<String, Object> map = AjaxResult.success();
		List<Dictionaries> list = dictionariesService.listAllDict("0");
		List<TreeData> resultList = new ArrayList<TreeData>();
		if (list.size() > 0) {
			convertDict(resultList, list);
		}
		map.put("data", resultList);
		return map;
	}

	private void convertDict(List<TreeData> mtList, List<Dictionaries> menuList) {
		for (Dictionaries dict : menuList) {
			TreeData td = new TreeData();
			td.setId(dict.getDICTIONARIES_ID());
			td.setPid(dict.getPARENT_ID());
			td.setTitle(dict.getNAME());
			td.setHref(dict.getTreeurl());
			List<Dictionaries> subMenu = dict.getSubDict();
			if (subMenu.size() > 0) {
				List<TreeData> childrenList = new ArrayList<TreeData>();
				convertDict(childrenList, subMenu);
				td.setChildren(childrenList);
			}
			mtList.add(td);
		}
	}

	/**
	 * 列表
	 */
	@RequestMapping(value = "/list")
	@RequiresPermissions("dictionaries:list")
	@ResponseBody
	public Object list(Page page) throws Exception {
		Map<String, Object> map = AjaxResult.success();
		PageData pd = new PageData();
		pd = this.getPageData();
		String KEYWORDS = pd.getString("KEYWORDS");                        //关键词检索条件
		if (Tools.notEmpty(KEYWORDS)) pd.put("KEYWORDS", KEYWORDS.trim());
		String DICTIONARIES_ID = null == pd.get("DICTIONARIES_ID") ? "0" : pd.get("DICTIONARIES_ID").toString();
		pd.put("DICTIONARIES_ID", DICTIONARIES_ID);                        //上级ID
		page.setPd(pd);
		List<PageData> varList = dictionariesService.listPage(page);        //列出Dictionaries列表
		if ("".equals(DICTIONARIES_ID) || "0".equals(DICTIONARIES_ID)) {
			map.put("PARENT_ID", "0");                                    //上级ID
		} else {
			map.put("PARENT_ID", dictionariesService.findById(pd).getString("PARENT_ID"));    //上级ID
		}
		map.put("data", varList);
		map.put("count", page.getTotalResult());
		map.put("DICTIONARIES_ID", DICTIONARIES_ID);
		return map;
	}

	/**
	 * 去新增页面
	 */
	@RequestMapping(value = "/goAdd")
	@ResponseBody
	public Object goAdd() throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		String errInfo = "success";
		PageData pd = new PageData();
		pd = this.getPageData();
		String DICTIONARIES_ID = null == pd.get("DICTIONARIES_ID") ? "" : pd.get("DICTIONARIES_ID").toString();
		pd.put("DICTIONARIES_ID", DICTIONARIES_ID);                        //上级ID
		map.put("pds", dictionariesService.findById(pd));                //传入上级所有信息
		map.put("result", errInfo);
		return map;
	}

	/**
	 * 新增
	 */
	@RequestMapping(value = "/add")
	@ResponseBody
	public Object add() throws Exception {
		Map<String, String> map = new HashMap<String, String>();
		String errInfo = "success";
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("DICTIONARIES_ID", this.get32UUID());    //主键
		dictionariesService.save(pd);
		map.put("result", errInfo);
		return map;
	}

	/**
	 * 判断编码是否存在
	 */
	@RequestMapping(value = "/hasBianma")
	@ResponseBody
	public Object hasBianma() {
		Map<String, String> map = new HashMap<String, String>();
		String errInfo = "success";
		PageData pd = new PageData();
		try {
			pd = this.getPageData();
			if (dictionariesService.findByBianma(pd) != null) {
				errInfo = "error";
			}
		} catch (Exception e) {
			errInfo = "error";
		}
		map.put("result", errInfo);                //返回结果
		return map;
	}

	/**
	 * 去修改页面
	 */
	@RequestMapping(value = "/goEdit")
	@ResponseBody
	public Object goEdit() throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		String errInfo = "success";
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = dictionariesService.findById(pd);                            //根据ID读取
		map.put("pd", pd);                                                //放入视图容器
		pd.put("DICTIONARIES_ID", pd.get("PARENT_ID").toString());        //用作上级信息
		map.put("pds", dictionariesService.findById(pd));                //传入上级所有信息
		map.put("result", errInfo);                                        //返回结果
		return map;
	}

	/**
	 * 修改
	 */
	@RequestMapping(value = "/edit")
	@ResponseBody
	public Object edit() throws Exception {
		Map<String, Object> map = AjaxResult.success(0, "success");
		PageData pd = new PageData();
		pd = this.getPageData();
		dictionariesService.edit(pd);
		return map;
	}

	/**
	 * 删除
	 */
	@RequestMapping(value = "/delete")
	@ResponseBody
	public Object delete(@RequestParam String DICTIONARIES_ID) throws Exception {
		Map<String, String> map = new HashMap<String, String>();
		PageData pd = new PageData();
		pd.put("DICTIONARIES_ID", DICTIONARIES_ID);
		String errInfo = "success";
		if (dictionariesService.listSubDictByParentId(DICTIONARIES_ID).size() > 0) {//判断是否有子级，是：不允许删除
			errInfo = "error";
		} else {
			pd = dictionariesService.findById(pd);                    //根据ID读取
			if ("yes".equals(pd.getString("YNDEL"))) return null;        //当禁止删除字段值为yes, 则禁止删除，只能从手动从数据库删除
			if (null != pd.get("TBSNAME") && !"".equals(pd.getString("TBSNAME"))) {
				String TBFIELD = pd.getString("TBFIELD");
				if (Tools.isEmpty(TBFIELD)) TBFIELD = "BIANMA";        //如果关联字段没有设置，就默认字段为 BIANMA
				pd.put("TBFIELD", TBFIELD);
				String[] table = pd.getString("TBSNAME").split(",");
				for (int i = 0; i < table.length; i++) {
					pd.put("thisTable", table[i]);
					try {
						if (Integer.parseInt(dictionariesService.findFromTbs(pd).get("zs").toString()) > 0) {//判断是否被占用，是：不允许删除(去排查表检查字典表中的编码字段)
							errInfo = "error";
							break;
						}
					} catch (Exception e) {
						errInfo = "error2";
						break;
					}
				}
			}
		}
		if ("success".equals(errInfo)) {
			dictionariesService.delete(pd);    //执行删除
		}
		map.put("result", errInfo);
		return map;
	}

	/**
	 * 获取连级数据
	 */
	@RequestMapping(value = "/getLevels")
	@ResponseBody
	public Object getLevels() throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		String errInfo = "success";
		PageData pd = new PageData();
		pd = this.getPageData();
		String DICTIONARIES_ID = pd.getString("DICTIONARIES_ID");
		DICTIONARIES_ID = Tools.isEmpty(DICTIONARIES_ID) ? "0" : DICTIONARIES_ID;
		List<Dictionaries> varList = dictionariesService.listSubDictByParentId(DICTIONARIES_ID); //用传过来的ID获取此ID下的子列表数据
		List<PageData> pdList = new ArrayList<PageData>();
		for (Dictionaries d : varList) {
			PageData pdf = new PageData();
			pdf.put("DICTIONARIES_ID", d.getDICTIONARIES_ID());
			pdf.put("BIANMA", d.getBIANMA());
			pdf.put("NAME", d.getNAME());
			pdList.add(pdf);
		}
		map.put("list", pdList);
		map.put("result", errInfo); //返回结果
		return map;
	}

	/**
	 * 显示列表ztree (用于代码生成器引用数据字典)
	 */
	@RequestMapping(value = "/listAllDictToCreateCode")
	@ResponseBody
	public Object listAllDictToCreateCode() throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		String errInfo = "success";
		JSONArray arr = FastJsonUtil.objParseJsonArray(dictionariesService.listAllDictToCreateCode("0"));
		String json = arr.toString();
		json = json.replaceAll("DICTIONARIES_ID", "id").replaceAll("PARENT_ID", "pId").replaceAll("NAME", "name").replaceAll("subDict", "nodes").replaceAll("hasDict", "checked").replaceAll("treeurl", "click");
		map.put("zTreeNodes", json);
		map.put("result", errInfo);                //返回结果
		return map;
	}

}
