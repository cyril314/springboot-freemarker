package com.aim.mapper.master.bm;

import com.aim.base.IDao;
import com.aim.entity.bm.Bumen;

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

