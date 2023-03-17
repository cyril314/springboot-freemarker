package com.aim.service.system;

import com.aim.base.IService;
import com.aim.entity.PageData;
import com.aim.mapper.master.sys.ButtonrightsMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 按钮权限服务接口实现类
 */
@Service
@Transactional
public class ButtonrightsService extends IService<ButtonrightsMapper> {

    /**
     * 列表(全部)左连接按钮表,查出安全权限标识(主副职角色综合)
     */
    public List<PageData> listAllBrAndQxnameByZF(String[] ROLE_IDS) throws Exception {
        return dao.listAllBrAndQxnameByZF(ROLE_IDS);
    }

    /**
     * 列表(全部)左连接按钮表,查出安全权限标识(主职角色)
     */
    public List<PageData> listAllBrAndQxname(PageData pd) throws Exception {
        return dao.listAllBrAndQxname(pd);
    }
}
