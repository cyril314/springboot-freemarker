package com.aim.config.shiro;

import org.apache.shiro.mgt.SecurityManager;
import org.apache.shiro.spring.web.ShiroFilterFactoryBean;
import org.apache.shiro.web.filter.mgt.FilterChainManager;
import org.apache.shiro.web.filter.mgt.PathMatchingFilterChainResolver;
import org.apache.shiro.web.mgt.WebSecurityManager;
import org.apache.shiro.web.servlet.AbstractShiroFilter;
import org.springframework.beans.factory.BeanInitializationException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.HashSet;
import java.util.Set;

/**
 * MyShiroFilterFactoryBean
 */
public class DefaultShiroFilterFactoryBean extends ShiroFilterFactoryBean {

    private Set<String> ignoreExt; // ShiroFilter将直接忽略的请求

    public DefaultShiroFilterFactoryBean() {
        super();
        ignoreExt = new HashSet<String>();
        ignoreExt.add(".ico");
        ignoreExt.add(".jpg");
        ignoreExt.add(".png");
        ignoreExt.add(".gif");
        ignoreExt.add(".bmp");
        ignoreExt.add(".js");
        ignoreExt.add(".css");
    }

    /**
     * 启动时加载
     */
    @Override
    protected AbstractShiroFilter createInstance() throws Exception {
        SecurityManager securityManager = getSecurityManager();
        if (securityManager == null) {
            throw new BeanInitializationException("SecurityManager property must be set.");
        }

        if (!(securityManager instanceof WebSecurityManager)) {
            throw new BeanInitializationException("The security manager does not implement the WebSecurityManager interface.");
        }

        PathMatchingFilterChainResolver chainResolver = new PathMatchingFilterChainResolver();
        FilterChainManager chainManager = createFilterChainManager();
        chainResolver.setFilterChainManager(chainManager);
        return new MySpringShiroFilter((WebSecurityManager) securityManager, chainResolver);
    }

    /**
     * 启动时加载
     */
    private class MySpringShiroFilter extends AbstractShiroFilter {

        public MySpringShiroFilter(WebSecurityManager securityManager, PathMatchingFilterChainResolver chainResolver) {
            super();
            if (securityManager == null) {
                throw new IllegalArgumentException("WebSecurityManager property cannot be null.");
            }
            setSecurityManager(securityManager);
            if (chainResolver != null) {
                setFilterChainResolver(chainResolver);
            }
        }

        /**
         * 页面上传输的url先进入此方法验证
         */
        @Override
        protected void doFilterInternal(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
            HttpServletRequest request = (HttpServletRequest) req;
            String str = request.getRequestURI().toLowerCase();
            boolean flag = true;
            int idx = 0;
            if ((idx = str.lastIndexOf(".")) > 0) {
                str = str.substring(idx);
                if (ignoreExt.contains(str.toLowerCase())) {
                    flag = false;
                }
            }
            if (flag) {
                super.doFilterInternal(req, resp, chain);
            } else {
                chain.doFilter(req, resp);
            }
        }
    }
}
