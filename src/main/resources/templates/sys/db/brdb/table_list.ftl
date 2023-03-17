<!DOCTYPE html>
<html>
<head>
	<#assign ctx=request.contextPath />
	<meta charset="utf-8">
	<title>数据库备份列表</title>
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<link rel="stylesheet" href="${ctx}/css/oksub.css" media="all" />
	<script type="text/javascript" src="${ctx}/plugins/loading/okLoading.js"></script>
</head>
<body>
<div class="ok-body">
	<!--模糊搜索区域-->
	<div class="layui-row">
		<span class="layui-breadcrumb">
			<a href="javascript:;" id="dbtype"></a>
			<a href="javascript:;" id="databaseName"></a>
		</span>
	</div>
	<!--数据表格-->
	<table class="layui-hide" id="tableId" lay-filter="tableFilter"></table>
</div>
<!--js逻辑-->
<script type="text/javascript" src="${ctx}/plugins/layui/layui.js"></script>
<script>
	layui.use(["element", "jquery", "table", "crud"], function () {
		var table = layui.table, $ = layui.jquery, crud = layui.crud;

		okLoading.close($);
		var layTable = table.render({
			elem: '#tableId',
			method: 'post',
			url: '/brdb/listAllTable',
			page: true,
			toolbar: false,
			size: "sm",
			cols: [[
				{field: "USER_ID", type: "checkbox", fixed: "left"},
				{title: "NO.", type: "numbers"},
				{field: "NUMBER", title: "表明"},
				{title: "操作", width: 100, align: "center", fixed: "right", templet: "#operationTpl"}
			]],
			done: function (res, curr, count) {
			    $("#dbtype").html(res.dbtype);
			    $("#databaseName").html(res.databaseName);
				console.info(res, curr, count);
			}
		});
	})
</script>
<!-- 行工具栏模板 -->
<script type="text/html" id="operationTpl">
	<a href="javascript:" title="备份"><i class="ok-icon">&#xe706;</i></a>
</script>
</body>
</html>
