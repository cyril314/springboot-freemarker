package com.fit.service.act;

import com.fit.base.IService;
import com.fit.mapper.master.act.ModelMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * 模型管理接口实现类
 */
@Service(value = "modelServiceImpl")
@Transactional
public class ModelService extends IService<ModelMapper> {

}

