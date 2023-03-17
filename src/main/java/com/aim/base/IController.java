package com.aim.base;

import com.aim.entity.PageData;
import com.aim.entity.TreeData;
import com.aim.entity.system.Menu;
import com.aim.util.Const;
import com.aim.util.Jurisdiction;
import com.aim.util.UuidUtil;
import org.apache.shiro.session.Session;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

/**
 * 所有处理类父类
 */
public class IController {

	protected static final Logger LOG = LoggerFactory.getLogger(IController.class);

	/**
	 * new PageData对象
	 */
	public PageData getPageData() {
		return new PageData(this.getRequest());
	}

	/**
	 * 得到ModelAndView
	 */
	public ModelAndView getModelAndView() {
		return new ModelAndView();
	}

	/**
	 * 得到request对象
	 */
	public HttpServletRequest getRequest() {
		ServletRequestAttributes requestAttributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
		return requestAttributes.getRequest();
	}

	/**
	 * 得到32位的uuid
	 */
	public String get32UUID() {
		return UuidUtil.get32UUID();
	}

	/**
	 * 清理session
	 */
	public void removeSession(String USERNAME) {
		Session session = Jurisdiction.getSession();    //以下清除session缓存
		session.removeAttribute(Const.SESSION_USER);
		session.removeAttribute(USERNAME + Const.SESSION_ROLE_RIGHTS);
		session.removeAttribute(USERNAME + Const.SESSION_ALLMENU);
		session.removeAttribute(USERNAME + Const.SHIROSET);
		session.removeAttribute(Const.SESSION_USERNAME);
		session.removeAttribute(Const.SESSION_U_NAME);
		session.removeAttribute(Const.SESSION_USERROL);
		session.removeAttribute(Const.SESSION_RNUMBERS);
		session.removeAttribute(Const.SKIN);
	}

	/**
	 * 菜单列表转换成TREE结构
	 *
	 * @param resultList 结果集合
	 * @param menuList   菜单列表集合
	 */
	public void convertMenu(List<TreeData> resultList, List<Menu> menuList) {
		for (Menu menu : menuList) {
			TreeData mt = new TreeData();
			mt.setId(menu.getMENU_ID());
			mt.setPid(menu.getPARENT_ID());
			mt.setTitle(menu.getMENU_NAME());
			mt.setHref(menu.getMENU_URL());
			mt.setIcon(menu.getMENU_ICON());
			List<Menu> subMenu = menu.getSubMenu();
			if (subMenu.size() > 0) {
				List<TreeData> childrenList = new ArrayList<TreeData>();
				convertMenu(childrenList, subMenu);
				mt.setChildren(childrenList);
			}
			resultList.add(mt);
		}
	}
}
