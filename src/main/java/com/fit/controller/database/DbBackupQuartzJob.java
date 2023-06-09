package com.fit.controller.database;

import com.fit.base.IController;
import com.fit.entity.PageData;
import com.fit.mapper.master.db.TimingBackUpMapper;
import com.fit.service.db.BRdbService;
import com.fit.util.*;
import org.quartz.Job;
import org.quartz.JobDataMap;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

import java.util.Map;

/**
 * quartz 定时任务调度 数据库自动备份工作域
 */
public class DbBackupQuartzJob extends IController implements Job {

    @Override
    public void execute(JobExecutionContext context) throws JobExecutionException {
        JobDataMap dataMap = context.getJobDetail().getJobDataMap();
        Map<String, Object> parameter = (Map<String, Object>) dataMap.get("parameterList");    //获取参数
        String TABLENAME = parameter.get("TABLENAME").toString();
        TABLENAME = TABLENAME.equals("all") ? "" : TABLENAME;

        //普通类从spring容器中拿出service
        BRdbService brdbService = (BRdbService) SpringUtil.getBean("bRdbServiceImpl");
        PageData pd = new PageData();
        try {
            String kackupPath = DbUtil.getDbUtil().backup(TABLENAME).toString();//调用数据库备份
            if (Tools.notEmpty(kackupPath) && !"errer".equals(kackupPath)) {
                pd.put("DB_ID", this.get32UUID());                        //主键
                pd.put("USERNAME", "系统");                                    //操作用户
                pd.put("BACKUP_TIME", DateUtil.getTime());            //备份时间
                pd.put("TABLENAME", TABLENAME.equals("") ? "整库" : TABLENAME);    //表名or整库
                pd.put("SQLPATH", kackupPath);                                //存储位置
                pd.put("DBSIZE", FileUtil.getFilesize(kackupPath));            //文件大小
                pd.put("TYPE", TABLENAME.equals("") ? 1 : 2);                    //1: 备份整库，2：备份某表
                pd.put("BZ", "定时备份操作");                                //备注
                brdbService.save(pd);                                        //存入备份记录
            } else {
                shutdownJob(context, pd, parameter);
            }
        } catch (Exception e) {
            try {
                shutdownJob(context, pd, parameter);
            } catch (Exception e1) {
                e1.printStackTrace();
            }
        }
    }

    /**
     * 把定时备份任务状态改为关闭
     */
    public void shutdownJob(JobExecutionContext context, PageData pd, Map<String, Object> parameter) {
        try {
            context.getScheduler().shutdown();    //备份异常时关闭任务
            //普通类从spring容器中拿出service
            TimingBackUpMapper timingbackupService = (TimingBackUpMapper) SpringUtil.getBean("timingBackUpServiceImpl");
            pd.put("STATUS", 2);                //改变定时运行状态为2，关闭
            pd.put("TIMINGBACKUP_ID", parameter.get("TIMINGBACKUP_ID").toString()); //定时备份ID
            timingbackupService.changeStatus(pd);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
