<!DOCTYPE html>
<html>
<head>
	<#assign ctx=request.contextPath />
	<meta charset="utf-8">
	<title>菜单列表</title>
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<link rel="stylesheet" href="${ctx}/css/oksub.css" media="all" />
	<script type="text/javascript" src="${ctx}/plugins/loading/okLoading.js"></script>
</head>
<body>
<div class="ok-body">
	<!--模糊搜索区域-->
	<div class="layui-row">
		<div class="layui-col-md3">
			<div id="menuTree"></div>
		</div>
		<div class="layui-col-md9">
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

		okLoading.close($);

		function initMenuTree() {
			okUtils.ajax("/menu/listAllMenu", null, true).done(function (response) {
				tree.render({
					elem: '#menuTree',
					data: response.data,
					showCheckbox: true,
					click: function (obj) {
						layTable.reload({
							where: {MENU_ID: obj.data.id},
							page: {currentPage: 1}
						});
					}
				});

				initTable();
			}).fail(function (error) {
				console.log(error)
			});
		}

		var layTable, ParentID;

		function initTable() {
			layTable = table.render({
				elem: '#tableId',
				method: 'post',
				url: '/menu/list',
				page: true,
				toolbar: "#toolbarTpl",
				size: "sm",
				cols: [[
					{field: "menu_ORDER", title: "NO."},
					{field: "menu_NAME", title: "名称", templet: '<div><a href="javascript:" lay-event="getList">{{d.menu_NAME}}</a></div>'},
					{field: "menu_URL", title: "资源路径"},
					{field: "shiro_KEY", title: "权限标识"},
					{field: "menu_STATE", title: "状态", templet:'#statusTpl'},
					{title: "操作", width: 100, align: "center", fixed: "right", templet: "#operationTpl"}
				]],
				done: function (res, curr, count) {
					console.info(res, curr, count);
					if (res.pd != null) {
						ParentID = res.pd.PARENT_ID;
						$('#TOOLBAR').append('<button class="layui-btn layui-btn-primary layui-btn-sm" lay-event="ret">返回</button>');
					}
				}
			});
		}

		initMenuTree();

		table.on("toolbar(tableFilter)", function (obj) {
			switch (obj.event) {
				case "add":
					crud.imAdd('/im/sys/menu/menu_edit', layTable, '50%', '50%');
					break;
				case "ret":
					layTable.reload({
						where: {MENU_ID: ParentID},
						page: {currentPage: 1}
					});
					break;
			}
		});

		table.on("tool(tableFilter)", function (obj) {
			var data = obj.data;
			switch (obj.event) {
				case "edit":
					crud.imEdit('/im/sys/menu/menu_edit', data, layTable, '50%', '50%');
					break;
				case "del":
					crud.imDel('/menu/delete', data.menu_ID);
					break;
				case "getList":
					layTable.reload({
						where: {MENU_ID: data.menu_ID},
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
	<a href="javascript:" title="删除" lay-event="del"><i class="layui-icon">&#xe640;</i></a>
</script>

<!-- 状态模板 -->
<script type="text/html" id="statusTpl">
	{{#  if(d.menu_STATE == '1'){ }}
	<i class="ok-icon" title="显示">&#xe73d;</i>
	{{#  } else { }}
	<i class="ok-icon" title="禁用">&#xe7b2;</i>
	{{#  } }}
</script>
</body>
</html>
