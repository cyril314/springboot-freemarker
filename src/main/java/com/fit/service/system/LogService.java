package com.fit.service.system;

import com.fit.base.IService;
import com.fit.entity.PageData;
import com.fit.mapper.master.sys.LogMapper;
import com.fit.util.DateUtil;
import com.fit.util.UuidUtil;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * 操作日志记录接口实现类
 */
@Service
@Transactional //开启事物
public class LogService extends IService<LogMapper> {

    /**
     * 新增
     */
    public void save(String USERNAME, String CONTENT) throws Exception {
        PageData pd = new PageData();
        pd.put("USERNAME", USERNAME);                        //用户名
        pd.put("CONTENT", CONTENT);                            //事件
        pd.put("LOG_ID", UuidUtil.get32UUID());            //主键
        pd.put("CZTIME", DateUtil.getTime());    //操作时间
        dao.save(pd);
    }
}
