package com.fit.mapper.master.sys;

import com.fit.base.IDao;
import com.fit.entity.Page;
import com.fit.entity.PageData;
import com.fit.entity.system.Role;

import java.util.List;

/**
 * 角色Mapper
 */
public interface RoleMapper extends IDao {

    /**
     * 通过id查找(返回角色对象)
     */
    Role getRoleById(String ROLE_ID);

    /**
     * 通过角色编码查找
     */
    PageData getRoleByRnumber(PageData pd);

    /**
     * 通过组ID获取组下级角色列表
     */
    List<Role> listAllRolesByPId(PageData pd);

    /**
     * 删除角色
     */
    void deleteRoleById(String ROLE_ID);

    /**
     * 给当前角色附加菜单权限
     */
    void updateRoleRights(Role role);

    /**
     * 给全部子角色加菜单权限
     */
    void setAllRights(PageData pd);

    /**
     * 权限(增删改查)
     */
    void addQx(PageData pd);

    /**
     * 权限(增删改查)
     */
    void delQx(PageData pd);

    /**
     * 权限(增删改查)
     */
    void editQx(PageData pd);

    /**
     * 权限(增删改查)
     */
    void chaQx(PageData pd);

    /**
     * 通过角色ID数组获取角色列表
     *
     * @param arryROLE_ID
     * @throws Exception
     */
    List<Role> listAllRolesByArryROLE_ID(String[] arryROLE_ID);

    /**
     * 角色列表(弹窗选择用)
     */
    List<PageData> roleWindowlistPage(Page page);

}
