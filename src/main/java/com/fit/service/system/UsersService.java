package com.fit.service.system;

import com.fit.base.IService;
import com.fit.entity.Page;
import com.fit.entity.PageData;
import com.fit.entity.system.User;
import com.fit.mapper.master.sys.UsersMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 用户服务接口实现类
 */
@Service
@Transactional //开启事物
public class UsersService extends IService<UsersMapper> {

    /**
     * 通过用户名获取用户信息
     */
    public PageData findByUsername(PageData pd) throws Exception {
        return dao.findByUsername(pd);
    }

    /**
     * 通过用户ID获取用户信息和角色信息
     */
    public User getUserAndRoleById(String USER_ID) throws Exception {
        return dao.getUserAndRoleById(USER_ID);
    }

    /**
     * 保存用户IP
     */
    public void saveIP(PageData pd) throws Exception {
        dao.saveIP(pd);
    }

    /**
     * 通过邮箱获取数据
     */
    public PageData findByEmail(PageData pd) throws Exception {
        return dao.findByEmail(pd);
    }

    /**
     * 通过编码获取数据
     * dao
     */
    public PageData findByNumbe(PageData pd) throws Exception {
        return dao.findByNumbe(pd);
    }

    /**
     * 列出某角色下的所有用户
     */
    public List<PageData> listAllUserByRoldId(PageData pd) throws Exception {
        return dao.listAllUserByRoldId(pd);
    }

    /**
     * 用户列表(弹窗选择用)
     */
    public List<PageData> listUsersBystaff(Page page) throws Exception {
        return dao.userBystafflistPage(page);
    }

    /**
     * 保存用户系统皮肤
     */
    public void saveSkin(PageData pd) throws Exception {
        dao.saveSkin(pd);
    }
}
