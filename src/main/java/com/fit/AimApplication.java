package com.fit;

import lombok.extern.slf4j.Slf4j;
import org.activiti.spring.boot.SecurityAutoConfiguration;
import org.apache.logging.log4j.util.Strings;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.core.env.ConfigurableEnvironment;

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
        String port = System.getenv("POST");
        ConfigurableEnvironment environment = run.getEnvironment();
        if (Strings.isEmpty(port)) {
            port = environment.getProperty("server.port");
        }
        String path = environment.getProperty("server.servlet.context-path", "").replace("/", "");
        log.info("---------------------------------------------------------");
        log.info("Access URLs:\n\tLocal: \t\thttp://localhost:{}/{}\n\tExternal:\t{}://{}:{}/{}", port, path, "http", ip, port, path);
        log.info("---------------------- admin-web ------------------------");
    }

    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
        return application.sources(AimApplication.class);
    }
}