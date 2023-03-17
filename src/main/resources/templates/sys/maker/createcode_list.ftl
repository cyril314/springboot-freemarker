<!DOCTYPE html>
<html>
<head>
	<#assign ctx=request.contextPath />
	<meta charset="utf-8">
	<title>正向生成列表</title>
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
			url: '/createCode/list',
			page: true,
			toolbar: "#toolbarTpl",
			size: "sm",
			cols: [[
				{title: "NO.", type: "numbers"},
				{field: "TITLE", title: "说明"},
				{field: "PACKAGENAME", title: "包名"},
				{field: "OBJECTNAME", title: "类名"},
				{field: "TABLENAME", title: "表名"},
				{field: "HTYPE", title: "类型", templet: function (d) { return d.HTYPE == "single" ? "单表": d.HTYPE == "tree" ? "树形": d.HTYPE
					== "fathertable" ? "主表": d.HTYPE == "sontable" ? "明细表":　""}},
				{field: "CREATETIME", title: "创建时间", width: 150},
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
					crud.batchDel('/createCode/deleteAll', table, "USER_ID");
					break;
				case "add":
					crud.imAdd('/im/act/maker/ruprocdef_edit', layTable, '50%', '70%');
					break;
			}
		});

		table.on("tool(tableFilter)", function (obj) {
			var data = obj.data;
			switch (obj.event) {
				case "edit":
					crud.imEdit('/im/act/maker/ruprocdef_edit', data, layTable, '50%', '70%');
					break;
				case "del":
					crud.imDel('/createCode/delete', data.ID_);
					break;
			}
		});
	})
</script>
<!-- 头工具栏模板 -->
<script type="text/html" id="toolbarTpl">
	<div class="layui-btn-container">
		<button class="layui-btn layui-btn-sm layui-btn-danger" lay-event="batchDel">批量删除</button>
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
