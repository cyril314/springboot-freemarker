package com.fit.service.db;

import com.fit.base.IService;
import com.fit.mapper.master.db.BRdbMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * 数据库管理接口实现类
 */
@Service(value = "bRdbServiceImpl")
@Transactional
public class BRdbService extends IService<BRdbMapper> {

}
