package com.fit.service.db;

import com.fit.base.IService;
import com.fit.entity.PageData;
import com.fit.mapper.master.db.TimingBackUpMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * 定时备份接口实现类
 */
@Service
@Transactional
public class TimingBackUpService extends IService<TimingBackUpMapper> {

    /**
     * 切换状态
     */
    public void changeStatus(PageData pd) throws Exception {
        dao.changeStatus(pd);
    }
}
