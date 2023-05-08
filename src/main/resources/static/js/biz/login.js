var salt = "imboot";

function islogin() {
    $.ajax({
        xhrFields: {
            withCredentials: true
        },
        type: "POST",
        url: httpurl + '/islogin',
        data: {tm: new Date().getTime()},
        dataType: "json",
        success: function (data) {
            if ("success" == data.data) {
                window.location.href = "/main/index";
            }
        }
    });
}

function login() {
    var USERNAME = $("#USERNAME").val();
    if (USERNAME == "") {
        $("#USERNAME").tips({
            side: 2,
            msg: '用户名不得为空',
            bg: '#AE81FF',
            time: 3
        });
        return false;
    }
    var PASSWORD = $("#PASSWORD").val();
    if (PASSWORD == "") {
        $("#PASSWORD").tips({
            side: 2,
            msg: '密码不得为空',
            bg: '#AE81FF',
            time: 3
        });
        return false;
    }
    var HOLD = document.getElementById('checkbox-fill-a1').checked;

    //发送 post 请求
    $.ajax({
        xhrFields: {
            withCredentials: true
        },
        type: "POST",
        url: httpurl + '/check',
        data: {KEYDATA: Base64.encode(USERNAME + salt + PASSWORD), hold: HOLD, tm: new Date().getTime()},
        dataType: "json",
        success: function (data) {
            if ("success" == data.result) {
                $("#USERNAME").tips({
                    side: 2,
                    msg: '正在登录 , 请稍后 ...',
                    bg: '#68B500',
                    time: 10
                });
                window.location.href = "/main/index";
            } else if ("usererror" == data.result) {
                $("#USERNAME").tips({
                    side: 2,
                    msg: "用户名或密码有误",
                    bg: '#FF5080',
                    time: 15
                });
                $("#USERNAME").focus();
            } else if ("error" == data.result) {
                $("#USERNAME").tips({
                    side: 2,
                    msg: "缺少参数",
                    bg: '#FF5080',
                    time: 15
                });
                $("#USERNAME").focus();
            } else if ("exception" == data.result) {
                showException("登录", data.exception);//显示异常
            }
        }
    }).done().fail(function () {
        swal("登录失败!,请求服务器无响应，稍后再试", "warning");
    });
}

$(function () {
    islogin();
    //重启之后 点击左侧列表跳转登录首页
    if (window != top) {
        top.location.href = location.href;
    }
    //回车登录
    document.onkeydown = function (e) {
        var key = window.event.keyCode;
        if (key == 13) {
            login();
        }
    };

    $("#to-login").click(function () {
        login();
    });
});