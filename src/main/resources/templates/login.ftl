<!DOCTYPE html>
<html lang="en">
<head>
    <#assign ctx=request.contextPath />
    <title>登陆</title>
    <link rel="stylesheet" href="https://cdn.bootcss.com/twitter-bootstrap/4.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="${ctx}/plugins/layui/css/modules/layer/default/layer.css">
    <link rel="stylesheet" href="${ctx}/plugins/login/css/templatemo-style.css">
</head>
<body>
<!-- 登录页动态效果 -->
<div id="particles-js"></div>

<div id="app" class="auth-wrapper aut-bg-img">
    <div class="auth-content">
        <div class="text-white">
            <div class="card-body text-center">
                <div class="mb-4">
                    <i class="layui-icon icon-unlock"></i>
                </div>
                <h3 class="mb-4 text-white">系统登陆</h3>
                <div class="input-group mb-3">
                    <input type="text" class="form-control" placeholder="请输入用户名" id="USERNAME"/>
                </div>
                <div class="input-group mb-4">
                    <input type="password" class="form-control" placeholder="请输入密码" id="PASSWORD"/>
                </div>
                <div class="form-group text-left">
                    <div class="checkbox checkbox-fill d-inline">
                        <input type="checkbox" id="checkbox-fill-a1" />
                        <label id="checkbox-fill-label" for="checkbox-fill-a1" class="cr"> 保持登录</label>
                    </div>
                </div>
                <button class="btn btn-primary shadow-2 mb-4" id="to-login">登录</button>
                <!-- <p class="mb-0 text-muted">没有帐户? <a class="text-white" href="register.html">注册</a></p> -->
            </div>
        </div>
    </div>
</div>
</body>
<script type="text/javascript" src="${ctx}/plugins/jquery/jquery.min.js"></script>
<!-- 登录页动态效果 -->
<script type="text/javascript" src="${ctx}/plugins/login/js/particles.js"></script>
<script type="text/javascript" src="${ctx}/plugins/login/js/app.js"></script>
<!-- 表单验证提示插件 -->
<script type="text/javascript" src="${ctx}/plugins/jquery/jquery.tips.js"></script>
<!-- 登录表单提交 -->
<script type="text/javascript" src="${ctx}/plugins/layui/lay/modules/layer.js"></script>
<script type="text/javascript" src="${ctx}/js/config.js"></script>
<script type="text/javascript" src="${ctx}/js/Base64.js"></script>
<script type="text/javascript" src="${ctx}/js/biz/login.js"></script>
</html>
