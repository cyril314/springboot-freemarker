package com.fit.service.tools;

import com.fit.base.IService;
import com.fit.entity.PageData;
import com.fit.mapper.master.tools.CreateCodeMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 代码生成器接口实现类
 */
@Service
@Transactional
public class CreateCodeService extends IService<CreateCodeMapper> {

    /**
     * 列表(主表)
     */
    public List<PageData> listFa() throws Exception {
        return dao.listFa();
    }
}
