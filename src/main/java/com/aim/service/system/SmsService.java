package com.aim.service.system;

import com.aim.base.IService;
import com.aim.entity.PageData;
import com.aim.mapper.master.sys.SmsMapper;
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
