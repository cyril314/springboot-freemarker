package com.fit.base;

import java.util.HashMap;

/**
 * 操作消息提醒
 */
public class AjaxResult extends HashMap<String, Object> {

    private static final long serialVersionUID = 1L;

    /**
     * 初始化一个新创建的 Message 对象
     */
    public AjaxResult() {
    }

    /**
     * 返回成功消息
     *
     * @param key   键值
     * @param value 内容
     */
    @Override
    public AjaxResult put(String key, Object value) {
        super.put(key, value);
        return this;
    }

    /**
     * 返回消息
     *
     * @param code  信息码
     * @param msg   内容
     * @param count 分页总数量
     * @param obj   返回数据
     */
    public static AjaxResult results(int code, String msg, int count, Object obj) {
        AjaxResult json = new AjaxResult();
        json.put("code", code);
        json.put("result", msg);
        json.put("count", count);
        json.put("data", obj);
        return json;
    }

    /**
     * 返回错误消息
     */
    public static AjaxResult error() {
        return error("error");
    }

    /**
     * 返回错误消息
     *
     * @param msg 内容
     */
    public static AjaxResult error(String msg) {
        return error(-1, msg, "");
    }

    /**
     * 返回错误消息
     *
     * @param code 错误码
     * @param obj  内容
     */
    public static AjaxResult error(int code, Object obj) {
        return results(code, "操作失败", 0, obj);
    }

    /**
     * 返回错误消息
     *
     * @param code 错误码
     * @param msg  内容
     * @param obj  内容
     */
    public static AjaxResult error(int code, String msg, Object obj) {
        return results(code, msg, 0, obj);
    }

    /**
     * 返回成功消息
     */
    public static AjaxResult success() {
        return AjaxResult.success("success");
    }

    /**
     * 返回成功消息
     *
     * @param msg 内容
     */
    public static AjaxResult success(String msg) {
        return success(0, msg, 0, null);
    }

    /**
     * 返回成功消息
     *
     * @param count 分页总数量
     * @param obj   返回数据
     */
    public static AjaxResult success(int count, Object obj) {
        return success(0, "获取列表成功", count, obj);
    }

    /**
     * 返回成功消息
     *
     * @param msg 内容
     * @param obj 返回数据
     */
    public static AjaxResult success(String msg, Object obj) {
        return success(0, msg, 0, obj);
    }

    /**
     * 返回成功消息
     *
     * @param code 信息码
     * @param msg  内容
     * @param obj  返回数据
     */
    public static AjaxResult success(int code, String msg, Object obj) {
        return success(code, msg, 0, obj);
    }

    /**
     * 返回成功消息
     *
     * @param code  信息码
     * @param msg   内容
     * @param count 分页总数量
     * @param obj   返回数据
     */
    public static AjaxResult success(int code, String msg, int count, Object obj) {
        return results(code, msg, count, obj);
    }
}
