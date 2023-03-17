<!DOCTYPE html>
<html>
<head>
	<#assign ctx=request.contextPath />
	<meta charset="utf-8">
	<title>请假申请列表</title>
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<link rel="stylesheet" href="${ctx}/css/oksub.css" media="all" />
	<script type="text/javascript" src="${ctx}/plugins/loading/okLoading.js"></script>
</head>
<body>
<div class="ok-body">
	<!--模糊搜索区域-->
	<div class="layui-row">
		<form class="layui-form layui-col-md12 ok-search">
			<input class="layui-input" placeholder="开始日期" autocomplete="off" id="startTime" name="STRARTTIME">
			<input class="layui-input" placeholder="截止日期" autocomplete="off" id="endTime" name="ENDTIME">
			<input class="layui-input" placeholder="这里输入关键词" autocomplete="off" name="KEYWORDS" />
			<button class="layui-btn" lay-submit="" lay-filter="search"><i class="layui-icon">&#xe615;</i></button>
		</form>
	</div>
	<!--数据表格-->
	<table class="layui-hide" id="tableId" lay-filter="tableFilter"></table>
</div>
<!--js逻辑-->
<script type="text/javascript" src="${ctx}/plugins/layui/layui.js"></script>
<script>
	layui.use(["element", "jquery", "table", "form", "crud", "laydate"], function () {
		var table = layui.table, form = layui.form, $ = layui.jquery, crud = layui.crud, layTime = layui.laydate;

		layTime.render({elem: "#startTime", type: "datetime"});
		layTime.render({elem: "#endTime", type: "datetime"});

		okLoading.close($);
		var layTable = table.render({
			elem: '#tableId',
			method: 'post',
			url: '/myleave/list',
			limit: 20,
			page: true,
			toolbar: true,
			toolbar: "#toolbarTpl",
			size: "sm",
			cols: [[
				{field: "MYLEAVE_ID", type: "checkbox", fixed: "left"},
				{title: "NO.", type: "numbers"},
				{field: "TYPE", title: "类型"},
				{field: "STARTTIME", title: "开始时间", width: 200},
				{field: "ENDTIME", title: "结束时间", width: 200},
				{field: "WHENLONG", title: "时长"},
				{field: "USERNAME", title: "申请人"},
				{title: "操作", width: 100, align: "center", fixed: "right", templet: "#operationTpl"}
			]],
			done: function (res, curr, count) {
				console.info(res, curr, count);
			}
		});

		form.on("submit(search)", function (data) {
			layTable.reload({
				where: data.field,
				page: {currentPage: 1}
			});
			return false;
		});

		table.on("toolbar(tableFilter)", function (obj) {
			switch (obj.event) {
				case "batchDel":
					crud.batchDel('/myleave/deleteAll', table, "USER_ID");
					break;
				case "add":
					crud.imAdd('/im/ioas/myleave/myleave_edit', layTable, '50%', '70%');
					break;
			}
		});

		table.on("tool(tableFilter)", function (obj) {
			var data = obj.data;
			switch (obj.event) {
				case "del":
					crud.imDel('/myleave/delete', data.MYLEAVE_ID);
					break;
			}
		});
	})
</script>
<!-- 头工具栏模板 -->
<script type="text/html" id="toolbarTpl">
	<div class="layui-btn-container">
		<button class="layui-btn layui-btn-sm layui-btn-danger" lay-event="batchDel">批量删除</button>
		<button class="layui-btn layui-btn-sm" lay-event="add">请假申请</button>
	</div>
</script>
<!-- 行工具栏模板 -->
<script type="text/html" id="operationTpl">
	<a href="javascript:" title="删除" lay-event="del"><i class="layui-icon">&#xe640;</i></a>
</script>
</body>
</html>
