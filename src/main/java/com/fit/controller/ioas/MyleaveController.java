package com.fit.controller.ioas;

import com.fit.base.AjaxResult;
import com.fit.controller.act.AcStartController;
import com.fit.entity.Page;
import com.fit.entity.PageData;
import com.fit.service.oa.MyleaveService;
import com.fit.util.Jurisdiction;
import com.fit.util.Tools;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * 请假申请
 */
@Controller
@RequestMapping("/myleave")
public class MyleaveController extends AcStartController {

	@Autowired
	private MyleaveService myleaveService;

	/**
	 * 保存请假单
	 */
	@RequestMapping(value = "/add")
	@RequiresPermissions("myleave:add")
	@ResponseBody
	public Object add() {
		Map<String, Object> zmap = AjaxResult.success();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("MYLEAVE_ID", this.get32UUID());                    //主键
		pd.put("USERNAME", Jurisdiction.getUsername());            //用户名
		try {
			/** 工作流的操作 **/
			Map<String, Object> map = new LinkedHashMap<String, Object>();
			map.put("请假人员", Jurisdiction.getName());            //当前用户的姓名
			map.put("开始时间", pd.getString("STARTTIME"));
			map.put("结束时间", pd.getString("ENDTIME"));
			map.put("请假时长", pd.getString("WHENLONG"));
			map.put("请假类型", pd.getString("TYPE"));
			map.put("请假事由", pd.getString("REASON"));
			map.put("USERNAME", Jurisdiction.getUsername());            //指派代理人为当前用户
			startProcessInstanceByKeyHasVariables("KEY_leave", map);        //启动流程实例(请假单流程)通过KEY
			//startProcessInstanceByKeyHasVariables("KEY_finance",map);

			myleaveService.save(pd);                                    //记录存入数据库
			zmap.put("ASSIGNEE_", Jurisdiction.getUsername());            //用于给待办人发送新任务消息
		} catch (Exception e) {
			zmap.put("result", "errer");                //返回结果
		}
		return zmap;
	}

	/**
	 * 列表
	 */
	@RequestMapping(value = "/list")
	@RequiresPermissions("myleave:list")
	@ResponseBody
	public Object list(Page page) throws Exception {
		Map<String, Object> map = AjaxResult.success();
		PageData pd = new PageData();
		pd = this.getPageData();
		String KEYWORDS = pd.getString("KEYWORDS");                //关键词检索条件
		if (Tools.notEmpty(KEYWORDS)) pd.put("keywords", KEYWORDS.trim());
		pd.put("USERNAME", "admin".equals(Jurisdiction.getUsername()) ? "" : Jurisdiction.getUsername()); //除admin用户外，只能查看自己的数据
		page.setPd(pd);
		List<PageData> resultList = myleaveService.listPage(page);    //列出Myleave列表
		map.put("data", resultList);
		map.put("count", page.getTotalResult());
		return map;
	}

	/**
	 * 删除
	 */
	@RequestMapping(value = "/delete")
	@RequiresPermissions("myleave:del")
	@ResponseBody
	public Object delete() throws Exception {
		Map<String, Object> map = AjaxResult.success();
		PageData pd = new PageData();
		pd = this.getPageData();
		myleaveService.delete(pd);
		return map;
	}

	/**
	 * 批量删除
	 */
	@RequestMapping(value = "/deleteAll")
	@RequiresPermissions("myleave:del")
	@ResponseBody
	public Object deleteAll() throws Exception {
		Map<String, Object> map = AjaxResult.success();
		PageData pd = new PageData();
		pd = this.getPageData();
		String DATA_IDS = pd.getString("DATA_IDS");
		if (Tools.notEmpty(DATA_IDS)) {
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			myleaveService.deleteAll(ArrayDATA_IDS);
		} else {
			map.put("result", "error");                //返回结果
		}
		return map;
	}
}

