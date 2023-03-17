"use strict";
layui.define(["okLayer", "okUtils"], function (exports) {
    var okLayer = layui.okLayer;
    var okUtils = layui.okUtils;

    var crud = {
        /**
         * 批量删除
         * @param uri 请求URL
         * @param table 初始化layui.table对象
         * @param keyName 删除的主键名称
         */
        batchDel: function (uri, table, keyName) {
            okLayer.confirm("确定要批量删除吗？", function (index) {
                layer.close(index);
                var idsStr = okUtils.tableBatchCheck(table, keyName);
                if (idsStr) {
                    okUtils.ajax(uri, {'DATA_IDS': idsStr}, true).done(function (response) {
                        console.log(response);
                        okUtils.tableSuccessMsg(response.data);
                    }).fail(function (error) {
                        console.log(error)
                    });
                }
            });
        },
        /**
         * 添加页面弹出层
         * @param uri 请求URL
         * @param table 初始化的表格对象
         * @param width 窗口宽度
         * @param height 窗口高度
         */
        imAdd: function (uri, table, width, height) {
            okLayer.open("添加", uri, width, height, null, function () {
                table.reload();
            })
        },
        /**
         * 编辑页面弹出层
         * @param uri 请求URL
         * @param data 列表中的对象参数
         * @param table 初始化的表格对象
         * @param width 窗口宽度
         * @param height 窗口高度
         */
        imEdit: function (uri, data, table, width, height) {
            okLayer.open("更新", uri, width, height, function (layero) {
                var iframeWin = window[layero.find("iframe")[0]["name"]];
                iframeWin.initForm(data);
            }, function () {
                table.reload();
            })
        },
        /**
         * 删除
         * @param uri 请求URL
         * @param id 删除的主键ID
         */
        imDel: function (uri, id) {
            okLayer.confirm("确定要删除吗？", function () {
                okUtils.ajax(uri, {'ID': id}, true).done(function (response) {
                    console.log(response);
                    okUtils.tableSuccessMsg(response.data);
                }).fail(function (error) {
                    console.log(error)
                });
            })
        }
    };

    exports("crud", crud);
});

