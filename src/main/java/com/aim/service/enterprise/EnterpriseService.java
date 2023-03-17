package com.aim.service.enterprise;

import com.aim.base.IService;
import com.aim.mapper.master.enterprise.EnterpriseMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * 企业信息接口实现类
 */
@Service
@Transactional
public class EnterpriseService extends IService<EnterpriseMapper> {

}

