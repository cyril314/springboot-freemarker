package com.fit.controller.act.procdef;

import com.fit.base.AjaxResult;
import com.fit.entity.Page;
import com.fit.entity.PageData;
import com.fit.controller.act.AcBaseController;
import com.fit.service.act.ProcdefService;
import com.fit.service.act.RuprocdefService;
import com.fit.util.*;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 流程管理
 */
@Controller
@RequestMapping("/procdef")
public class ProcdefController extends AcBaseController {

    @Autowired
    private ProcdefService procdefService;

    @Autowired
    private RuprocdefService ruprocdefService;

    /**
     * 列表
     */
    @RequestMapping(value = "/list")
    @RequiresPermissions("procdef:list")
    @ResponseBody
    public Object list(Page page) throws Exception {
        Map<String, Object> map = AjaxResult.success();
        PageData pd = new PageData();
        pd = this.getPageData();
        String KEYWORDS = pd.getString("KEYWORDS");                        //关键词检索条件
        if (Tools.notEmpty(KEYWORDS)) pd.put("keywords", KEYWORDS.trim());
        page.setPd(pd);
        List<PageData> resultList = procdefService.listPage(page);
        map.put("data", resultList);
        map.put("count", page.getTotalResult());
        return map;
    }

    /**
     * 获取预览XML
     */
    @RequestMapping(value = "/getViewXml")
    @RequiresPermissions("procdef:cha")
    @ResponseBody
    public Object getViewXml() throws Exception {
        Map<String, Object> map = new HashMap<String, Object>();
        String errInfo = "success";
        PageData pd = new PageData();
        pd = this.getPageData();
        String DEPLOYMENT_ID_ = pd.getString("DEPLOYMENT_ID_");        //部署ID
        createXmlAndPng(DEPLOYMENT_ID_);                            //生成XML和PNG
        String code = Tools.readTxtFile(Const.FILEACTIVITI + URLDecoder.decode(pd.getString("FILENAME"), "UTF-8"));
        map.put("code", code);
        map.put("result", errInfo);                //返回结果
        return map;
    }

    /**
     * 获取预览PNG
     */
    @RequestMapping(value = "/getViewPng")
    @RequiresPermissions("procdef:cha")
    @ResponseBody
    public Object getViewPng() throws Exception {
        Map<String, Object> map = new HashMap<String, Object>();
        String errInfo = "success";
        PageData pd = new PageData();
        pd = this.getPageData();
        String DEPLOYMENT_ID_ = pd.getString("DEPLOYMENT_ID_");        //部署ID
        createXmlAndPng(DEPLOYMENT_ID_);                            //生成XML和PNG
        String FILENAME = URLDecoder.decode(pd.getString("FILENAME"), "UTF-8");
        pd.put("FILENAME", FILENAME);
        String imgSrcPath = PathUtil.getProjectpath() + Const.FILEACTIVITI + FILENAME;
        map.put("imgSrc", "data:image/jpeg;base64," + ImageAnd64Binary.getImageStr(imgSrcPath)); //解决图片src中文乱码，把图片转成base64格式显示(这样就不用修改tomcat的配置了)
        map.put("result", errInfo);                //返回结果
        return map;
    }

    /**
     * 打包下载xml和png
     */
    @RequestMapping(value = "/download")
    @RequiresPermissions("procdef:add")
    public void download(HttpServletResponse response) throws Exception {
        PageData pd = new PageData();
        pd = this.getPageData();
        String DEPLOYMENT_ID_ = pd.getString("DEPLOYMENT_ID_");        //部署ID
        createXmlAndPng(DEPLOYMENT_ID_);                            //生成XML和PNG
        /*生成的全部代码压缩成zip文件*/
        if (FileZip.zip(PathUtil.getProjectpath() + "uploadFiles/activitiFile", PathUtil.getProjectpath() + "uploadFiles/activitiFile.zip")) {
            /*下载代码*/
            FileDownload.fileDownload(response, PathUtil.getProjectpath() + "uploadFiles/activitiFile.zip", "activitiFile.zip");
        }
    }

    /**
     * 激活or挂起流程实例
     */
    @RequestMapping(value = "/onoffPro")
    @RequiresPermissions("procdef:edit")
    @ResponseBody
    public Object onoffProcessDefinition() throws Exception {
        Map<String, Object> map = new HashMap<String, Object>();
        String errInfo = "success";
        PageData pd = new PageData();
        pd = this.getPageData();
        int STATUS = Integer.parseInt(pd.get("STATUS").toString());
        String ID_ = pd.getString("ID_");
        if (STATUS == 2) {
            pd.put("STATUS", 1);                //挂起前先把此流程的所有任务状态设置成激活状态
            ruprocdefService.onoffAllTask(pd);
            suspendProcessDefinitionById(ID_);    //挂起流程实例
        } else {
            pd.put("STATUS", 2);                //激活前先把此流程的所有任务状态设置成挂起状态
            ruprocdefService.onoffAllTask(pd);
            activateProcessDefinitionById(ID_);    //激活流程实例
        }
        map.put("result", errInfo);                //返回结果
        return map;
    }

    /**
     * 导入流程
     *
     * @param file
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/uploadPro")
    @RequiresPermissions("procdef:add")
    @ResponseBody
    public Object uploadPro(@RequestParam(value = "zip", required = false) MultipartFile file) {
        Map<String, Object> map = new HashMap<String, Object>();
        String errInfo = "success";
        if (null != file && !file.isEmpty()) {
            String filePath = PathUtil.getProjectpath() + Const.FILEACTIVITI;        //文件上传路径
            String fileName = FileUpload.fileUp(file, filePath, "proFile");        //执行上传
            try {
                deploymentProcessDefinitionFromZip("FHPRO", filePath + fileName);
            } catch (Exception e) {
                errInfo = "errer";
            }
        }
        map.put("result", errInfo);                //返回结果
        return map;
    }

    /**
     * 删除
     */
    @RequestMapping(value = "/delete")
    @RequiresPermissions("procdef:del")
    @ResponseBody
    public Object delete() throws Exception {
        Map<String, String> map = new HashMap<String, String>();
        PageData pd = new PageData();
        pd = this.getPageData();
        String DEPLOYMENT_ID_ = pd.getString("DEPLOYMENT_ID_");          //部署ID
        deleteDeployment(DEPLOYMENT_ID_);
        map.put("result", "success");
        return map;
    }

    /**
     * 批量删除
     */
    @RequestMapping(value = "/deleteAll")
    @RequiresPermissions("procdef:del")
    @ResponseBody
    public Object deleteAll() throws Exception {
        Map<String, Object> map = new HashMap<String, Object>();
        PageData pd = new PageData();
        pd = this.getPageData();
        String errInfo = "success";
        String DATA_IDS = pd.getString("DATA_IDS");
        if (Tools.notEmpty(DATA_IDS)) {
            String ArrayDATA_IDS[] = DATA_IDS.split(",");
            for (int i = 0; i < ArrayDATA_IDS.length; i++) {
                deleteDeployment(ArrayDATA_IDS[i]);
            }
        } else {
            errInfo = "error";
        }
        map.put("result", errInfo);                //返回结果
        return map;
    }
}
