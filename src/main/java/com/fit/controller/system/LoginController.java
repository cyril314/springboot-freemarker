package com.fit.controller.system;

import com.fit.base.AjaxResult;
import com.fit.base.IController;
import com.fit.entity.PageData;
import com.fit.entity.system.User;
import com.fit.service.system.LogService;
import com.fit.service.system.UsersService;
import com.fit.util.*;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

/**
 * 登录处理类
 */
@Controller
@RequestMapping("/admin")
public class LoginController extends IController {

    @Autowired
    private UsersService usersService;
    @Autowired
    private LogService logService;

    private String salt = "imboot";

    /**
     * 访问登录页
     */
    @RequestMapping(value = {"/", "/login", "/login_toLogin", "/login.html"})
    public String toLogin() {
        return "login";
    }

    /**
     * 请求登录验证用户接口
     */
    @RequestMapping(value = "/check")
    @ResponseBody
    public Object check() throws Exception {
        Map<String, Object> map = AjaxResult.error();
        PageData pd = this.getPageData();
        String KEYDATA[] = Base64Util.decode(pd.getString("KEYDATA")).split(salt);
        if (null != KEYDATA && KEYDATA.length == 2) {
            String USERNAME = KEYDATA[0];                       //登录过来的用户名
            String PASSWORD = KEYDATA[1];                       //登录过来的密码
            boolean REMEMBER_ME = pd.get("hold") == null ? false : true;
            UsernamePasswordToken token = new UsernamePasswordToken(USERNAME, new SimpleHash("SHA-1", USERNAME, PASSWORD).toString());
            token.setRememberMe(REMEMBER_ME);
            Subject subject = SecurityUtils.getSubject();
            subject.login(token);                               //这一步在调用login(token)方法时,它会走到MyRealm.doGetAuthenticationInfo()方法中
            if (subject.isAuthenticated()) {                    //验证是否登录成功
                removeSession(USERNAME);
                Session session = Jurisdiction.getSession();
                pd.put("USERNAME", USERNAME);
                pd = usersService.findByUsername(pd);
                User user = new User();
                user.setUSER_ID(pd.getString("USER_ID"));
                user.setUSERNAME(pd.getString("USERNAME"));
                user.setPASSWORD(pd.getString("PASSWORD"));
                user.setNAME(pd.getString("NAME"));
                user.setROLE_ID(pd.getString("ROLE_ID"));
                user.setLAST_LOGIN(pd.getString("LAST_LOGIN"));
                user.setIP(pd.getString("IP"));
                user.setSTATUS(pd.getString("STATUS"));
                session.setAttribute(Const.SESSION_USER, user);         //把当前用户放入session
                session.setAttribute(Const.SESSION_USERNAME, USERNAME); //放入用户名到session
                logService.save(USERNAME, "成功登录系统");         //记录日志
                map.put("result", "success");
            } else {
                token.clear();
            }
            if (!"success".equals(map.get("result").toString())) {
                logService.save(USERNAME, "尝试登录系统失败,用户名密码错误,无权限");
            }
        }

        return map;
    }

    /**
     * 系统用户注册接口
     */
    @RequestMapping(value = "/register")
    @ResponseBody
    public Object register(@RequestParam("callback") String callback) throws Exception {
        Map<String, Object> map = new HashMap<String, Object>();
        PageData pd = new PageData();
        pd = this.getPageData();
        String result = "00";
        if (Tools.checkKey("USERNAME", pd.getString("FKEY"))) {    //检验请求key值是否合法
            pd.put("USER_ID", this.get32UUID());    //ID 主键
            pd.put("ROLE_ID", "fhadminzhuche");     //角色ID fhadminzhuche 为注册用户
            pd.put("NUMBER", "");                   //编号
            pd.put("PHONE", "");                    //手机号
            pd.put("BZ", "注册用户");               //备注
            pd.put("LAST_LOGIN", "");               //最后登录时间
            pd.put("IP", "");                       //IP
            pd.put("STATUS", "0");                  //状态
            pd.put("SKIN", "pcoded-navbar navbar-image-3,navbar pcoded-header navbar-expand-lg navbar-light header-dark,");                    //用户默认皮肤
            pd.put("EMAIL", "");
            pd.put("ROLE_IDS", "");
            pd.put("PASSWORD", new SimpleHash("SHA-1", pd.getString("USERNAME"), pd.getString("PASSWORD")).toString());    //密码加密
            if (null == usersService.findByUsername(pd)) {    //判断用户名是否存在
                usersService.save(pd);                    //执行保存
                logService.save(pd.getString("USERNAME"), "新注册");
            } else {
                result = "01";    //用户名已存在
            }
        } else {
            result = "05";        //不合法的注册
        }
        map.put("result", result);
        return callback + "(" + JacksonUtils.obj2json(map) + ")";
    }

    /**
     * 判断是否登录状态
     */
    @RequestMapping(value = "/islogin")
    @ResponseBody
    public Object islogin() throws Exception {
        Map<String, Object> map = AjaxResult.success();
        Session session = Jurisdiction.getSession();
        if (null == session.getAttribute(Const.SESSION_USERNAME)) {
            map.put("result", "errer");
        }
        return map;
    }

    /**
     * 访问登录页
     */
    @RequestMapping(value = {"/error", "/error.html"})
    public String toError() {
        return "error";
    }
}
