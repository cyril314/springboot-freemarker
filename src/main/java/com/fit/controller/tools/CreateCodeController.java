package com.fit.controller.tools;

import com.fit.base.AjaxResult;
import com.fit.base.IController;
import com.fit.entity.Page;
import com.fit.entity.PageData;
import com.fit.service.tools.CreateCodeService;
import com.fit.util.*;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import java.util.*;

/**
 * 代码生成器
 */
@Controller
@RequestMapping("/createCode")
public class CreateCodeController extends IController {

	@Autowired
	private CreateCodeService createCodeService;

	/**
	 * 列表
	 */
	@RequestMapping(value = "/list")
	@RequiresPermissions("createCode:list")
	@ResponseBody
	public Object list(Page page) throws Exception {
		Map<String, Object> map = AjaxResult.success();
		PageData pd = new PageData();
		pd = this.getPageData();
		String KEYWORDS = pd.getString("KEYWORDS");                        //关键词检索条件
		if (Tools.notEmpty(KEYWORDS)) pd.put("KEYWORDS", KEYWORDS.trim());
		page.setPd(pd);
		List<PageData> resultList = createCodeService.listPage(page);            //列出CreateCode列表
		map.put("data", resultList);
		map.put("count", page.getTotalResult());
		return map;
	}

	/**
	 * 去代码生成器页面(进入弹窗)
	 */
	@RequestMapping(value = "/goProductCode")
	@ResponseBody
	public Object goProductCode() throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		String errInfo = "success";
		PageData pd = new PageData();
		pd = this.getPageData();
		String CREATECODE_ID = pd.getString("CREATECODE_ID");
		if (!"add".equals(CREATECODE_ID)) {
			pd = createCodeService.findById(pd);
			map.put("pd", pd);

		}
		List<PageData> varList = createCodeService.listFa(); //列出所有主表结构的
		map.put("varList", varList);
		map.put("result", errInfo);
		return map;
	}

	/**
	 * 生成代码
	 */
	@RequestMapping(value = "/proCode")
	@ResponseBody
	public Object proCode() throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		String errInfo = "success";
		PageData pd = new PageData();
		pd = this.getPageData();
		save(pd);    //保存到数据库
		/* ============================================================================================= */
		String faobject = pd.getString("faobject");                //主表名				========参数0-1 主附结构用
		String HTYPE = pd.getString("HTYPE");                    //模块类型			========参数0-2 类型，单表、树形结构、主表明细表
		String TITLE = pd.getString("TITLE");                        //说明				========参数0
		String packageName = pd.getString("packageName");            //包名				========参数1
		String objectName = pd.getString("objectName");                //类名				========参数2
		String tabletop = pd.getString("tabletop");                    //表前缀				========参数3
		tabletop = null == tabletop ? "" : tabletop.toUpperCase();        //表前缀转大写

		List<String[]> fieldList = new ArrayList<String[]>();    //属性集合			========参数4
		String[] varData = pd.getString("varDatas").split("-FH-");    //接收过来的总参数集合
		for (int i = 0; i < varData.length; i++) {
			fieldList.add(varData[i].split(",fh,"));                //属性放到集合里面
		}

		Map<String, Object> root = new HashMap<String, Object>();        //创建数据模型
		root.put("fieldList", fieldList);
		root.put("faobject", faobject.toUpperCase());                //主附结构用，主表名
		root.put("TITLE", TITLE);                                    //说明
		root.put("packageName", packageName);                        //包名
		root.put("objectName", objectName);                            //类名
		root.put("objectNameLower", objectName.toLowerCase());        //类名(全小写)
		root.put("objectNameUpper", objectName.toUpperCase());        //类名(全大写)
		root.put("tabletop", tabletop);                                //表前缀
		root.put("nowDate", new Date());                            //当前日期

		DelFileUtil.delFolder(PathUtil.getProjectpath() + "admin/createcode"); //生成代码前,先清空之前生成的代码
		/* ============================================================================================= */
		String filePath = "admin/createcode/code/";                        //存放路径
		String ftlPath = "createOneCode";                                //ftl路径
		if ("tree".equals(HTYPE)) {
			ftlPath = "createTreeCode";
			/*生成实体类*/
			Freemarker.printFile("entityTemplate.ftl", root, "entity/" + packageName + "/" + objectName + ".java", filePath, ftlPath);
			/*生成html_tree页面*/
			Freemarker.printFile("html_tree_Template.ftl", root, "views/" + packageName + "/" + objectName.toLowerCase() + "/" + objectName.toLowerCase() + "_tree.html", filePath, ftlPath);
		} else if ("fathertable".equals(HTYPE)) {
			ftlPath = "createFaCode";    //主表
		} else if ("sontable".equals(HTYPE)) {
			ftlPath = "createSoCode";    //明细表
		}

		/*生成controller*/
		Freemarker.printFile("controllerTemplate.ftl", root, "controller/" + packageName + "/" + objectName + "Controller.java", filePath, ftlPath);
		/*生成serviceImpl*/
		Freemarker.printFile("serviceImplTemplate.ftl", root, "service/" + packageName + "/impl/" + objectName + "ServiceImpl.java", filePath, ftlPath);
		/*生成service*/
		Freemarker.printFile("serviceTemplate.ftl", root, "service/" + packageName + "/" + objectName + "Service.java", filePath, ftlPath);
		/*生成mapper*/
		Freemarker.printFile("mapperTemplate.ftl", root, "mapper/dsno1/" + packageName + "/" + objectName + "Mapper.java", filePath, ftlPath);

		/*生成mybatis xml*/
		Freemarker.printFile("xml_MysqlTemplate.ftl", root, "mybatis_mysql/" + packageName + "/" + objectName + "Mapper.xml", filePath, ftlPath);
		Freemarker.printFile("xml_OracleTemplate.ftl", root, "mybatis_oracle/" + packageName + "/" + objectName + "Mapper.xml", filePath, ftlPath);
		Freemarker.printFile("xml_SqlserverTemplate.ftl", root, "mybatis_sqlserver/" + packageName + "/" + objectName + "Mapper.xml", filePath, ftlPath);

		/*生成SQL脚本*/
		Freemarker.printFile("mysql_SQL_Template.ftl", root, "mysql数据库脚本/" + tabletop + objectName.toUpperCase() + ".sql", filePath, ftlPath);
		Freemarker.printFile("oracle_SQL_Template.ftl", root, "oracle数据库脚本/" + tabletop + objectName.toUpperCase() + ".sql", filePath, ftlPath);
		Freemarker.printFile("sqlserver_SQL_Template.ftl", root, "sqlserver数据库脚本/" + tabletop + objectName.toUpperCase() + ".sql", filePath, ftlPath);

		/*生成html页面*/
		Freemarker.printFile("html_list_Template.ftl", root, "views/" + packageName + "/" + objectName.toLowerCase() + "/" + objectName.toLowerCase() + "_list.html", filePath, ftlPath);
		Freemarker.printFile("html_edit_Template.ftl", root, "views/" + packageName + "/" + objectName.toLowerCase() + "/" + objectName.toLowerCase() + "_edit.html", filePath, ftlPath);

		/*生成说明文档*/
		Freemarker.printFile("docTemplate.ftl", root, "部署说明.doc", filePath, ftlPath);

		//this.print("oracle_SQL_Template.ftl", root);  控制台打印
		/*生成的全部代码压缩成zip文件*/
		if (FileZip.zip(PathUtil.getProjectpath() + "admin/createcode/code", PathUtil.getProjectpath() + "admin/createcode/code.zip")) {
			errInfo = "success";
		} else {
			errInfo = "errer";
		}

		map.put("result", errInfo);
		return map;
	}

	/**
	 * 下载代码
	 */
	@RequestMapping(value = "/downloadCode")
	public void downloadCode(HttpServletResponse response) throws Exception {
		/*下载代码*/
		FileDownload.fileDownload(response, PathUtil.getProjectpath() + "admin/createcode/code.zip", "code.zip");
	}

	/**
	 * 保存到数据库
	 */
	public void save(PageData pd) throws Exception {
		pd.put("PACKAGENAME", pd.getString("packageName"));    //包名
		pd.put("OBJECTNAME", pd.getString("objectName"));    //类名
		pd.put("TABLENAME", pd.getString("tabletop") + ",fh," + pd.getString("objectName").toUpperCase());    //表名
		pd.put("FIELDLIST", pd.getString("FIELDLIST"));        //属性集合
		pd.put("CREATETIME", DateUtil.getTime());            //创建时间
		pd.put("TITLE", pd.getString("TITLE"));                //说明
		pd.put("CREATECODE_ID", this.get32UUID());            //主键
		createCodeService.save(pd);
	}

	/**
	 * 通过ID获取数据
	 */
	@RequestMapping(value = "/findById")
	@ResponseBody
	public Object findById() throws Exception {
		Map<String, Object> map = AjaxResult.success(0, "success");
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			pd = createCodeService.findById(pd);
		} catch (Exception e) {
		}
		map.put("pd", pd);
		return map;
	}

	/**
	 * 删除
	 */
	@RequestMapping(value = "/delete")
	@ResponseBody
	public Object delete() throws Exception {
		Map<String, Object> map = AjaxResult.success(0, "success");
		PageData pd = new PageData();
		pd = this.getPageData();
		createCodeService.delete(pd);
		return map;
	}

	/**
	 * 批量删除
	 */
	@RequestMapping(value = "/deleteAll")
	@ResponseBody
	public Object deleteAll() throws Exception {
		Map<String, Object> map = AjaxResult.success(0, "success");
		PageData pd = new PageData();
		pd = this.getPageData();
		List<PageData> pdList = new ArrayList<PageData>();
		String DATA_IDS = pd.getString("DATA_IDS");
		if (Tools.notEmpty(DATA_IDS)) {
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			createCodeService.deleteAll(ArrayDATA_IDS);
		} else {
			map = AjaxResult.error(-1, "error");
		}
		pdList.add(pd);
		map.put("list", pdList);
		return map;
	}

}