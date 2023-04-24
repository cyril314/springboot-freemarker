package com.fit.config;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 错误异常拦截处理
 */
@Configuration
public class ExceptionConfig implements HandlerExceptionResolver {

    private static final Logger LOG = LoggerFactory.getLogger(ExceptionConfig.class);

    @Override
    public ModelAndView resolveException(HttpServletRequest req, HttpServletResponse resp, Object handler, Exception ex) {
        ModelAndView mv = new ModelAndView(new MappingJackson2JsonView());    //返回json
        String exInfo = ex.toString().replaceAll("\n", "<br/>");

        boolean status = exInfo.contains("Subject does not have permission");

        if (status) {
            exInfo = "[没有此页面的访问权限]" + exInfo;
        } else {
            LOG.info("==============异常开始=============");
            ex.printStackTrace();
            LOG.info("==============异常结束=============");
        }
        mv.addObject("exception", exInfo);
        mv.addObject("result", "exception");

        return mv;
    }
}
