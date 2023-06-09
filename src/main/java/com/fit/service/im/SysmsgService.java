package com.fit.service.im;

import com.fit.base.IService;
import com.fit.entity.PageData;
import com.fit.mapper.master.im.SysmsgMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * 系统消息服务接口实现类
 */
@Service
@Transactional
public class SysmsgService extends IService<SysmsgMapper> {

    /**
     * 消息设置成已读
     */
    public void read(PageData pd) throws Exception {
        dao.read(pd);
    }

    /**
     * 获取未读总数
     */
    public PageData getMsgCount(PageData pd) throws Exception {
        return dao.getMsgCount(pd);
    }
}
