package com.aim.controller.imsn;

import com.aim.base.AjaxResult;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import com.aim.base.IController;
import com.aim.entity.Page;
import com.aim.entity.PageData;
import com.aim.service.im.FgroupService;
import com.aim.util.Jurisdiction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 好友分组
 */
@Controller
@RequestMapping("/fgroup")
public class FgroupController extends IController {

	@Autowired
	private FgroupService fgroupService;

	/**
	 * 保存
	 */
	@RequestMapping(value = "/add")
	@RequiresPermissions("fgroup:add")
	@ResponseBody
	public Object save() throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		String errInfo = "success";
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("FGROUP_ID", this.get32UUID());            //主键
		pd.put("USERNAME", Jurisdiction.getUsername());    //用户名
		fgroupService.save(pd);
		map.put("result", errInfo);                //返回结果
		return map;
	}

	/**
	 * 删除
	 */
	@RequestMapping(value = "/delete")
	@RequiresPermissions("fgroup:del")
	@ResponseBody
	public Object delete() throws Exception {
		Map<String, Object> map = AjaxResult.success();
		PageData pd = new PageData();
		pd = this.getPageData();
		fgroupService.delete(pd);
		return map;
	}

	/**
	 * 修改
	 */
	@RequestMapping(value = "/edit")
	@RequiresPermissions("fgroup:edit")
	@ResponseBody
	public Object edit() throws Exception {
		Map<String, Object> map = AjaxResult.success();
		PageData pd = new PageData();
		pd = this.getPageData();
		fgroupService.edit(pd);
		return map;
	}

	/**
	 * 列表
	 */
	@RequestMapping(value = "/list")
	@RequiresPermissions("fgroup:list")
	@ResponseBody
	public Object list(Page page) throws Exception {
		Map<String, Object> map = AjaxResult.success();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("USERNAME", Jurisdiction.getUsername());
		page.setPd(pd);
		List<PageData> resultList = fgroupService.listPage(page);    //列出Fgroup列表
		map.put("data", resultList);
		map.put("count", page.getTotalResult());
		map.put("pd", pd);
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
		pd = fgroupService.findById(pd);    //根据ID读取
		map.put("pd", pd);
		map.put("result", errInfo);                //返回结果
		return map;
	}

	/**
	 * 获取分组列表
	 */
	@RequestMapping(value = "/getFgroup")
	@ResponseBody
	public Object getLevels() throws Exception {
		Map<String, Object> map = AjaxResult.success();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("USERNAME", Jurisdiction.getUsername());    //用户名
		List<PageData> resultList = fgroupService.listAll(pd);
		map.put("list", resultList);
		return map;
	}

}
