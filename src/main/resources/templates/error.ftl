<!DOCTYPE HTML>
<!--[if lt IE 7]>
<html class="no-js ie6 oldie" lang="zh"><![endif]-->
<!--[if IE 7]>
<html class="no-js ie7 oldie" lang="zh"><![endif]-->
<!--[if IE 8]>
<html class="no-js ie8 oldie" lang="zh"><![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js" lang="zh"><!--<![endif]-->
<head>
    <#assign ctx=request.contextPath />
    <meta charset="utf-8">
    <title>${status} - ${error}</title>
    <meta name="description" content="${code!}，${msg!}">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <!-- CSS: implied media=all -->
    <link type="image/x-icon" rel="icon" href="${ctx}/img/favicon.ico">
    <link rel="stylesheet" href="${ctx}/plugins/error/css/style.css">
    <link rel="stylesheet" id="codeCss" href="${ctx}/plugins/error/css/blue.css">
    <script type="text/javascript" src="${ctx}/plugins/jquery/jquery.min.js"></script>
    <script type="text/javascript" src="${ctx}/plugins/error/js/script.js"></script>
</head>
<body>
<div id="error-container">
    <div id="error">
        <div id="pacman"></div>
    </div>
    <div>
        <div style="padding:25px 10px 0px 10px">
            <p class="no-top" style="text-align: center;font-size: 30px;padding: 5PX;">${status} - ${message!error}</p>
            <p class="no-top" style="text-align: center;font-size: 18px;padding: 5PX;" id="clock"></p>
        </div>
    </div>
</div>
</body>
<script>
    $(function () {
        switch (${status!'0'}) {
            case 401:
                document.getElementById('codeCss').href = '${ctx}/plugins/error/css/401.css';
                break;
            case 404:
                document.getElementById('codeCss').href = '${ctx}/plugins/error/css/404.css';
                break;
            case 500:
                document.getElementById('codeCss').href = '${ctx}/plugins/error/css/500.css';
                break;
            default:
                break;
        }
    });
    setInterval(function () {
        var time = new Date().Format("yyyy-MM-dd HH:mm:ss");
        document.getElementById("clock").innerHTML = time;
    }, 1000);
</script>
</html>