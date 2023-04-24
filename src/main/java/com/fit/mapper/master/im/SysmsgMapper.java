package com.fit.mapper.master.im;

import com.fit.base.IDao;
import com.fit.entity.PageData;

/**
 * 系统消息Mapper
 */
public interface SysmsgMapper extends IDao {

    /**
     * 消息设置成已读
     */
    public void read(PageData pd) throws Exception;

    /**
     * 获取未读总数
     */
    public PageData getMsgCount(PageData pd) throws Exception;
}
