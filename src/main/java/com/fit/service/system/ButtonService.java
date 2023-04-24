package com.fit.service.system;

import com.fit.base.IService;
import com.fit.mapper.master.sys.ButtonMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * 按钮权限服务接口实现类
 */
@Service
@Transactional
public class ButtonService extends IService<ButtonMapper> {

}
