package com.aim.mapper.master.db;

import com.aim.base.IDao;
import com.aim.entity.PageData;

/**
 * 定时备份Mapper
 */
public interface TimingBackUpMapper extends IDao {

    /**
     * 切换状态
     */
    public void changeStatus(PageData pd) throws Exception;
}

