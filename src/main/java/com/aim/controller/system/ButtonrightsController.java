package com.aim.controller.system;

import com.aim.base.AjaxResult;
import com.aim.base.IController;
import com.aim.entity.PageData;
import com.aim.entity.system.Role;
import com.aim.service.system.ButtonService;
import com.aim.service.system.ButtonrightsService;
import com.aim.service.system.LogService;
import com.aim.service.system.RoleService;
import com.aim.util.Jurisdiction;
import com.aim.util.Tools;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 按钮权限处理类
 */
@Controller
@RequestMapping(value = "/buttonrights")
public class ButtonrightsController extends IController {

    @Autowired
    private ButtonrightsService buttonrightsService;
    @Autowired
    private RoleService roleService;
    @Autowired
    private ButtonService buttonService;
    @Autowired
    private LogService logService;

    /**
     * 列表
     */
    @RequestMapping(value = "/list")
    @RequiresPermissions("buttonrights:list")
    @ResponseBody
    public Object list() throws Exception {
        Map<String, Object> map = AjaxResult.success();
        PageData pd = new PageData();
        pd = this.getPageData();
        if (Tools.isEmpty(pd.getString("ROLE_ID"))) {
            pd.put("ROLE_ID", "1");                                            //默认列出第一组角色(初始设计系统用户组不能删除)
        }
        PageData fpd = new PageData();
        fpd.put("ROLE_ID", "0");
        List<Role> roleList = roleService.listAllRolesByPId(fpd);           //列出组(页面横向排列的一级组)
        List<Role> roleList_z = roleService.listAllRolesByPId(pd);          //列出此组下架角色
        List<PageData> buttonlist = buttonService.listAll(pd);              //列出所有按钮
        List<PageData> roleFhbuttonlist = buttonrightsService.listAll(pd);  //列出所有角色按钮关联数据
        pd = roleService.findById(pd);                                      //取得点击的角色组(横排的)
        map.put("pd", pd);
        map.put("roleList", roleList);
        map.put("roleList_z", roleList_z);
        map.put("buttonList", buttonlist);
        map.put("roleButtonList", roleFhbuttonlist);
        return map;
    }

    /**
     * 点击按钮处理关联表
     */
    @RequestMapping(value = "/upRb")
    @ResponseBody
    @RequiresPermissions("buttonrights:edit")
    public Object updateRolebuttonrightd() throws Exception {
        Map<String, String> map = new HashMap<String, String>();
        PageData pd = new PageData();
        pd = this.getPageData();
        String errInfo = "success";
        if (null != buttonrightsService.findById(pd)) {    //判断关联表是否有数据 是:删除/否:新增
            buttonrightsService.delete(pd);                //删除
        } else {
            pd.put("RB_ID", this.get32UUID());            //主键
            buttonrightsService.save(pd);                //新增
        }
        logService.save(Jurisdiction.getUsername(), "操作了按钮权限的开关:角色ID：" + pd.getString("ROLE_ID") + ", 按钮ID：" + pd.getString("BUTTON_ID"));                //记录日志
        map.put("result", errInfo);
        return map;
    }
}
