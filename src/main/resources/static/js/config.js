//显示异常
function showException(modular, exception) {
    swal("[" + modular + "]程序异常!抱歉！请稍后重试或联系管理员, " + exception, "warning");
}

function swal(msg, type) {
    if (type == "warning") {
        layer.msg(msg, {time: 5000, icon: 5});
    } else {
        layer.msg(msg, {time: 5000, icon: 6});
    }
}

//javascript获取当前部署项目路径
function getRootPath_web() {
    var pathName = window.location.pathname.substring(1);
    var webName = pathName == '' ? '' : pathName.substring(0, pathName.indexOf('/'));
    if (webName == "") {
        return window.location.protocol + '//' + window.location.host;
    } else {
        return window.location.protocol + '//' + window.location.host + '/' + webName;
    }
}

//服务器host
var httpurl = getRootPath_web();
