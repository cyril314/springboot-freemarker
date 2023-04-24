package com.fit.mapper.master.bm;

import com.fit.base.IDao;
import com.fit.entity.bm.Bumen;

import java.util.List;

/**
 * 部门管理Mapper
 */
public interface BumenMapper extends IDao {

    /**
     * 通过ID获取其子级列表
     */
    List<Bumen> listByParentId(String parentId);

}

