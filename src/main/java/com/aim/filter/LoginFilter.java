package com.aim.filter;

import com.aim.entity.system.User;
import com.aim.util.Const;
import com.aim.util.Jurisdiction;
import org.apache.shiro.session.Session;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @Author AIM
 * @Des 登录拦截器, 判断用户过期
 * @DATE 2019/12/6
 */
@Component
public class LoginFilter implements HandlerInterceptor {

	private static final String LOGIN_URI = "/admin/login";

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		if (isJson(request)) {
			Session session = Jurisdiction.getSession();
			User user = (User) session.getAttribute(Const.SESSION_USER);
			// session过期
			if (user == null) {
				// 通过接口跳转登录页面, 注:重定向后下边的代码还会执行 ;
				response.sendRedirect(request.getContextPath() + LOGIN_URI); //重定向到登录界面
				return false;
			}
		}
		return true;
	}

	/**
	 * 判断本次请求的数据类型是否为json
	 */
	private boolean isJson(HttpServletRequest request) {
		if (request.getContentType() != null) {
			return request.getContentType().contains("application/json");
		}

		return false;
	}
}
