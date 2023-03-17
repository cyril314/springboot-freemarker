<!DOCTYPE html>
<html>
<head>
	<#assign ctx=request.contextPath />
	<meta charset="utf-8">
	<title>用户列表</title>
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<link rel="stylesheet" href="${ctx}/css/oksub.css" media="all" />
	<script type="text/javascript" src="${ctx}/plugins/loading/okLoading.js"></script>
</head>
<body>
<div class="ok-body">
	<!--数据表格-->
	<table class="layui-hide" id="tableId" lay-filter="tableFilter"></table>
</div>
<!--js逻辑-->
<script type="text/javascript" src="${ctx}/plugins/layui/layui.js"></script>
<script>
	layui.use(["element", "jquery", "table", "form", "crud"], function () {
		var table = layui.table, form = layui.form, $ = layui.jquery, crud = layui.crud;

		okLoading.close($);
		var layTable = table.render({
			elem: '#tableId',
			method: 'post',
			url: '/role/list',
			page: true,
			toolbar: "#toolbarTpl",
			size: "sm",
			cols: [[
				{title: "NO.", type: "numbers"},
				{field: "role_NAME", title: "角色"},
				{field: "rnumber", title: "编码"},
				{field: "ROLE_ID", title: "增"},
				{field: "ROLE_ID", title: "删"},
				{field: "ROLE_ID", title: "改"},
				{field: "ROLE_ID", title: "查"},
				{title: "操作", width: 100, align: "center", fixed: "right", templet: "#operationTpl"}
			]],
			done: function (res, curr, count) {
				console.info(res, curr, count);
			}
		});

		table.on("toolbar(tableFilter)", function (obj) {
			switch (obj.event) {
				case "add":
					crud.imAdd('/im/sys/role/role_edit', layTable, '50%', '70%');
					break;
			}
		});

		table.on("tool(tableFilter)", function (obj) {
			var data = obj.data;
			switch (obj.event) {
				case "edit":
					crud.imEdit('/im/sys/role/role_edit', data, layTable, '50%', '70%');
					break;
				case "del":
					crud.imDel('/role/delete', data.ROLE_ID);
					break;
			}
		});
	})
</script>
<!-- 头工具栏模板 -->
<script type="text/html" id="toolbarTpl">
	<div class="layui-btn-container">
		<button class="layui-btn layui-btn-sm" lay-event="add">添加</button>
	</div>
</script>
<!-- 行工具栏模板 -->
<script type="text/html" id="operationTpl">
	<a href="javascript:" title="编辑" lay-event="edit"><i class="layui-icon">&#xe642;</i></a>
	<a href="javascript:" title="删除" lay-event="del"><i class="layui-icon">&#xe640;</i></a>
</script>
</body>
</html>
