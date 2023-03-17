package com.aim.service.oa;

import com.aim.base.IService;
import com.aim.mapper.master.oa.MyleaveMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * 请假申请服务接口实现类
 */
@Service(value = "myleaveServiceImpl")
@Transactional
public class MyleaveService extends IService<MyleaveMapper> {

}
