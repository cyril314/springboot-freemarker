package com.fit.mapper.master.sys;

import com.fit.base.IDao;
import com.fit.entity.PageData;

/**
 * 站内信Mapper
 */
public interface SmsMapper extends IDao {

    /**
     * 获取未读总数
     */
    public PageData findSmsCount(String USERNAME);

}
