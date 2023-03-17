<!DOCTYPE html>
<html>
<head>
	<#assign ctx=request.contextPath />
	<meta charset="utf-8">
	<title>字典编辑</title>
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<link rel="stylesheet" href="${ctx}/css/oksub.css" media="all" />
	<script type="text/javascript" src="${ctx}/plugins/loading/okLoading.js"></script>
</head>
<body>
<div class="ok-body">
	<!--form表单-->
	<form class="layui-form layui-form-pane ok-form" lay-filter="filter">
		<input type="hidden" id="DICTIONARIES_ID" name="DICTIONARIES_ID" />
		<div class="layui-form-item">
			<label class="layui-form-label">中文名称</label>
			<div class="layui-input-block">
				<input type="text" name="NAME" placeholder="请输入中文名称" class="layui-input" lay-verify="required" />
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">英文名称</label>
			<div class="layui-input-block">
				<input type="text" name="NAME_EN" placeholder="请输入英文名称" class="layui-input" lay-verify="required" />
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">编码</label>
			<div class="layui-input-block">
				<input type="text" name="BIANMA" placeholder="请输入编码" class="layui-input" lay-verify="required" />
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">排序</label>
			<div class="layui-input-block">
				<input type="text" name="ORDER_BY" placeholder="请输入排序" class="layui-input" lay-verify="required" />
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">备注</label>
			<div class="layui-input-block">
				<input type="text" name="BZ" placeholder="请输入排序" class="layui-input" lay-verify="required" />
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">排查表</label>
			<div class="layui-input-block">
				<input type="text" name="TBSNAME" placeholder="请输入表名, 多个用逗号分隔(非必录)" class="layui-input" lay-verify="required" />
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">关联字段</label>
			<div class="layui-input-block">
				<input type="text" name="TBFIELD" placeholder="请输入关联字段,默认:BIANMA(非必录)" class="layui-input" lay-verify="required" />
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
			okUtils.ajax("/dictionaries/edit", "post", data.field, true).done(function (response) {
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
