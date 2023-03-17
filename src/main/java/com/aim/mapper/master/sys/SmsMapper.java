package com.aim.mapper.master.sys;

import com.aim.base.IDao;
import com.aim.entity.PageData;

/**
 * 站内信Mapper
 */
public interface SmsMapper extends IDao {

    /**
     * 获取未读总数
     */
    public PageData findSmsCount(String USERNAME);

}
