<!DOCTYPE html>
<html>
<head>
	<#assign ctx=request.contextPath />
	<meta charset="utf-8">
	<title>字典列表</title>
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<link rel="stylesheet" href="${ctx}/css/oksub.css" media="all" />
</head>
<body>
<div class="ok-body">
	<!--模糊搜索区域-->
	<div class="layui-row">
		<div class="layui-col-md3">
			<div id="permissionTree"></div>
		</div>
		<div class="layui-col-md9">
			<form class="layui-form">
				<div class="layui-input-inline">
					<input class="layui-input" placeholder="这里输入关键词" autocomplete="off" name="KEYWORDS" />
				</div>
				<div class="layui-input-inline">
					<select name="DICTIONARIES_ID" id="DICTIONARIES_ID" lay-filter="select" lay-search="">
						<option id="DTSI" value="0">本机</option>
						<option value="">全部</option>
					</select>
				</div>
				<button class="layui-btn" lay-submit="" lay-filter="search">
					<i class="layui-icon">&#xe615;</i>
				</button>
			</form>
			<!--数据表格-->
			<table class="layui-hide" id="tableId" lay-filter="tableFilter"></table>
		</div>
	</div>
</div>
<!--js逻辑-->
<script type="text/javascript" src="${ctx}/plugins/layui/layui.js"></script>
<script>
	layui.use(["element", "jquery", "table", "form", "crud", "tree", "okUtils"], function () {
		var table = layui.table, form = layui.form, $ = layui.jquery, crud = layui.crud, tree = layui.tree, okUtils = layui.okUtils;

		function initTree() {
			okUtils.ajax("/dictionaries/listAllDict", null, true).done(function (response) {
				tree.render({
					elem: '#permissionTree',
					data: response.data,
					showCheckbox: true,
					click: function (obj) {
						layTable.reload({
							where: {DICTIONARIES_ID: obj.data.id},
							page: {currentPage: 1}
						});
					}
				});

				initTable();
			}).fail(function (error) {
				console.log(error)
			});
		}

		var layTable,ParentID;

		function initTable() {
			layTable = table.render({
				elem: '#tableId',
				method: 'post',
				url: '/dictionaries/list',
				page: true,
				toolbar: "#toolbarTpl",
				size: "sm",
				where: {DICTIONARIES_ID: "0"},
				cols: [[
					{type: "checkbox", fixed: "left", field: "DICTIONARIES_ID"},
					{title: "NO.", type: "numbers"},
					{field: "NAME", title: "名称", templet: '<div><a href="javascript:" lay-event="getList">{{d.NAME}}</a></div>'},
					{field: "NAME_EN", title: "英文", templet: '<div><a href="javascript:" lay-event="getList">{{d.NAME_EN}}</a></div>'},
					{field: "BIANMA", title: "编码"},
					{field: "DICTIONARIES_ID", title: "ID"},
					{field: "ORDER_BY", title: "排序"},
					{title: "操作", width: 100, align: "center", fixed: "right", templet: "#operationTpl"}
				]],
				done: function (res, curr, count) {
					console.info(res, curr, count);
					$("#DTSI").val(res.DICTIONARIES_ID);
					form.render('select');
					ParentID = res.PARENT_ID;
					if(res.DICTIONARIES_ID != '0'){
						$('#TOOLBAR').append('<button class="layui-btn layui-btn-primary layui-btn-sm" lay-event="ret">返回</button>');
					}
				}
			});
		}

		initTree();

		form.on("submit(search)", function (data) {
			layTable.reload({
				where: data.field,
				page: {currentPage: 1}
			});
			return false;
		});

		table.on("toolbar(tableFilter)", function (obj) {
			switch (obj.event) {
				case "add":
					crud.imAdd('/im/sys/dictionaries/dictionaries_edit', layTable, '50%', '70%');
					break;
				case "ret":
					layTable.reload({
						where: {DICTIONARIES_ID: ParentID},
						page: {currentPage: 1}
					});
					break;
			}
		});

		table.on("tool(tableFilter)", function (obj) {
			var data = obj.data;
			switch (obj.event) {
				case "edit":
					crud.imEdit('/im/sys/dictionaries/dictionaries_edit', data, layTable, '50%', '70%');
					break;
				case "del":
					crud.imDel('/dictionaries/delete', data.DICTIONARIES_ID);
					break;
				case "getList":
					layTable.reload({
						where: {DICTIONARIES_ID: data.DICTIONARIES_ID},
						page: {currentPage: 1}
					});
					break;
			}
		});
	})
</script>
<!-- 头工具栏模板 -->
<script type="text/html" id="toolbarTpl">
	<div class="layui-btn-container" id="TOOLBAR">
		<button class="layui-btn layui-btn-sm" lay-event="add">添加</button>
	</div>
</script>
<!-- 行工具栏模板 -->
<script type="text/html" id="operationTpl">
	<a href="javascript:" title="编辑" lay-event="edit"><i class="layui-icon">&#xe642;</i></a>
	{{# if(d.YNDEL != 'yes') { }}
	<a href="javascript:" title="删除" lay-event="del"><i class="layui-icon">&#xe640;</i></a>
	{{# } }}
</script>
</body>
</html>
