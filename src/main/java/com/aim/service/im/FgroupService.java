package com.aim.service.im;

import com.aim.base.IService;
import com.aim.mapper.master.im.FgroupMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * 好友分组服务接口实现类
 */
@Service
@Transactional
public class FgroupService extends IService<FgroupMapper> {

}
