package com.aim.config;

import com.aim.util.DbUtil;
import org.springframework.boot.web.server.ConfigurableWebServerFactory;
import org.springframework.boot.web.server.WebServerFactoryCustomizer;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * WEB服务器设置
 */
@Configuration
public class WebServerFactoryConfig {

    @Bean
    public WebServerFactoryCustomizer<ConfigurableWebServerFactory> containerCustomizer() {
        return new WebServerFactoryCustomizer<ConfigurableWebServerFactory>() {

            @Override
            public void customize(ConfigurableWebServerFactory factory) {
                //启动时会执行这里
                //factory.setPort(8081);	//端口设置
                reductionDbBackupQuartzState();//
            }

            /**
             * 服务重启时，所有定时备份状态关闭
             */
            public void reductionDbBackupQuartzState() {
                try {
                    DbUtil.executeUpdate("update DB_TIMINGBACKUP set STATUS = '2'");
                } catch (Exception e) {
                    System.out.println("===============数据库备份异常==============");
                    System.out.println("========请检查db.properties配置文件========");
                }
            }
        };
    }
}
