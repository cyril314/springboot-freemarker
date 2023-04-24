package com.fit.service.system;

import com.fit.base.IService;
import com.fit.mapper.master.sys.UeditorMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * 富文本编辑器内容缓存接口实现类
 */
@Service
@Transactional
public class UeditorService extends IService<UeditorMapper> {

}

