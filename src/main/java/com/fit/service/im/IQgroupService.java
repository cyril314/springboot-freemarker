package com.fit.service.im;

import com.fit.base.IService;
import com.fit.entity.Page;
import com.fit.entity.PageData;
import com.fit.mapper.master.im.IQgroupMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 我在的群组服务接口实现类
 */
@Service(value = "iQgroupServiceImpl")
@Transactional
public class IQgroupService extends IService<IQgroupMapper> {

    /**
     * 列表(全部群成员)带分页
     */
    public List<PageData> memberslistPage(Page page) throws Exception {
        return dao.memberslistPage(page);
    }

    /**
     * 判断我是否在某群
     */
    public PageData findByIdandQid(PageData pd) throws Exception {
        return dao.findByIdandQid(pd);
    }
}
