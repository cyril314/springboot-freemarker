<!DOCTYPE html>
<html>
<head>
	<#assign ctx=request.contextPath />
	<meta charset="utf-8">
	<title>在线列表</title>
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
	layui.use(["element", "jquery", "table"], function () {
		var table = layui.table, $ = layui.jquery;

		okLoading.close($);
		var layTable = table.render({
			elem: '#tableId',
			method: 'post',
			url: '/log/list',
			page: true,
			toolbar: "#toolbarTpl",
			size: "sm",
			cols: [[
				{title: "NO.", type: "numbers"},
				{field: "USERNAME", title: "用户名"},
				{title: "操作", width: 100, align: "center", fixed: "right", templet: "#operationTpl"}
			]],
			done: function (res, curr, count) {
				console.info(res, curr, count);
			}
		});

		table.on("tool(tableFilter)", function (obj) {
		});
	})
</script>
<!-- 行工具栏模板 -->
<script type="text/html" id="operationTpl">
	<a href="javascript:" title="强制下线" lay-event="toff"><i class="layui-icon">&#xe640;</i></a>
</script>
</body>
</html>
