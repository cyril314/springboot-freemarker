"use strict";
layui.define(["layer"], function (exprots) {
    var $ = layui.jquery;
    var okUtils = {
        /**
         * 是否前后端分离
         */
        isFrontendBackendSeparate: false,
        /**
         * 服务器地址
         */
        baseUrl: function () {
            var pathName = window.location.pathname.substring(1);
            var webName = pathName == '' ? '' : pathName.substring(0, pathName.indexOf('/'));
            if (webName == "") {
                return window.location.protocol + '//' + window.location.host;
            } else {
                return window.location.protocol + '//' + window.location.host + '/' + webName;
            }
        },
        /**
         * 获取body的总宽度
         */
        getBodyWidth: function () {
            return document.body.scrollWidth;
        },
        /**
         * 主要用于对ECharts视图自动适应宽度
         */
        echartsResize: function (element) {
            var element = element || [];
            window.addEventListener("resize", function () {
                var isResize = localStorage.getItem("isResize");
                // if (isResize == "false") {
                for (var i = 0; i < element.length; i++) {
                    element[i].resize();
                }
                // }
            });
        },
        /**
         * ajax()函数二次封装
         * @param url
         * @param params
         * @param load
         * @returns {*|never|{always, promise, state, then}}
         */
        ajax: function (url, params, load) {
            var deferred = $.Deferred();
            var loadIndex;
            $.ajax({
                url: okUtils.isFrontendBackendSeparate ? okUtils.baseUrl + url : url,
                type: "post",
                data: params || {},
                dataType: "json",
                beforeSend: function () {
                    if (load) {
                        loadIndex = layer.load(0, {shade: 0.3});
                    }
                },
                success: function (data) {
                    if (data.code == 0) {
                        // 业务正常
                        deferred.resolve(data)
                    } else {
                        // 业务异常
                        layer.msg(data.msg, {icon: 7, time: 2000});
                        deferred.reject("okUtils.ajax warn: " + data.msg);
                    }
                },
                complete: function () {
                    if (load) {
                        layer.close(loadIndex);
                    }
                },
                error: function () {
                    layer.close(loadIndex);
                    layer.msg("服务器错误", {icon: 2, time: 2000});
                    deferred.reject("okUtils.ajax error: 服务器错误");
                }
            });
            return deferred.promise();
        },
        /**
         * 主要用于针对表格批量操作操作之前的检查
         * @param table
         * @returns {string}
         */
        tableBatchCheck: function (table, keyName) {
            var checkStatus = table.checkStatus("tableId");
            var rows = checkStatus.data.length;
            if (rows > 0) {
                var idsStr = "";
                for (var i = 0; i < checkStatus.data.length; i++) {
                    idsStr += checkStatus.data[i][keyName] + ",";
                }
                return idsStr;
            } else {
                layer.msg("未选择有效数据", {offset: "t", anim: 6});
            }
        },
        /**
         * 在表格页面操作成功后弹窗提示
         * @param content
         */
        tableSuccessMsg: function (content) {
            layer.msg(content, {icon: 1, time: 1000}, function () {
                // 刷新当前页table数据
                $(".layui-laypage-btn")[0].click();
            });
        },
        /**
         * 获取父窗体的okTab
         * @returns {string}
         */
        getOkTab: function () {
            return parent.objOkTab;
        },
        /**
         * 格式化当前日期
         * @param date
         * @param fmt
         * @returns {void | string}
         */
        dateFormat: function (date, fmt) {
            var o = {
                "M+": date.getMonth() + 1,
                "d+": date.getDate(),
                "h+": date.getHours(),
                "m+": date.getMinutes(),
                "s+": date.getSeconds(),
                "q+": Math.floor((date.getMonth() + 3) / 3),
                "S": date.getMilliseconds()
            };
            if (/(y+)/.test(fmt))
                fmt = fmt.replace(RegExp.$1, (date.getFullYear() + "").substr(4 - RegExp.$1.length));
            for (var k in o)
                if (new RegExp("(" + k + ")").test(fmt))
                    fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
            return fmt;
        },
        number: {
            /**
             * 判断是否为一个正常的数字
             */
            isNumber: function (num) {
                if (num && !isNaN(num)) {
                    return true;
                }
                return false;
            },
            /**
             * 判断一个数字是否包括在某个范围
             * @param num
             * @param begin
             * @param end
             */
            isNumberWith: function (num, begin, end) {
                if (this.isNumber(num)) {
                    if (num >= begin && num <= end) {
                        return true;
                    }
                    return false;
                }
            },
        }
    };
    exprots("okUtils", okUtils);
});
