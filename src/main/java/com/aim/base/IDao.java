package com.aim.base;

import com.aim.entity.Page;
import com.aim.entity.PageData;

import java.util.List;

/**
 * @AUTO 数据操作接口基类[CRUD(增删查改)]
 * @Author AIM
 * @DATE 2019/10/28
 */
public interface IDao<T extends PageData> {

    /**
     * 保存
     */
    void save(T entity) throws Exception;

    /**
     * 删除
     */
    void delete(T entity) throws Exception;

    /**
     * 修改
     */
    void edit(T entity) throws Exception;

    /**
     * 分页列表
     */
    List<T> listPage(Page page) throws Exception;

    /**
     * 列表(全部)
     */
    List<T> listAll(T entity) throws Exception;

    /**
     * 通过id获取数据
     */
    T findById(T entity) throws Exception;

    /**
     * 批量删除
     */
    void deleteAll(String[] ArrayDATA_IDS) throws Exception;
}
