package com.fit.service.im;

import com.fit.base.IService;
import com.fit.entity.PageData;
import com.fit.mapper.master.im.FriendsMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 好友管理服务接口实现类
 */
@Service
@Transactional
public class FriendsService extends IService<FriendsMapper> {

    /**
     * 拉黑
     */
    public void pullblack(PageData pd) throws Exception {
        dao.pullblack(pd);
    }

    /**
     * 修改同意状态
     */
    public void editAllow(PageData pd) throws Exception {
        dao.editAllow(pd);
    }

    /**
     * 列表(添加好友页面检索好友)
     */
    public List<PageData> listAllToSearch(PageData pd) throws Exception {
        return dao.listAllToSearch(pd);
    }

    /**
     * 列表(全部全部有自己好友的用户)
     */
    public List<PageData> listAllFri(PageData pd) throws Exception {
        return dao.listAllFri(pd);
    }

    /**
     * 获取某个好友详细信息
     */
    public PageData getTheFriend(PageData pd) throws Exception {
        return dao.getTheFriend(pd);
    }

    /**
     * 获取我的某个好友
     */
    public PageData findMyFriend(PageData pd) throws Exception {
        return dao.findMyFriend(pd);
    }
}
