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
	<!--模糊搜索区域-->
	<div class="layui-row">
		<form class="layui-form layui-col-md12">
			<div class="layui-input-inline">
				<input class="layui-input" placeholder="请输入关键词" autocomplete="off" name="KEYWORDS" />
			</div>
			<div class="layui-input-inline">
				<input class="layui-input" placeholder="开始日期" autocomplete="off" id="startTime" name="STRARTTIME">
			</div>
			<div class="layui-input-inline">
				<input class="layui-input" placeholder="截止日期" autocomplete="off" id="endTime" name="ENDTIME">
			</div>
			<div class="layui-input-inline">
				<select name="ROLE_ID" id="ROLE_ID" lay-filter="select" lay-search=""></select>
			</div>
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
			url: '/user/list',
			page: true,
			toolbar: "#toolbarTpl",
			size: "sm",
			cols: [[
				{field: "USER_ID", type: "checkbox", fixed: "left"},
				{title: "NO.", type: "numbers"},
				{field: "NUMBER", title: "编号"},
				{field: "USERNAME", title: "用户名"},
				{field: "NAME", title: "姓名"},
				{field: "ROLE_NAME", title: "角色"},
				{field: "EMAIL", title: "邮箱", width: 150},
				{field: "LAST_LOGIN", title: "最近登录", width: 150},
				{field: "IP", title: "上次登录IP"},
				{title: "操作", width: 100, align: "center", fixed: "right", templet: "#operationTpl"}
			]],
			done: function (res, curr, count) {
				console.info(res, curr, count);
				var sels = document.getElementById("ROLE_ID");
				if (sels.children.length < 1) {
					sels.innerHTML = '<option value="">请选择角色</option>';
					var list = res.roleList;
					for (var p in list) {
						var option = document.createElement("option"); // 创建添加option属性
						option.setAttribute("value", list[p].role_ID); // 给option的value添加值
						option.innerText = list[p].role_NAME; // 打印option对应的纯文本
						sels.appendChild(option);   //给select添加option子标签
					}
					form.render("select");
				}
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
					crud.batchDel('/user/deleteAll', table, "USER_ID");
					break;
				case "add":
					crud.imAdd('/im/sys/user/user_edit', layTable, '50%', '70%');
					break;
			}
		});

		table.on("tool(tableFilter)", function (obj) {
			var data = obj.data;
			switch (obj.event) {
				case "edit":
					crud.imEdit('/im/sys/user/user_edit', data, layTable, '50%', '70%');
					break;
				case "del":
					crud.imDel('/user/delete', data.USER_ID);
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
