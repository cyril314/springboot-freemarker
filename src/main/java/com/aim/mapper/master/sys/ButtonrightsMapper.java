package com.aim.mapper.master.sys;

import com.aim.base.IDao;
import com.aim.entity.PageData;

import java.util.List;

/**
 * 按钮权限Mapper
 */
public interface ButtonrightsMapper extends IDao {

    /**
     * 列表(全部)左连接按钮表,查出安全权限标识(主副职角色综合)
     */
    List<PageData> listAllBrAndQxnameByZF(String[] ROLE_IDS);

    /**
     * 列表(全部)左连接按钮表,查出安全权限标识(主职角色)
     */
    List<PageData> listAllBrAndQxname(PageData pd);
}
