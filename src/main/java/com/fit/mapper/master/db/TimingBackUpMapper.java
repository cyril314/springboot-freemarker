package com.fit.mapper.master.db;

import com.fit.base.IDao;
import com.fit.entity.PageData;

/**
 * 定时备份Mapper
 */
public interface TimingBackUpMapper extends IDao {

    /**
     * 切换状态
     */
    public void changeStatus(PageData pd) throws Exception;
}

