package com.aim.mapper.master.im;

import com.aim.base.IDao;
import com.aim.entity.Page;
import com.aim.entity.PageData;

import java.util.List;

/**
 * 我在的群组Mapper
 */
public interface IQgroupMapper extends IDao {

    /**
     * 列表(全部群成员)带分页
     */
    public List<PageData> memberslistPage(Page page) throws Exception;

    /**
     * 判断我是否在某群
     */
    public PageData findByIdandQid(PageData pd) throws Exception;

}
