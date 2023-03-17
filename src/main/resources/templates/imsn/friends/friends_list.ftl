<!DOCTYPE html>
<html>
<head>
	<#assign ctx=request.contextPath />
	<meta charset="utf-8">
	<title>好友列表</title>
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
			url: '/friends/list',
			limit: 20,
			page: true,
			toolbar: true,
			toolbar: "#toolbarTpl",
			size: "sm",
			cols: [[
				{field: "FRIENDS_ID", type: "checkbox", fixed: "left"},
				{title: "NO.", type: "numbers"},
				{field: "FUSERNAME", title: "好友名称"},
				{field: "FGROUP_ID", title: "分组名称"},
				{field: "CTIME", title: "申请时间"},
				{field: "ALLOW", title: "是否同意", templet: "#statusTpl"},
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
					crud.batchDel('/friends/deleteAll', table, "FRIENDS_ID");
					break;
			}
		});

		table.on("tool(tableFilter)", function (obj) {
			var data = obj.data;
			switch (obj.event) {
				case "edit":
					crud.imEdit('/im/imsn/friends/friends_edit', data, layTable, '50%', '70%');
					break;
				case "del":
					crud.imDel('/friends/delete', data.FRIENDS_ID);
					break;
			}
		});
	})
</script>
<!-- 行工具栏模板 -->
<script type="text/html" id="operationTpl">
	<a href="javascript:" title="编辑" lay-event="edit"><i class="layui-icon">&#xe642;</i></a>
	<a href="javascript:" title="删除" lay-event="del"><i class="layui-icon">&#xe640;</i></a>
</script>

<!-- 状态模板 -->
<script type="text/html" id="statusTpl">
	{{#  if(d.ALLOW == 'yes'){ }}
	<span class="layui-btn layui-btn-normal layui-btn-xs">同意</span>
	{{#  } else if(d.ALLOW == 1) { }}
	<span class="layui-btn layui-btn-warm layui-btn-xs">拒绝</span>
	{{#  } }}
</script>
</body>
</html>
