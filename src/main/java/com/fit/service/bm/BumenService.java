package com.fit.service.bm;

import com.fit.base.IService;
import com.fit.entity.bm.Bumen;
import com.fit.mapper.master.bm.BumenMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 部门管理接口实现类
 */
@Service
@Transactional
public class BumenService extends IService<BumenMapper> {

    /**
     * 通过ID获取其子级列表
     */
    public List<Bumen> listByParentId(String parentId) throws Exception {
        return dao.listByParentId(parentId);
    }

    /**
     * 获取所有数据并填充每条数据的子级列表(递归处理)
     */
    public List<Bumen> listTree(String parentId) throws Exception {
        List<Bumen> valueList = this.listByParentId(parentId);
        for (Bumen fhentity : valueList) {
            fhentity.setTreeurl("bumen_list.html?BUMEN_ID=" + fhentity.getBUMEN_ID());
            fhentity.setSubBumen(this.listTree(fhentity.getBUMEN_ID()));
            fhentity.setTarget("treeFrame");
        }
        return valueList;
    }

}

