package com.aim.mapper.master.sys;

import com.aim.base.IDao;
import com.aim.entity.PageData;
import com.aim.entity.system.Dictionaries;

import java.util.List;

/**
 * 数据字典Mapper
 */
public interface DictionariesMapper extends IDao {

    /**
     * 通过ID获取其子级列表
     */
    List<Dictionaries> listSubDictByParentId(String parentId);

    /**
     * 通过编码获取数据
     */
    PageData findByBianma(PageData pd);

    /**
     * 排查表检查是否被占用
     */
    PageData findFromTbs(PageData pd);

}
