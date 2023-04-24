package com.fit.service.act;

import com.fit.base.IService;
import com.fit.entity.Page;
import com.fit.entity.PageData;
import com.fit.mapper.master.act.RuprocdefMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 正在运行的流程接口实现类
 */
@Service(value = "ruprocdefServiceImpl")
@Transactional
public class RuprocdefService extends IService<RuprocdefMapper> {

    /**
     * 流程变量列表
     */
    public List<PageData> varList(PageData pd) throws Exception {
        return dao.varList(pd);
    }

    /**
     * 历史任务节点列表
     */
    public List<PageData> hiTaskList(PageData pd) throws Exception {
        return dao.hiTaskList(pd);
    }

    /**
     * 已办任务列表列表
     */
    public List<PageData> hitasklist(Page page) throws Exception {
        return dao.hitasklistPage(page);
    }

    /**
     * 激活or挂起任务(指定某个任务)
     */
    public void onoffTask(PageData pd) throws Exception {
        dao.onoffTask(pd);
        ;
    }

    /**
     * 激活or挂起任务(指定某个流程的所有任务)
     */
    public void onoffAllTask(PageData pd) throws Exception {
        dao.onoffAllTask(pd);
        ;
    }

}
