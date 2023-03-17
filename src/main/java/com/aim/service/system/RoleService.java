package com.aim.service.system;

import com.aim.base.IService;
import com.aim.entity.Page;
import com.aim.entity.PageData;
import com.aim.entity.system.Role;
import com.aim.mapper.master.sys.RoleMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 角色服务接口实现类
 */
@Service
@Transactional //开启事物
public class RoleService extends IService<RoleMapper> {

    /**
     * 通过id查找(返回角色对象)
     */
    public Role getRoleById(String ROLE_ID) throws Exception {
        return dao.getRoleById(ROLE_ID);
    }

    /**
     * 通过角色编码查找
     */
    public PageData getRoleByRnumber(PageData pd) throws Exception {
        return dao.getRoleByRnumber(pd);
    }

    /**
     * 通过组ID获取组下级角色列表
     */
    public List<Role> listAllRolesByPId(PageData pd) throws Exception {
        return dao.listAllRolesByPId(pd);
    }

    /**
     * 删除角色
     */
    public void deleteRoleById(String ROLE_ID) throws Exception {
        dao.deleteRoleById(ROLE_ID);
    }

    /**
     * 给当前角色附加菜单权限
     */
    public void updateRoleRights(Role role) throws Exception {
        dao.updateRoleRights(role);
    }

    /**
     * 给全部子角色加菜单权限
     */
    public void setAllRights(PageData pd) throws Exception {
        dao.setAllRights(pd);
    }

    /**
     * 权限(增删改查)
     *
     * @param msg 区分增删改查
     * @param pd
     * @throws Exception
     */
    public void saveB4Button(String msg, PageData pd) throws Exception {
        if ("add_qx".equals(msg)) {
            dao.addQx(pd);
        } else if ("del_qx".equals(msg)) {
            dao.delQx(pd);
        } else if ("edit_qx".equals(msg)) {
            dao.editQx(pd);
        } else if ("cha_qx".equals(msg)) {
            dao.chaQx(pd);
        }
    }

    /**
     * 通过角色ID数组获取角色列表
     */
    public List<Role> getRoleByArryROLE_ID(String[] arryROLE_ID) throws Exception {
        return dao.listAllRolesByArryROLE_ID(arryROLE_ID);
    }

    /**
     * 角色列表(弹窗选择用)
     */
    public List<PageData> roleListWindow(Page page) throws Exception {
        return dao.roleWindowlistPage(page);
    }

}
