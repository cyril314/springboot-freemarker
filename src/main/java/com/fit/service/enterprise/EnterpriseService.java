package com.fit.service.enterprise;

import com.fit.base.IService;
import com.fit.mapper.master.enterprise.EnterpriseMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * 企业信息接口实现类
 */
@Service
@Transactional
public class EnterpriseService extends IService<EnterpriseMapper> {

}

