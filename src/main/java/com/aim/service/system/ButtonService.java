package com.aim.service.system;

import com.aim.base.IService;
import com.aim.mapper.master.sys.ButtonMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * 按钮权限服务接口实现类
 */
@Service
@Transactional
public class ButtonService extends IService<ButtonMapper> {

}
