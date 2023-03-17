package com.aim.controller.act.ruprocdef;

import com.aim.base.AjaxResult;
import com.aim.entity.Page;
import com.aim.entity.PageData;
import com.aim.controller.act.AcBusinessController;
import com.aim.service.act.HiprocdefService;
import com.aim.service.act.RuprocdefService;
import com.aim.service.system.SmsService;
import com.aim.util.DateUtil;
import com.aim.util.Jurisdiction;
import com.aim.util.Tools;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.net.URLDecoder;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * 正在运行的流程
 */
@Controller
@RequestMapping(value = "/ruprocdef")
public class RuprocdefController extends AcBusinessController {

	@Autowired
	private RuprocdefService ruprocdefService;

	@Autowired
	private SmsService smsService;

	@Autowired
	private HiprocdefService hiprocdefService;

	/**
	 * 列表
	 */
	@RequestMapping(value = "/list")
	@RequiresPermissions("ruprocdef:list")
	@ResponseBody
	public Object list(Page page) throws Exception {
		Map<String, Object> map = AjaxResult.success();
		PageData pd = new PageData();
		pd = this.getPageData();
		String KEYWORDS = pd.getString("KEYWORDS");                        //关键词检索条件
		if (Tools.notEmpty(KEYWORDS)) pd.put("keywords", KEYWORDS.trim());
		page.setPd(pd);
		List<PageData> resultList = ruprocdefService.listPage(page);            //列出Ruprocdef列表
		for (int i = 0; i < resultList.size(); i++) {
			resultList.get(i).put("INITATOR", getInitiator(resultList.get(i).getString("PROC_INST_ID_")));//流程申请人
		}
		map.put("data", resultList);
		map.put("count", page.getTotalResult());
		return map;
	}

	/**
	 * 委派
	 */
	@RequestMapping(value = "/delegate")
	@RequiresPermissions("Delegate")
	@ResponseBody
	public Object delegate() throws Exception {
		Map<String, Object> zmap = new HashMap<String, Object>();
		String errInfo = "success";
		PageData pd = new PageData();
		pd = this.getPageData();
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("审批结果", " 任务由 [" + Jurisdiction.getUsername() + "] 委派  ");    //审批结果中记录委派
		setVariablesByTaskIdAsMap(pd.getString("ID_"), map);                        //设置流程变量
		setAssignee(pd.getString("ID_"), pd.getString("ASSIGNEE_"));
		zmap.put("ASSIGNEE_", pd.getString("ASSIGNEE_"));                        //用于给待办人发送新任务消息
		zmap.put("result", errInfo);                //返回结果
		return zmap;
	}

	/**
	 * 激活or挂起任务
	 */
	@RequestMapping(value = "/onoffTask")
	@RequiresPermissions("ruprocdef:edit")
	@ResponseBody
	public Object onoffTask() throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		String errInfo = "success";
		PageData pd = new PageData();
		pd = this.getPageData();
		ruprocdefService.onoffTask(pd);
		map.put("result", errInfo);                        //返回结果
		return map;
	}

	/**
	 * 作废流程
	 */
	@RequestMapping(value = "/delete")
	@RequiresPermissions("Abolish")
	@ResponseBody
	public Object delete() throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		String errInfo = "success";
		PageData pd = new PageData();
		pd = this.getPageData();
		String reason = "【作废】" + Jurisdiction.getName() + "：" + URLDecoder.decode(pd.getString("reason"), "UTF-8");    //作废原因
		/**任务结束时发站内信通知审批结束*/
		List<PageData> hivarList = hiprocdefService.hivarList(pd);            //列出历史流程变量列表
		for (int i = 0; i < hivarList.size(); i++) {
			if ("USERNAME".equals(hivarList.get(i).getString("NAME_"))) {
				sendSms(hivarList.get(i).getString("TEXT_"));
				break;
			}
		}
		deleteProcessInstance(pd.getString("PROC_INST_ID_"), reason);        //作废流程
		map.put("result", errInfo);
		return map;
	}

	/**
	 * 发站内信通知审批结束
	 */
	public void sendSms(String USERNAME) throws Exception {
		PageData pd = new PageData();
		pd.put("SANME_ID", this.get32UUID());            //ID
		pd.put("SEND_TIME", DateUtil.getTime());        //发送时间
		pd.put("SMS_ID", this.get32UUID());            //主键
		pd.put("TYPE", "1");                            //类型1：收信
		pd.put("FROM_USERNAME", USERNAME);                //收信人
		pd.put("TO_USERNAME", "系统消息");
		pd.put("CONTENT", "您申请的任务已经被作废,请到已办任务列表查看");
		pd.put("STATUS", "2");
		smsService.save(pd);
	}
}