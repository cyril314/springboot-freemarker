package com.fit.controller.system;

import com.fit.base.AjaxResult;
import com.fit.base.IController;
import com.fit.entity.Page;
import com.fit.entity.PageData;
import com.fit.service.system.ButtonService;
import com.fit.service.system.LogService;
import com.fit.util.Jurisdiction;
import com.fit.util.Tools;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

/**
 * 按钮管理处理类
 */
@Controller
@RequestMapping("/button")
public class ButtonController extends IController {

	@Autowired
	private ButtonService buttonService;
	@Autowired
	private LogService logService;

	/**
	 * 列表
	 */
	@PostMapping(value = "/list")
	@RequiresPermissions("button:list")
	@ResponseBody
	public Object list(Page page) throws Exception {
		Map<String, Object> map = AjaxResult.success();
		PageData pd = new PageData();
		pd = this.getPageData();
		String KEYWORDS = pd.getString("KEYWORDS");                //关键词检索条件
		if (Tools.notEmpty(KEYWORDS)) {
			pd.put("KEYWORDS", KEYWORDS.trim());
		}
		page.setPd(pd);
		List<PageData> resultList = buttonService.listPage(page);    //列出Fhbutton列表
		map.put("data", resultList);
		map.put("count", page.getTotalResult());
		map.put("pd", pd);
		return map;
	}

	/**
	 * 新增
	 */
	@RequestMapping(value = "/add")
	@RequiresPermissions("button:add")
	@ResponseBody
	public Object add() throws Exception {
		Map<String, Object> map = AjaxResult.success();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("BUTTON_ID", this.get32UUID());    //主键
		buttonService.save(pd);
		logService.save(Jurisdiction.getUsername(), "新增按钮：" + pd.getString("NAME"));                //记录日志
		return map;
	}

	/**
	 * 修改
	 */
	@PostMapping(value = "/edit")
	@RequiresPermissions("button:edit")
	@ResponseBody
	public Object edit() throws Exception {
		Map<String, Object> map = AjaxResult.success();
		PageData pd = new PageData();
		pd = this.getPageData();
		buttonService.edit(pd);
		logService.save(Jurisdiction.getUsername(), "修改按钮：" + pd.getString("NAME"));                //记录日志
		return map;
	}

	/**
	 * 去修改页面
	 */
	@RequestMapping(value = "/goEdit")
	@RequiresPermissions("button:edit")
	@ResponseBody
	public Object goEdit() throws Exception {
		PageData pd = new PageData();
		Map<String, Object> map = AjaxResult.success(0, "success");
		pd = this.getPageData();
		pd = buttonService.findById(pd);    //根据ID读取
		map.put("pd", pd);
		return map;
	}

	/**
	 * 删除
	 */
	@RequestMapping(value = "/delete")
	@ResponseBody
	@RequiresPermissions("button:del")
	public Object delete() throws Exception {
		Map<String, Object> map = AjaxResult.success();
		PageData pd = new PageData();
		pd = this.getPageData();
		buttonService.delete(pd);
		logService.save(Jurisdiction.getUsername(), "删除按钮的ID为：" + pd.getString("BUTTON_ID"));                //记录日志
		return map;
	}

	/**
	 * 批量删除
	 */
	@RequestMapping(value = "/deleteAll")
	@ResponseBody
	@RequiresPermissions("button:del")
	public Object deleteAll() throws Exception {
		Map<String, Object> map = AjaxResult.success();
		PageData pd = new PageData();
		pd = this.getPageData();
		String errInfo = "success";
		String DATA_IDS = pd.getString("DATA_IDS");
		if (Tools.notEmpty(DATA_IDS)) {
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			buttonService.deleteAll(ArrayDATA_IDS);
			logService.save(Jurisdiction.getUsername(), "批量删除按钮");                //记录日志
		} else {
			map = AjaxResult.error();
		}
		return map;
	}
}
