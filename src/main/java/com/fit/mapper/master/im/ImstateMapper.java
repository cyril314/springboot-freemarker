package com.fit.mapper.master.im;

import com.fit.base.IDao;
import com.fit.entity.PageData;

/**
 * 状态(在线or隐身以及签名)Mapper
 */
public interface ImstateMapper extends IDao {

    /**
     * 修改在线状态
     */
    public void editOnline(PageData pd) throws Exception;

    /**
     * 修改个性签名
     */
    public void editAuto(PageData pd) throws Exception;

    /**
     * 修改皮肤
     */
    public void editSign(PageData pd) throws Exception;

    /**
     * 通过用户名获取数据
     */
    public PageData findByUsername(PageData pd) throws Exception;

}
