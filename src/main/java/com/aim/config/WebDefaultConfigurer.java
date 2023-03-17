package com.aim.config;

import com.aim.filter.LoginFilter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/**
 * @AUTO web 配置类
 * @Author AIM
 * @DATE 2019/10/23
 */
@Configuration
public class WebDefaultConfigurer implements WebMvcConfigurer {

	@Value("${spring.resource.static-locations}")
	private String staticLocations;
	@Autowired
	private LoginFilter loginFilter;

	/**
	 * 静态资源映射
	 */
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		//本应用
		registry.addResourceHandler("/**").addResourceLocations(staticLocations.split(","));
	}

	/**
	 * 访问根路径默认跳转 index页面（简化部署方案： 可以把前端打包直接放到项目的 webapp，上面的配置）
	 */
	@Override
	public void addViewControllers(ViewControllerRegistry registry) {
		registry.addViewController("/").setViewName("index");
	}

	/**
	 * 定义拦截规则, 根据自己需要进行配置拦截和排除的接口
	 */
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(loginFilter).addPathPatterns("/**").excludePathPatterns("/").excludePathPatterns("login");
	}
}
