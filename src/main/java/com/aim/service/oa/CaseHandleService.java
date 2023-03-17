package com.aim.service.oa;

import com.aim.base.IService;
import com.aim.mapper.master.oa.CaseHandleMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * 案件办理服务接口实现类
 */
@Service(value = "casehandleServiceImpl")
@Transactional
public class CaseHandleService extends IService<CaseHandleMapper> {

}
