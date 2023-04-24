package com.fit.service.act;

import com.fit.base.IService;
import com.fit.mapper.master.act.ProcdefMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * 流程管理接口实现类
 */
@Service(value = "procdefServiceImpl")
@Transactional
public class ProcdefService extends IService<ProcdefMapper> {

}

