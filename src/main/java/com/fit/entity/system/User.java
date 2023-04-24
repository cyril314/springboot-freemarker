package com.fit.entity.system;

import com.fit.entity.Page;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 用户实体类
 */
@Data
@Builder
@NoArgsConstructor //无参数的构造方法
@AllArgsConstructor //包含所有变量构造方法
public class User {

    private String USER_ID;     //用户id
    private String USERNAME;    //用户名
    private String PASSWORD;    //密码
    private String NAME;        //姓名
    private String ROLE_ID;     //角色id
    private String ROLE_IDS;    //副职角色id
    private String LAST_LOGIN;  //最后登录时间
    private String IP;          //用户登录ip地址
    private String STATUS;      //状态
    private Role role;          //角色对象
    private Page page;          //分页对象
    private String SKIN;        //皮肤

    public Role getRole() {
        return role;
    }
    public void setRole(Role role) {
        this.role = role;
    }
    public Page getPage() {
        if(page==null)
            page = new Page();
        return page;
    }
    public void setPage(Page page) {
        this.page = page;
    }
}
