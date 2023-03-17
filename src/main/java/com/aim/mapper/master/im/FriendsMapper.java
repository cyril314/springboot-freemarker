package com.aim.mapper.master.im;

import com.aim.base.IDao;
import com.aim.entity.PageData;

import java.util.List;

/**
 * 好友管理Mapper
 */
public interface FriendsMapper extends IDao {

    /**
     * 拉黑
     */
    public void pullblack(PageData pd) throws Exception;

    /**
     * 修改同意状态
     */
    public void editAllow(PageData pd) throws Exception;

    /**
     * 列表(添加好友页面检索好友)
     */
    public List<PageData> listAllToSearch(PageData pd) throws Exception;

    /**
     * 列表(全部全部有自己好友的用户)
     */
    public List<PageData> listAllFri(PageData pd) throws Exception;

    /**
     * 获取某个好友详细信息
     */
    public PageData getTheFriend(PageData pd) throws Exception;

    /**
     * 获取我的某个好友
     */
    public PageData findMyFriend(PageData pd) throws Exception;

}
