package com.fit.controller.tools;

import com.fit.base.AjaxResult;
import com.fit.base.IController;
import com.fit.entity.PageData;
import com.fit.util.DbUtil;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 代码生成器(反向生成)
 */
@Controller
@RequestMapping("/recreateCode")
public class ReverseCreateCodeController extends IController {

	/**
	 * 列出所有表
	 */
	@RequestMapping(value = "/listAllTable")
	@RequiresPermissions("recreateCode:list")
	@ResponseBody
	public Object listAllTable() {
		Map<String, Object> map = AjaxResult.success();
		List<String> resultList = new ArrayList<String>();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			Object[] arrOb = DbUtil.getTables(pd);
			resultList = (List<String>) arrOb[1];
		} catch (Exception e) {
			map.put("result", "errer");
			e.printStackTrace();
		}
		map.put("data", resultList);
		return map;
	}

	/**
	 * 在代码生成器页面获取字段属性集合(反向进入弹窗)
	 */
	@RequestMapping(value = "/getFieldlist")
	@ResponseBody
	public Object getFieldlist() throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		String errInfo = "success";
		PageData pd = new PageData();
		pd = this.getPageData();
		String fieldType = "";
		StringBuffer sb = new StringBuffer("");
		List<Map<String, String>> columnList = DbUtil.getFieldParameterList(DbUtil.getConn(pd), pd.getString("table"), pd.getString("dbtype")); //读取字段信息
		for (int i = 0; i < columnList.size(); i++) {
			Map<String, String> fmap = columnList.get(i);
			sb.append(fmap.get("fieldNanme").toString().toUpperCase());                    //字段名称
			sb.append(",fh,");
			fieldType = fmap.get("fieldType").toString().toLowerCase();                    //字段类型
			if (fieldType.contains("int")) {
				sb.append("Integer");
			} else if (fieldType.contains("NUMBER")) {
				if (Integer.parseInt(fmap.get("fieldSccle")) > 0) {
					sb.append("Double");
				} else {
					sb.append("Integer");
				}
			} else if (fieldType.contains("double") || fieldType.contains("numeric")) {
				sb.append("Double");
			} else if (fieldType.contains("date")) {
				sb.append("Date");
			} else {
				sb.append("String");
			}
			sb.append(",fh,");
			if ("".equals(fmap.get("fieldComment").toString())) {
				sb.append("备注" + (i + 1));                                                    //当字段没有注释的时候用'备注'代替
			} else {
				sb.append(fmap.get("fieldComment").toString());                            //字段注释
			}
			sb.append(",fh,");
			sb.append("是");                                                                //是否前台录入
			sb.append(",fh,");
			sb.append("无");                                                                //默认值
			sb.append(",fh,");
			sb.append(fmap.get("fieldLength").toString());                                //长度
			sb.append(",fh,");
			sb.append(fmap.get("fieldSccle").toString());                                //小数点右边的位数
			sb.append(",fh,");
			sb.append("null");
			sb.append("Q313596790");
		}
		map.put("FIELDLIST", sb.toString());
		map.put("result", errInfo);
		return map;
	}
}
