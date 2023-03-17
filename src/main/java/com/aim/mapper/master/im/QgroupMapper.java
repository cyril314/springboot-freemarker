package com.aim.mapper.master.im;

import com.aim.base.IDao;
import com.aim.entity.PageData;

import java.util.List;

/**
 * 群组Mapper
 */
public interface QgroupMapper extends IDao {

    /**
     * 群检索列表
     */
    public List<PageData> searchListAll(PageData pd) throws Exception;

    /**
     * 我在的全部群列表
     */
    public List<PageData> mylistAll(PageData pd) throws Exception;

    /**
     * 删除图片
     */
    public void delTp(PageData pd) throws Exception;

}
