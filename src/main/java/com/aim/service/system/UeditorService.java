package com.aim.service.system;

import com.aim.base.IService;
import com.aim.mapper.master.sys.UeditorMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * 富文本编辑器内容缓存接口实现类
 */
@Service
@Transactional
public class UeditorService extends IService<UeditorMapper> {

}

