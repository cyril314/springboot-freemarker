package com.aim.controller.imsn;

import com.aim.base.IController;
import com.aim.entity.Page;
import com.aim.entity.PageData;
import com.aim.service.im.SysmsgService;
import com.aim.util.Jurisdiction;
import com.aim.util.Tools;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * IM系统消息
 */
@Controller
@RequestMapping("/sysmsg")
public class SysmsgController extends IController {

    @Autowired
    private SysmsgService sysmsgService;

    /**
     * 列表
     */
    @RequestMapping(value = "/list")
    @ResponseBody
    public Object list(Page page) throws Exception {
        Map<String, Object> map = new HashMap<String, Object>();
        String errInfo = "success";
        PageData pd = new PageData();
        pd = this.getPageData();
        pd.put("USERNAME", Jurisdiction.getUsername());
        page.setPd(pd);
        List<PageData> varList = sysmsgService.listPage(page);        //列出Sysmsg列表
        map.put("varList", varList);
        map.put("page", page);
        map.put("result", errInfo);                                        //返回结果
        return map;
    }

    /**
     * 删除
     */
    @RequestMapping(value = "/delete")
    @ResponseBody
    public Object delete() throws Exception {
        Map<String, Object> map = new HashMap<String, Object>();
        String errInfo = "success";
        PageData pd = new PageData();
        pd = this.getPageData();
        sysmsgService.delete(pd);
        map.put("result", errInfo);                //返回结果
        return map;
    }

    /**
     * 批量删除
     */
    @RequestMapping(value = "/deleteAll")
    @ResponseBody
    public Object deleteAll() throws Exception {
        Map<String, Object> map = new HashMap<String, Object>();
        String errInfo = "success";
        PageData pd = new PageData();
        pd = this.getPageData();
        String DATA_IDS = pd.getString("DATA_IDS");
        if (Tools.notEmpty(DATA_IDS)) {
            String ArrayDATA_IDS[] = DATA_IDS.split(",");
            sysmsgService.deleteAll(ArrayDATA_IDS);
        } else {
            errInfo = "error";
        }
        map.put("result", errInfo);                //返回结果
        return map;
    }

}
