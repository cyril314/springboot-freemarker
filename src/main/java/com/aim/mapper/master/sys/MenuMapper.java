package com.aim.mapper.master.sys;

import com.aim.entity.PageData;
import com.aim.entity.system.Menu;

import java.util.List;

/**
 * 菜单Mapper
 */
public interface MenuMapper {

    /**
     * 新增菜单
     */
    void addMenu(Menu menu);

    /**
     * 保存修改菜单
     */
    void edit(Menu menu);

    /**
     * 通过菜单ID获取数据
     */
    PageData getMenuById(PageData pd);

    /**
     * 获取最大的菜单ID
     */
    PageData findMaxId(PageData pd);

    /**
     * 通过ID获取其子一级菜单
     */
    List<Menu> listSubMenuByParentId(String parentId);

    /**
     * 获取所有菜单并填充每个菜单的子菜单列表(菜单管理)
     */
    List<Menu> listAllMenu(String MENU_ID);

    /**
     * 删除菜单
     */
    void deleteMenuById(String MENU_ID);

    /**
     * 保存菜单图标
     */
    void editicon(PageData pd);

}
