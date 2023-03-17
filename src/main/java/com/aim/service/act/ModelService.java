package com.aim.service.act;

import com.aim.base.IService;
import com.aim.mapper.master.act.ModelMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * 模型管理接口实现类
 */
@Service(value = "modelServiceImpl")
@Transactional
public class ModelService extends IService<ModelMapper> {

}

