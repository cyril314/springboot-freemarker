package com.aim.base;

import com.aim.entity.Page;
import com.aim.entity.PageData;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * @AUTO 服务接口基类[CRUD(增删查改)]
 * @Author AIM
 * @DATE 2019/10/9
 */
public abstract class IService<D extends IDao> {

    /**
     * 持久层对象
     */
    @Autowired
    protected D dao;

    /**
     * 保存
     */
    public void save(PageData entity) throws Exception {
        dao.save(entity);
    }

    /**
     * 修改
     */
    public void edit(PageData entity) throws Exception {
        dao.edit(entity);
    }

    /**
     * 分页列表
     */
    public List<PageData> listPage(Page page) throws Exception {
        return dao.listPage(page);
    }

    /**
     * 列表(全部)
     */
    public List<PageData> listAll(PageData entity) throws Exception {
        return dao.listAll(entity);
    }

    /**
     * 通过id获取数据
     */
    public PageData findById(PageData entity) throws Exception {
        return dao.findById(entity);
    }

    /**
     * 删除
     */
    public void delete(PageData entity) throws Exception {
        dao.delete(entity);
    }

    /**
     * 批量删除
     */
    public void deleteAll(String[] ArrayDATA_IDS) throws Exception {
        dao.deleteAll(ArrayDATA_IDS);
    }
}
