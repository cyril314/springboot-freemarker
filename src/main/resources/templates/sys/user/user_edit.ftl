<!DOCTYPE html>
<html>
<head>
	<#assign ctx=request.contextPath />
	<meta charset="utf-8">
	<title>用户编辑</title>
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<link rel="stylesheet" href="${ctx}/css/oksub.css" media="all" />
	<script type="text/javascript" src="${ctx}/plugins/loading/okLoading.js"></script>
</head>
<body>
<div class="ok-body">
	<!--form表单-->
	<form class="layui-form ok-form" lay-filter="filter">
		<input type="hidden" id="USER_ID" name="USER_ID" />
		<div class="layui-form-item">
			<label class="layui-form-label">用户名</label>
			<div class="layui-input-block">
				<input type="text" name="USERNAME" placeholder="请输入用户名" class="layui-input" lay-verify="required" />
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">编号</label>
			<div class="layui-input-block">
				<input type="text" name="NUMBER" placeholder="请输入" class="layui-input" lay-verify="required" />
			</div>
		</div>
		<div class="layui-form-item pwd">
			<label class="layui-form-label">密码</label>
			<div class="layui-input-block">
				<input type="password" name="PASSWORD" placeholder="请输入" class="layui-input" lay-verify="required" />
			</div>
		</div>
		<div class="layui-form-item pwd">
			<label class="layui-form-label">确认密码</label>
			<div class="layui-input-block">
				<input type="password" name="chkpwd" placeholder="请输入" class="layui-input" lay-verify="required" />
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">姓名</label>
			<div class="layui-input-block">
				<input type="text" name="NAME" placeholder="请输入" class="layui-input" lay-verify="required" />
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">手机号</label>
			<div class="layui-input-block">
				<input type="text" name="PHONE" placeholder="请输入" class="layui-input" lay-verify="phone" />
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">邮箱</label>
			<div class="layui-input-block">
				<input type="text" name="EMAIL" placeholder="请输入" class="layui-input" lay-verify="email" />
			</div>
		</div>
		<div class="layui-form-item layui-form-text">
			<label class="layui-form-label">备注说明</label>
			<div class="layui-input-block">
				<input type="text" name="BZ" placeholder="请输入备注说明" class="layui-input" />
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-input-block">
				<button class="layui-btn" lay-submit lay-filter="edit">立即提交</button>
				<button type="reset" class="layui-btn layui-btn-primary">重置</button>
			</div>
		</div>
	</form>
</div>
<!--js逻辑-->
<script type="text/javascript" src="${ctx}/plugins/layui/layui.js"></script>
<script>
	var initData, form,$;
	layui.use(["element", "form", "okLayer", "okUtils"], function () {
		form = layui.form;
		var okLayer = layui.okLayer;
		var okUtils = layui.okUtils;
		$ = layui.jquery;
		okLoading.close();

		form.on("submit(edit)", function (data) {
			okUtils.ajax("/button/edit", "post", data.field, true).done(function (response) {
				console.log(response);
				okLayer.greenTickMsg("编辑成功", function () {
					parent.layer.close(parent.layer.getFrameIndex(window.name));
				});
			}).fail(function (error) {
				console.log(error)
			});
			return false;
		});
	});

	function initForm(data) {
		var jsonString = JSON.stringify(data);
		initData = JSON.parse(jsonString);
		if (initData) {$('.pwd').remove()}
		form.val("filter", initData);
	}
</script>
</body>
</html>
