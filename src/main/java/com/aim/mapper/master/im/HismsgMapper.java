package com.aim.mapper.master.im;

import com.aim.base.IDao;
import com.aim.entity.PageData;

import java.util.List;

/**
 * 聊天记录Mapper
 */
public interface HismsgMapper extends IDao {

    /**
     * 列表(全部全部未读消息)
     */
    public List<PageData> listAllnoread(PageData pd) throws Exception;

}
