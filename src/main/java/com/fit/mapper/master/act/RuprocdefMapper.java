package com.fit.mapper.master.act;

import com.fit.base.IDao;
import com.fit.entity.Page;
import com.fit.entity.PageData;

import java.util.List;

/**
 * 正在运行的流程Mapper
 */
public interface RuprocdefMapper extends IDao {

    /**
     * 流程变量列表
     */
    public List<PageData> varList(PageData pd) throws Exception;

    /**
     * 历史任务节点列表
     */
    public List<PageData> hiTaskList(PageData pd) throws Exception;

    /**
     * 已办任务列表列表
     */
    public List<PageData> hitasklistPage(Page page) throws Exception;

    /**
     * 激活or挂起任务(指定某个任务)
     */
    public void onoffTask(PageData pd) throws Exception;

    /**
     * 激活or挂起任务(指定某个流程的所有任务)
     */
    public void onoffAllTask(PageData pd) throws Exception;

}
