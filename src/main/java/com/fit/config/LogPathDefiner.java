package com.fit.config;

import ch.qos.logback.core.PropertyDefinerBase;

import java.io.File;

/**
 * @Author AIM
 * @Des 日志路径
 * @DATE 2022/7/20
 */
public class LogPathDefiner extends PropertyDefinerBase {

    @Override
    public String getPropertyValue() {
        String LogPath = System.getProperty("user.dir");
        String dirPath = LogPath + "/target";
        File file = new File(dirPath);
        if (file.exists()) {
            LogPath = dirPath;
        }
        LogPath = LogPath + "/logs/";
        System.out.println(" - 日志存放路径: " + LogPath);
        return LogPath;
    }
}
