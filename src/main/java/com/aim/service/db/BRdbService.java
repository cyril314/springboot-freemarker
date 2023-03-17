package com.aim.service.db;

import com.aim.base.IService;
import com.aim.mapper.master.db.BRdbMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * 数据库管理接口实现类
 */
@Service(value = "bRdbServiceImpl")
@Transactional
public class BRdbService extends IService<BRdbMapper> {

}
