<!DOCTYPE html>
<html>
<head>
	<#assign ctx=request.contextPath />
	<meta charset="utf-8">
	<title>按钮编辑</title>
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<link rel="stylesheet" href="${ctx}/css/oksub.css" media="all" />
	<script type="text/javascript" src="${ctx}/plugins/loading/okLoading.js"></script>
</head>
<body>
<div class="ok-body">
	<!--form表单-->
	<form class="layui-form ok-form" lay-filter="filter">
		<input type="hidden" id="BUTTON_ID" name="BUTTON_ID" />
		<div class="layui-form-item">
			<label class="layui-form-label">按钮名称</label>
			<div class="layui-input-block">
				<input type="text" name="NAME" placeholder="按钮名称" class="layui-input" lay-verify="required" />
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">权限标识</label>
			<div class="layui-input-block">
				<textarea name="SHIRO_KEY" placeholder="请输入标签代码" class="layui-textarea" lay-verify="required"></textarea>
			</div>
		</div>
		<div class="layui-form-item layui-form-text">
			<label class="layui-form-label">备注说明</label>
			<div class="layui-input-block">
				<input type="text" name="BZ" placeholder="请输入备注说明" class="layui-input" lay-verify="required" />
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
	var initData, form;
	layui.use(["element", "form", "okLayer", "okUtils"], function () {
		form = layui.form;
		var okLayer = layui.okLayer;
		var okUtils = layui.okUtils;
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
		form.val("filter", initData);
	}
</script>
</body>
</html>
