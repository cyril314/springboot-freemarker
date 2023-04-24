package com.fit;

import lombok.extern.slf4j.Slf4j;
import org.activiti.spring.boot.SecurityAutoConfiguration;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.context.ConfigurableApplicationContext;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.Optional;

@Slf4j
@EnableCaching
@SpringBootApplication(exclude = {SecurityAutoConfiguration.class})//去除冲突
public class AimApplication extends SpringBootServletInitializer {

    public static void main(String[] args) throws UnknownHostException {
        ConfigurableApplicationContext run = SpringApplication.run(AimApplication.class, args);
        String ip = InetAddress.getLocalHost().getHostAddress();
        String port = getParam("PORT", "8080");

        log.info("\n---------------------------------------------------------\n" +
                "Application FhAdmin is running! Access URLs:\n\t" +
                "Local: \t\thttp://localhost:" + port + "/\n\t" +
                "External:\thttp://" + ip + ":" + port + "/" +
                "\n-----------------页面请部署 admin-web----------------------");
    }

    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
        return application.sources(AimApplication.class);
    }

    private static String getParam(String param, String defVal) {
        Optional<String> envPort = Optional.ofNullable(System.getenv(param));
        return envPort.map(String::valueOf).orElse(defVal);
    }
}
