package com.aim.mapper.master.sys;

import com.aim.base.IDao;
import com.aim.entity.Page;
import com.aim.entity.PageData;
import com.aim.entity.system.User;

import java.util.List;

/**
 * 用户Mapper
 */
public interface UsersMapper extends IDao {

    /**
     * 通过用户获取数据
     */
    PageData findByUsername(PageData pd);

    /**
     * 通过用户ID获取用户信息和角色信息
     */
    User getUserAndRoleById(String USER_ID);

    /**
     * 通过邮箱获取数据
     */
    PageData findByEmail(PageData pd);

    /**
     * 通过编码获取数据
     */
    PageData findByNumbe(PageData pd);

    /**
     * 列出某角色下的所有用户
     */
    List<PageData> listAllUserByRoldId(PageData pd);

    /**
     * 用户列表(弹窗选择用)
     */
    List<PageData> userBystafflistPage(Page page);

    /**
     * 保存用户IP
     */
    void saveIP(PageData pd);

    /**
     * 保存用户系统皮肤
     */
    void saveSkin(PageData pd);
}
