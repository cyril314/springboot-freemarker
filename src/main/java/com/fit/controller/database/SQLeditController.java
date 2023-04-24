package com.fit.controller.database;

import com.fit.base.AjaxResult;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import com.fit.base.IController;
import com.fit.entity.PageData;
import com.fit.util.DbUtil;
import com.fit.util.ObjectExcelView;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * SQL编辑器
 */
@Controller
@RequestMapping(value = "/sqledit")
public class SQLeditController extends IController {

	/**
	 * 进入页面
	 */
	@RequestMapping(value = "/view")
	@RequiresPermissions("sqledit:view")
	public String view() throws Exception {
		return "fhdb/sqledit/sql_edit";
	}

	/**
	 * 执行查询语句
	 */
	@RequestMapping(value = "/executeQuery")
	@ResponseBody
	@RequiresPermissions("sqledit:cha")
	public Object executeQuery() {
		Map<String, Object> map = AjaxResult.success();
		PageData pd = new PageData();
		pd = this.getPageData();
		String sql = pd.getString("sql"); //前台传过来的sql语句
		List<String> columnList = new ArrayList<String>();                //存放字段名
		List<List<Object>> dataList = new ArrayList<List<Object>>();    //存放数据(从数据库读出来的一条条的数据)
		long startTime = System.currentTimeMillis();                    //请求起始时间_毫秒
		Object[] arrOb = null;
		try {
			arrOb = DbUtil.executeQuery(sql);
			long endTime = System.currentTimeMillis();                        //请求结束时间_毫秒
			map.put("rTime", String.valueOf((endTime - startTime) / 1000.000));            //存入数据库查询时间
			if (null != arrOb) {
				columnList = (List<String>) arrOb[0];
				dataList = (List<List<Object>>) arrOb[1];
			} else {
				throw new Exception("查询失败");
			}
		} catch (Exception e) {
			map.put("result", "error");
		}
		map.put("columnList", columnList);    //存放字段名
		map.put("dataList", dataList);        //存放数据(从数据库读出来的一条条的数据)
		return map;
	}

	/**
	 * 执行 INSERT、UPDATE 或 DELETE
	 */
	@RequestMapping(value = "/executeUpdate")
	@ResponseBody
	@RequiresPermissions("sqledit:edit")
	public Object executeUpdate() {
		Map<String, Object> map = AjaxResult.success();
		PageData pd = new PageData();
		pd = this.getPageData();
		String sql = pd.getString("sql");                                    //前台传过来的sql语句
		long startTime = System.currentTimeMillis();                        //请求起始时间_毫秒
		try {
			DbUtil.executeUpdate(sql);
		} catch (ClassNotFoundException | SQLException e) {
			map.put("result", "error");
			e.printStackTrace();
		}
		long endTime = System.currentTimeMillis();                            //请求结束时间_毫秒
		map.put("rTime", String.valueOf((endTime - startTime) / 1000.000));    //存入数据库查询时间
		return map;
	}

	/**
	 * 导出数据到EXCEL
	 */
	@RequestMapping(value = "/excel")
	@RequiresPermissions("toExcel")
	public ModelAndView exportExcel() {
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String sql = pd.getString("sql"); //前台传过来的sql语句
		List<String> columnList = new ArrayList<String>();                //存放字段名
		List<List<Object>> dataList = new ArrayList<List<Object>>();    //存放数据(从数据库读出来的一条条的数据)
		Object[] arrOb = null;
		try {
			arrOb = DbUtil.executeQuery(sql);
			if (null != arrOb) {
				columnList = (List<String>) arrOb[0];
				dataList = (List<List<Object>>) arrOb[1];
			} else {
				return null;
			}
		} catch (Exception e) {
			return null;
		}
		Map<String, Object> dataMap = new HashMap<String, Object>();
		List<String> titles = new ArrayList<String>();
		for (int i = 0; i < columnList.size(); i++) {
			titles.add(columnList.get(i).toString());                        //字段名当标题
		}
		dataMap.put("titles", titles);
		List<PageData> varList = new ArrayList<PageData>();
		for (int i = 0; i < dataList.size(); i++) {
			PageData vpd = new PageData();
			for (int j = 0; j < dataList.get(i).size(); j++) {
				if (null == dataList.get(i) || null == dataList.get(i).get(j)) {
					vpd.put("var" + (j + 1), "");                                    //赋值
				} else {
					vpd.put("var" + (j + 1), dataList.get(i).get(j).toString());    //赋值
				}
			}
			varList.add(vpd);
		}
		dataMap.put("varList", varList);
		ObjectExcelView erv = new ObjectExcelView();                        //执行excel操作
		mv = new ModelAndView(erv, dataMap);
		return mv;
	}
}
