package com.fit.service.system;

import com.fit.base.IService;
import com.fit.entity.PageData;
import com.fit.mapper.master.sys.SmsMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * 站内信服务接口实现类
 */
@Service
@Transactional
public class SmsService extends IService<SmsMapper> {

    /**
     * 获取未读总数
     */
    public PageData findSmsCount(String USERNAME) throws Exception {
        return dao.findSmsCount(USERNAME);
    }
}
