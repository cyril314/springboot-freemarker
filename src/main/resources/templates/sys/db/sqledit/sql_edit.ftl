<!DOCTYPE html>
<html>
<head>
	<#assign ctx=request.contextPath />
	<meta charset="utf-8">
	<title>SQL编辑</title>
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
