package com.aim.service.act;

import com.aim.base.IService;
import com.aim.entity.PageData;
import com.aim.mapper.master.act.HiprocdefMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 历史流程任务接口实现类
 */
@Service(value = "hiprocdefServiceImpl")
@Transactional
public class HiprocdefService  extends IService<HiprocdefMapper> {

    /**
     * 历史流程变量列表
     */
    public List<PageData> hivarList(PageData pd) throws Exception {
        return dao.hivarList(pd);
    }

}
