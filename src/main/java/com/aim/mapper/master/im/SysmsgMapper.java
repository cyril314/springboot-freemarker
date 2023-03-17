package com.aim.mapper.master.im;

import com.aim.base.IDao;
import com.aim.entity.PageData;

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
