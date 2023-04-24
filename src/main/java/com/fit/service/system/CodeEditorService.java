package com.fit.service.system;

import com.fit.base.IService;
import com.fit.mapper.master.tools.CodeEditorMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * 代码编辑器服务接口实现类
 */
@Service
@Transactional
public class CodeEditorService extends IService<CodeEditorMapper> {

}
