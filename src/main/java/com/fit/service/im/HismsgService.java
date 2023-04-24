package com.fit.service.im;

import com.fit.base.IService;
import com.fit.entity.PageData;
import com.fit.mapper.master.im.HismsgMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 聊天记录服务接口实现类
 */
@Service
@Transactional
public class HismsgService extends IService<HismsgMapper> {

    /**
     * 列表(全部全部未读消息)
     */
    public List<PageData> listAllnoread(PageData pd) throws Exception {
        return dao.listAllnoread(pd);
    }
}
