package com.aim.service.im;

import com.aim.base.IService;
import com.aim.entity.PageData;
import com.aim.mapper.master.im.QgroupMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 群组服务接口实现类
 */
@Service
@Transactional
public class QgroupService extends IService<QgroupMapper> {

    /**
     * 群检索列表
     */
    public List<PageData> searchListAll(PageData pd) throws Exception {
        return dao.searchListAll(pd);
    }

    /**
     * 我在的全部群列表
     */
    public List<PageData> mylistAll(PageData pd) throws Exception {
        return dao.mylistAll(pd);
    }

    /**
     * 删除图片
     */
    public void delTp(PageData pd) throws Exception {
        dao.delTp(pd);
    }

}
