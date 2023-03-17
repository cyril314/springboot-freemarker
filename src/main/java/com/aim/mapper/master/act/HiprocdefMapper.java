package com.aim.mapper.master.act;

import com.aim.base.IDao;
import com.aim.entity.PageData;

import java.util.List;

/**
 * 历史流程Mapper
 */
public interface HiprocdefMapper extends IDao {

    /**
     * 历史流程变量列表
     */
    public List<PageData> hivarList(PageData pd) throws Exception;

}
