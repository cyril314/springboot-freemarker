package com.fit.service.system;

import com.fit.base.IService;
import com.fit.entity.PageData;
import com.fit.entity.system.Dictionaries;
import com.fit.mapper.master.sys.DictionariesMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 按钮权限服务接口实现类
 */
@Service
@Transactional //开启事物
public class DictionariesService extends IService<DictionariesMapper> {

    /**
     * 获取所有数据并填充每条数据的子级列表(递归处理)
     */
    public List<Dictionaries> listAllDict(String parentId) throws Exception {
        List<Dictionaries> dictList = this.listSubDictByParentId(parentId);
        for (Dictionaries dict : dictList) {
            dict.setTreeurl("dictionaries_list.html?DICTIONARIES_ID=" + dict.getDICTIONARIES_ID());
            dict.setSubDict(this.listAllDict(dict.getDICTIONARIES_ID()));
            dict.setTarget("treeFrame");
        }
        return dictList;
    }

    /**
     * 通过ID获取其子级列表
     */
    public List<Dictionaries> listSubDictByParentId(String parentId) throws Exception {
        return dao.listSubDictByParentId(parentId);
    }

    /**
     * 获取所有数据并填充每条数据的子级列表(递归处理)用于代码生成器引用数据字典
     */
    public List<Dictionaries> listAllDictToCreateCode(String parentId) throws Exception {
        List<Dictionaries> dictList = this.listSubDictByParentId(parentId);
        for (Dictionaries dict : dictList) {
            dict.setTreeurl("setDID('" + dict.getDICTIONARIES_ID() + "');");
            dict.setSubDict(this.listAllDictToCreateCode(dict.getDICTIONARIES_ID()));
            dict.setTarget("treeFrame");
        }
        return dictList;
    }

    /**
     * 通过编码获取数据
     */
    public PageData findByBianma(PageData pd) throws Exception {
        return dao.findByBianma(pd);
    }

    /**
     * 排查表检查是否被占用
     */
    public PageData findFromTbs(PageData pd) throws Exception {
        return dao.findFromTbs(pd);
    }
}
