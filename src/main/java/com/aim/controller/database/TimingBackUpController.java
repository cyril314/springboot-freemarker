package com.aim.controller.database;

import com.aim.base.AjaxResult;
import com.aim.base.IController;
import com.aim.entity.Page;
import com.aim.entity.PageData;
import com.aim.service.db.TimingBackUpService;
import com.aim.util.DateUtil;
import com.aim.util.DbUtil;
import com.aim.util.QuartzManager;
import com.aim.util.Tools;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 定时备份
 */
@Controller
@RequestMapping(value = "/timingbackup")
public class TimingBackUpController extends IController {

    private static String JOB_GROUP_NAME = "DB_JOBGROUP_NAME";                    //任务组
    private static String TRIGGER_GROUP_NAME = "DB_TRIGGERGROUP_NAME";            //触发器组

    @Autowired
    private TimingBackUpService timingBackUpService;

    /**
     * 保存
     */
    @RequestMapping(value = "/add")
    @RequiresPermissions("timingbackup:add")
    @ResponseBody
    public Object save() throws Exception {
        Map<String, Object> map = new HashMap<String, Object>();
        String errInfo = "success";
        PageData pd = new PageData();
        pd = this.getPageData();
        String JOBNAME = pd.getString("TABLENAME") + "_" + Tools.getRandomNum();    //任务名称
        String FTIME = pd.getString("FTIME");                                    //时间规则
        String TABLENAME = pd.getString("TABLENAME");                            //表名or整库(all)
        String TIMINGBACKUP_ID = this.get32UUID();
        pd.put("TIMINGBACKUP_ID", TIMINGBACKUP_ID);                                //主键
        pd.put("JOBNAME", JOBNAME);                                                //任务名称
        pd.put("CREATE_TIME", DateUtil.getTime());                    //创建时间
        pd.put("STATUS", "1");                                                    //状态
        timingBackUpService.save(pd);
        this.addJob(JOBNAME, FTIME, TABLENAME, TIMINGBACKUP_ID);                //添加任务
        map.put("result", errInfo);                //返回结果
        return map;
    }

    /**
     * 删除
     */
    @RequestMapping(value = "/delete")
    @RequiresPermissions("timingbackup:del")
    @ResponseBody
    public Object delete() throws Exception {
        Map<String, Object> map = new HashMap<String, Object>();
        String errInfo = "success";
        PageData pd = new PageData();
        pd = this.getPageData();
        this.removeJob(timingBackUpService.findById(pd).getString("JOBNAME"));    //删除任务
        timingBackUpService.delete(pd);                                            //删除数据库记录
        map.put("result", errInfo);                //返回结果
        return map;
    }

    /**
     * 修改
     */
    @RequestMapping(value = "/edit")
    @RequiresPermissions("timingbackup:edit")
    @ResponseBody
    public Object edit() throws Exception {
        Map<String, Object> map = new HashMap<String, Object>();
        String errInfo = "success";
        PageData pd = new PageData();
        pd = this.getPageData();
        this.removeJob(timingBackUpService.findById(pd).getString("JOBNAME"));    //删除任务(修改时可能会修改要备份的表，所以任务名称会改变，所以执行删除任务再新增任务来完成修改任务的效果)
        String JOBNAME = pd.getString("TABLENAME") + "_" + Tools.getRandomNum();    //任务名称
        String FTIME = pd.getString("FTIME");                                    //时间规则
        String TABLENAME = pd.getString("TABLENAME");                            //表名or整库(all)
        String TIMINGBACKUP_ID = pd.getString("TIMINGBACKUP_ID");                //任务数据库记录的ID
        this.addJob(JOBNAME, FTIME, TABLENAME, TIMINGBACKUP_ID);                //添加任务
        pd.put("JOBNAME", JOBNAME);                                                //任务名称
        pd.put("CREATE_TIME", DateUtil.getTime());                    //创建时间
        pd.put("STATUS", "1");                                                    //状态
        timingBackUpService.edit(pd);
        map.put("result", errInfo);                    //返回结果
        return map;
    }

    /**
     * 列表
     *
     *
     */
    @RequestMapping(value = "/list")
    @RequiresPermissions("timingbackup:list")
    @ResponseBody
    public Object list(Page page) throws Exception {
        Map<String, Object> map = AjaxResult.success();
        PageData pd = new PageData();
        pd = this.getPageData();
        String keywords = pd.getString("keywords");                    //关键词检索条件
        if (Tools.notEmpty(keywords)) pd.put("keywords", keywords.trim());
        String lastStart = pd.getString("lastStart");                //开始时间
        String lastEnd = pd.getString("lastEnd");                    //结束时间
        if (Tools.notEmpty(lastStart)) pd.put("lastStart", lastStart + " 00:00:00");
        if (Tools.notEmpty(lastEnd)) pd.put("lastEnd", lastEnd + " 00:00:00");
        page.setPd(pd);
        List<PageData> resultList = timingBackUpService.listPage(page);    //列出TimingBackUp列表
        map.put("data", resultList);
        map.put("count", page.getTotalResult());
        map.put("pd", pd);
        return map;
    }

    /**
     * 去新增页面
     */
    @RequestMapping(value = "/goAdd")
    @ResponseBody
    public Object goAdd() throws Exception {
        Map<String, Object> map = new HashMap<String, Object>();
        String errInfo = "success";
        Object[] arrOb = DbUtil.getTables();
        List<String> tblist = (List<String>) arrOb[1];
        map.put("varList", tblist);                //所有表
        map.put("dbType", arrOb[2]);            //数据库类型
        map.put("result", errInfo);                //返回结果
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
        Object[] arrOb = DbUtil.getTables();
        List<String> tblist = (List<String>) arrOb[1];
        map.put("varList", tblist);                    //所有表
        map.put("dbType", arrOb[2]);                //数据库类型
        pd = timingBackUpService.findById(pd);        //根据ID读取
        map.put("pd", pd);
        map.put("result", errInfo);                    //返回结果
        return map;
    }

    /**
     * 批量删除
     */
    @RequestMapping(value = "/deleteAll")
    @RequiresPermissions("timingbackup:del")
    @ResponseBody
    public Object deleteAll() throws Exception {
        Map<String, Object> map = new HashMap<String, Object>();
        String errInfo = "success";
        PageData pd = new PageData();
        pd = this.getPageData();
        String DATA_IDS = pd.getString("DATA_IDS");
        if (Tools.notEmpty(DATA_IDS)) {
            String ArrayDATA_IDS[] = DATA_IDS.split(",");
            for (int i = 0; i < ArrayDATA_IDS.length; i++) {
                pd.put("TIMINGBACKUP_ID", ArrayDATA_IDS[i]);
                this.removeJob(timingBackUpService.findById(pd).getString("JOBNAME"));    //删除任务
            }
            timingBackUpService.deleteAll(ArrayDATA_IDS);                                //删除数据库记录
        } else {
            errInfo = "error";
        }
        map.put("result", errInfo);                //返回结果
        return map;
    }

    /**
     * 切换状态
     */
    @RequestMapping(value = "/changeStatus")
    @RequiresPermissions("timingbackup:edit")
    @ResponseBody
    public Object changeStatus() throws Exception {
        Map<String, Object> map = new HashMap<String, Object>();
        String errInfo = "success";
        PageData pd = new PageData();
        pd = this.getPageData();
        int STATUS = Integer.parseInt(pd.get("STATUS").toString());
        pd = timingBackUpService.findById(pd);            //根据ID读取
        if (STATUS == 2) {
            pd.put("STATUS", 2);
            this.removeJob(pd.getString("JOBNAME"));    //删除任务
        } else {
            pd.put("STATUS", 1);
            String JOBNAME = pd.getString("JOBNAME");                        //任务名称
            String FTIME = pd.getString("FTIME");                            //时间规则
            String TABLENAME = pd.getString("TABLENAME");                    //表名or整库(all)
            String TIMINGBACKUP_ID = pd.getString("TIMINGBACKUP_ID");        //任务数据库记录的ID
            this.addJob(JOBNAME, FTIME, TABLENAME, TIMINGBACKUP_ID);        //添加任务
        }
        timingBackUpService.changeStatus(pd);
        map.put("result", errInfo);                //返回结果
        return map;
    }

    /**
     * 新增任务
     *
     * @param JOBNAME         任务名称
     * @param FTIME          时间规则
     * @param TABLENAME       传的参数
     * @param TIMINGBACKUP_ID 定时备份任务的ID
     */
    public void addJob(String JOBNAME, String FTIME, String TABLENAME, String TIMINGBACKUP_ID) {
        Map<String, Object> parameter = new HashMap<String, Object>();
        parameter.put("TABLENAME", TABLENAME);
        parameter.put("TIMINGBACKUP_ID", TIMINGBACKUP_ID);
        QuartzManager.addJob(JOBNAME, JOB_GROUP_NAME, JOBNAME, TRIGGER_GROUP_NAME, DbBackupQuartzJob.class, FTIME, parameter);
    }

    /**
     * 删除任务
     *
     * @param JOBNAME
     */
    public void removeJob(String JOBNAME) {
        QuartzManager.removeJob(JOBNAME, JOB_GROUP_NAME, JOBNAME, TRIGGER_GROUP_NAME);
    }
}
