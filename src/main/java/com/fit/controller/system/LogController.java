package com.fit.controller.system;

import com.fit.base.AjaxResult;
import com.fit.base.IController;
import com.fit.entity.Page;
import com.fit.entity.PageData;
import com.fit.service.system.LogService;
import com.fit.util.Tools;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

/**
 * 操作日志记录处理类
 */
@Controller
@RequestMapping("/log")
public class LogController extends IController {

	@Autowired
	private LogService logService;

	/**
	 * 列表
	 */
	@RequestMapping(value = "/list")
	@RequiresPermissions("log:list")
	@ResponseBody
	public Object list(Page page) throws Exception {
		Map<String, Object> map = AjaxResult.success();
		PageData pd = new PageData();
		pd = this.getPageData();
		String KEYWORDS = pd.getString("KEYWORDS"); //关键词检索条件
		if (Tools.notEmpty(KEYWORDS)) pd.put("KEYWORDS", KEYWORDS.trim());
		page.setPd(pd);
		List<PageData> varList = logService.listPage(page); //列出log列表
		map.put("data", varList);
		map.put("count", page.getTotalResult());
		map.put("pd", pd);
		return map;
	}

	/**
	 * 删除
	 */
	@RequestMapping(value = "/delete")
	@RequiresPermissions("log:del")
	@ResponseBody
	public Object delete() throws Exception {
		Map<String, Object> map = AjaxResult.success();
		PageData pd = new PageData();
		pd = this.getPageData();
		logService.delete(pd);
		map.put("data", "删除成功");
		return map;
	}

	/**
	 * 批量删除
	 */
	@RequestMapping(value = "/deleteAll")
	@RequiresPermissions("log:del")
	@ResponseBody
	public Object deleteAll() throws Exception {
		Map<String, Object> map = AjaxResult.success();
		PageData pd = new PageData();
		pd = this.getPageData();
		String DATA_IDS = pd.getString("DATA_IDS");
		if (null != DATA_IDS && !"".equals(DATA_IDS)) {
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			logService.deleteAll(ArrayDATA_IDS);
			map.put("data", "批量删除成功");
		} else {
			map.put("result", "error"); //返回结果
			map.put("data", "删除失败");
		}
		return map;
	}
}
