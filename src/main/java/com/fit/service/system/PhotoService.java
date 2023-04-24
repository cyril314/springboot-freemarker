package com.fit.service.system;

import com.fit.base.IService;
import com.fit.mapper.master.sys.PhotoMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * 头像编辑服务接口实现类
 */
@Service
@Transactional //开启事物
public class PhotoService extends IService<PhotoMapper> {

}
