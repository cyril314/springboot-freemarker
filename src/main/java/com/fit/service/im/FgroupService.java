package com.fit.service.im;

import com.fit.base.IService;
import com.fit.mapper.master.im.FgroupMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * 好友分组服务接口实现类
 */
@Service
@Transactional
public class FgroupService extends IService<FgroupMapper> {

}
