package com.aim.config;

import ch.qos.logback.core.PropertyDefinerBase;

/**
 * @Author AIM
 * @Des 日志路径
 * @DATE 2022/7/20
 */
public class LogPathDefiner extends PropertyDefinerBase {

	@Override
	public String getPropertyValue() {
		return System.getProperty("user.dir");
	}
}
