package com.fit.controller.act.hitask;

import com.fit.base.AjaxResult;
import com.fit.controller.act.AcBusinessController;
import com.fit.entity.Page;
import com.fit.entity.PageData;
import com.fit.service.act.RuprocdefService;
import com.fit.util.Jurisdiction;
import com.fit.util.Tools;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

/**
 * 已办任务
 */
@Controller
@RequestMapping("/hitask")
public class HiTaskController extends AcBusinessController {

	@Autowired
	private RuprocdefService ruprocdefService;

	/**
	 * 列表
	 */
	@RequestMapping(value = "/list")
	@RequiresPermissions("hitask:list")
	@ResponseBody
	public Object list(Page page) throws Exception {
		Map<String, Object> map = AjaxResult.success();
		PageData pd = new PageData();
		pd = this.getPageData();
		String KEYWORDS = pd.getString("KEYWORDS");                        //关键词检索条件
		if (Tools.notEmpty(KEYWORDS)) pd.put("keywords", KEYWORDS.trim());
		pd.put("USERNAME", Jurisdiction.getUsername());                //查询当前用户的任务(用户名查询)
		pd.put("RNUMBERS", Jurisdiction.getRnumbers());                //查询当前用户的任务(角色编码查询)
		page.setPd(pd);
		List<PageData> resultList = ruprocdefService.hitasklist(page);    //列出历史任务列表
		for (int i = 0; i < resultList.size(); i++) {
			Long ztime = Long.parseLong(resultList.get(i).get("DURATION_").toString());
			Long tian = ztime / (1000 * 60 * 60 * 24);
			Long shi = (ztime % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60);
			Long fen = (ztime % (1000 * 60 * 60 * 24)) % (1000 * 60 * 60) / (1000 * 60);
			Long miao = (ztime % (1000 * 60 * 60 * 24)) % (1000 * 60 * 60) % (1000 * 60) / 1000;
			resultList.get(i).put("ZTIME", tian + "天" + shi + "时" + fen + "分" + miao + "秒");
			resultList.get(i).put("INITATOR", getInitiator(resultList.get(i).getString("PROC_INST_ID_")));//流程申请人
		}
		map.put("data", resultList);
		map.put("count", page.getTotalResult());
		return map;
	}
}
