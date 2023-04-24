package com.fit.mapper.master.im;

import com.fit.base.IDao;
import com.fit.entity.Page;
import com.fit.entity.PageData;

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
