package com.aim.entity.system;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.List;

/**
 * 菜单实体类
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Menu implements Serializable {

	private static final long serialVersionUID = 1L;

	private String MENU_ID;     //菜单ID
	private String MENU_NAME;   //菜单名称
	private String MENU_URL;    //链接
	private String PARENT_ID;   //上级菜单ID
	private String MENU_ORDER;  //排序
	private String MENU_ICON;   //图标
	private String MENU_TYPE;   //类型
	private String MENU_STATE;  //菜单状态
	private String SHIRO_KEY;   //权限标识
	private String target;
	private Menu parentMenu;    //上级菜单对象
	private List<Menu> subMenu; //子集菜单
	private boolean hasMenu = false;
}
