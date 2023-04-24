package com.fit.controller.database;

import com.fit.base.AjaxResult;
import com.fit.base.IController;
import com.fit.entity.Page;
import com.fit.entity.PageData;
import com.fit.service.db.BRdbService;
import com.fit.util.*;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 数据库管理(备份和还原)
 */
@Controller
@RequestMapping("/brdb")
public class BRdbController extends IController {

	@Autowired
	private BRdbService bRdbService;

	/**
	 * 列出所有表
	 */
	@RequestMapping(value = "/listAllTable")
	@RequiresPermissions("brdb:listAllTable")
	@ResponseBody
	public Object listAllTable() throws Exception {
		Map<String, Object> map = AjaxResult.success();
		Object[] arrOb = DbUtil.getTables();
		List<String> tblist = (List<String>) arrOb[1];
		List<List<String>> resultList = new ArrayList<List<String>>();
		List<String> list = null;
		for (int i = 0; i < tblist.size(); i++) {
			if (i % 2 == 0) {
				list = new ArrayList<String>();
			}
			list.add(tblist.get(i));
			if ((i + 1) % 2 == 0 || (i + 1) == tblist.size()) {
				resultList.add(list);
			}
		}
		map.put("data", resultList);    //所有表
		map.put("dbType", arrOb[2]);    //数据库类型
		map.put("databaseName", arrOb[0]);  //数据库名
		return map;
	}

	/**
	 * 备份全库
	 */
	@RequestMapping(value = "/backupAll")
	@RequiresPermissions("brdb:add")
	@ResponseBody
	public Object backupAll() throws Exception {
		Map<String, Object> map = AjaxResult.success();
		String username = Jurisdiction.getUsername();
		PageData pd = new PageData();
		pd = this.getPageData();
		String kackupPath;
		kackupPath = DbUtil.getDbUtil().backup("").toString();            //调用数据库备份
		if (Tools.notEmpty(kackupPath) && !"errer".equals(kackupPath)) {
			pd.put("DB_ID", this.get32UUID());  //主键
			pd.put("USERNAME", username);   //操作用户
			pd.put("BACKUP_TIME", DateUtil.getTime());  //备份时间
			pd.put("TABLENAME", "整库");  //表名
			pd.put("SQLPATH", kackupPath);                            //存储位置
			pd.put("DBSIZE", FileUtil.getFilesize(kackupPath));        //文件大小
			pd.put("TYPE", 1);                                        //1: 备份整库，2：备份某表
			pd.put("BZ", username + "备份全库操作");                    //备注
			try {
				bRdbService.save(pd);
			} catch (Exception e) {
				map.put("result", "error");
			}
		} else {
			map.put("result", "error");
		}
		return map;
	}

	/**
	 * 备份单表
	 */
	@RequestMapping(value = "/backupTable")
	@ResponseBody
	@RequiresPermissions("brdb:add")
	public Object backupTable() throws Exception {
		Map<String, Object> map = AjaxResult.success();
		PageData pd = new PageData();
		pd = this.getPageData();
		String username = Jurisdiction.getUsername();
		String TABLENAME = pd.getString("fhtable");                    //页面ajax传过来的表名
		String kackupPath;
		kackupPath = DbUtil.getDbUtil().backup(TABLENAME).toString();    //调用数据库备份
		if (Tools.notEmpty(kackupPath) && !"errer".equals(kackupPath)) {
			pd.put("DB_ID", this.get32UUID());                //主键
			pd.put("USERNAME", username);                        //操作用户
			pd.put("BACKUP_TIME", DateUtil.getTime());    //备份时间
			pd.put("TABLENAME", TABLENAME);                        //表名
			pd.put("SQLPATH", kackupPath);                        //存储位置
			pd.put("DBSIZE", FileUtil.getFilesize(kackupPath));    //文件大小
			pd.put("TYPE", 2);                                    //1: 备份整库，2：备份某表
			pd.put("BZ", username + "备份单表");                    //备注
			try {
				bRdbService.save(pd);
			} catch (Exception e) {
				map.put("result", "error");
			}
		} else {
			map.put("result", "error");
		}
		return map;
	}

	/**
	 * 数据还原操作
	 */
	@RequestMapping(value = "/dbRecover")
	@ResponseBody
	@RequiresPermissions("brdb:edit")
	public Object dbRecover() throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		String errInfo = "success";
		PageData pd = new PageData();
		pd = this.getPageData();
		String TABLENAME = pd.getString("TABLENAME");            //页面ajax传过来的表名或数据库名
		String SQLPATH = pd.getString("SQLPATH");                //页面ajax传过来的备份文件完整路径
		String returnStr = DbUtil.getDbUtil().recover(TABLENAME, SQLPATH).toString();
		if ("ok".equals(returnStr)) {
			errInfo = "success";
		} else {
			errInfo = "error";
		}
		map.put("result", errInfo);                //返回结果
		return map;
	}

	/**
	 * 删除
	 */
	@RequestMapping(value = "/delete")
	@ResponseBody
	@RequiresPermissions("brdb:del")
	public Object delete() throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		String errInfo = "success";
		PageData pd = new PageData();
		pd = this.getPageData();
		bRdbService.delete(pd);
		map.put("result", errInfo);                //返回结果
		return map;
	}

	/**
	 * 修改
	 */
	@RequestMapping(value = "/edit")
	@RequiresPermissions("brdb:edit")
	@ResponseBody
	public Object edit() throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		String errInfo = "success";
		PageData pd = new PageData();
		pd = this.getPageData();
		bRdbService.edit(pd);
		map.put("result", errInfo);                //返回结果
		return map;
	}

	/**
	 * 列表
	 */
	@RequestMapping(value = "/list")
	@RequiresPermissions("brdb:list")
	@ResponseBody
	public Object list(Page page) throws Exception {
		Map<String, Object> map = AjaxResult.success();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");                        //关键词检索条件
		if (Tools.notEmpty(keywords)) pd.put("keywords", keywords.trim());
		page.setPd(pd);
		List<PageData> resultList = bRdbService.listPage(page);            //列出db列表
		Map<String, String> DBmap = DbUtil.getDBParameter();
		map.put("data", resultList);
		map.put("count", page.getTotalResult());
		map.put("pd", pd);
		map.put("dbType", DBmap.get("dbType").toString());        //数据库类型
		map.put("remoteDB", DBmap.get("remoteDB").toString());    //是否远程备份数据库 yes or no
		return map;
	}

	/**
	 * 去修改页面
	 */
	@RequestMapping(value = "/goEdit")
	@RequiresPermissions("brdb:edit")
	@ResponseBody
	public Object goEdit() throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		String errInfo = "success";
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = bRdbService.findById(pd);    //根据ID读取
		map.put("pd", pd);
		map.put("result", errInfo);                //返回结果
		return map;
	}

	/**
	 * 批量删除
	 */
	@RequestMapping(value = "/deleteAll")
	@RequiresPermissions("brdb:del")
	@ResponseBody
	public Object deleteAll() throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		String errInfo = "success";
		PageData pd = new PageData();
		pd = this.getPageData();
		String DATA_IDS = pd.getString("DATA_IDS");
		if (Tools.notEmpty(DATA_IDS)) {
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			bRdbService.deleteAll(ArrayDATA_IDS);
		} else {
			errInfo = "error";
		}
		map.put("result", errInfo);                //返回结果
		return map;
	}

}
