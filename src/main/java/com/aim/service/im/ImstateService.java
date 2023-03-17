package com.aim.service.im;

import com.aim.base.IService;
import com.aim.entity.PageData;
import com.aim.mapper.master.im.ImstateMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * 状态(在线or隐身以及签名)服务接口实现类
 */
@Service
@Transactional
public class ImstateService extends IService<ImstateMapper> {

    /**
     * 修改在线状态
     */
    public void editOnline(PageData pd) throws Exception {
        dao.editOnline(pd);
    }

    /**
     * 修改个性签名
     */
    public void editAuto(PageData pd) throws Exception {
        dao.editAuto(pd);
    }

    /**
     * 修改皮肤
     */
    public void editSign(PageData pd) throws Exception {
        dao.editSign(pd);
    }

    /**
     * 通过用户名获取数据
     */
    public PageData findByUsername(PageData pd) throws Exception {
        return dao.findByUsername(pd);
    }
}
