<!DOCTYPE html>
<html>
<head>
	<#assign ctx=request.contextPath />
	<meta charset="utf-8">
	<title>反向生成列表</title>
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<link rel="stylesheet" href="${ctx}/css/oksub.css" media="all" />
	<script type="text/javascript" src="${ctx}/plugins/loading/okLoading.js"></script>
	<style>	#setd td{	min-width: 200px;max-width: 320px; } </style>
</head>
<body>
<div class="ok-body">
	<!--模糊搜索区域-->
	<div class="layui-row">
		<fieldset class="layui-elem-field layui-field-title">
			<legend>数据库</legend>
		</fieldset>
		<form class="layui-form layui-form-pane layui-col-md12" id="setd">
			<table>
				<tr>
					<td>
						<div class="layui-form-item">
							<div class="layui-inline">
								<label class="layui-form-label">数据库</label>
								<div class="layui-input-inline">
									<select id="dbtype" class="layui-input">
										<option value="mysql">mysql</option>
										<option value="oracle">oracle</option>
										<option value="sqlserver">sqlserver</option>
									</select>
								</div>
							</div>
							<div class="layui-inline">
								<label class="layui-form-label">地址</label>
								<div class="layui-input-inline">

									<input class="layui-input" placeholder="地址" name="dbAddress" />
								</div>
							</div>
						</div>
					</td>
					<td>
						<div class="layui-form-item">
							<div class="layui-inline">
								<label class="layui-form-label">端口</label>
								<div class="layui-input-inline">
									<input class="layui-input" placeholder="端口" name="dbport" />
								</div>
							</div>
							<div class="layui-inline">
								<label class="layui-form-label">用户名</label>
								<div class="layui-input-inline">
									<input class="layui-input" placeholder="" name="username" />
								</div>
							</div>
						</div>
					</td>
					<td>
						<div class="layui-form-item">
							<div class="layui-inline">
								<label class="layui-form-label">密码</label>
								<div class="layui-input-inline">
									<input class="layui-input" placeholder="密码" name="password" />
								</div>
							</div>
							<div class="layui-inline">
								<label class="layui-form-label">库名</label>
								<div class="layui-input-inline">
									<input class="layui-input" placeholder="库名" name="databaseName" />
								</div>
							</div>
						</div>
					</td>
					<td>
						<button class="layui-btn" lay-filter="search"><i class="layui-icon">&#xe64c;</i></button>
					</td>
				</tr>
			</table>
		</form>
	</div>
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
			size: "sm",
			cols: [[
				{title: "NO.", type: "numbers"},
				{field: "TITLE", title: "说明"},
				{field: "PACKAGENAME", title: "包名"},
				{field: "OBJECTNAME", title: "类名"},
				{field: "TABLENAME", title: "表名"},
				{
					field: "TYPE", title: "类型", templet: function (d) {
						return d.TYPE == "single" ? "单表" : d.TYPE == "tree" ? "树形" : d.TYPE
						== "fathertable" ? "主表" : d.TYPE == "sontable" ? "明细表" : ""
					}
				},
				{field: "CREATETIME", title: "创建时间", width: 150},
				{title: "操作", width: 100, align: "center", fixed: "right", templet: "#operationTpl"}
			]],
			data: []
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
					crud.batchDel('/procdef/deleteAll', table, "USER_ID");
					break;
				case "add":
					crud.imAdd('/im/act/ruprocdef/ruprocdef_edit', layTable, '50%', '70%');
					break;
			}
		});

		table.on("tool(tableFilter)", function (obj) {
			var data = obj.data;
			switch (obj.event) {
				case "edit":
					crud.imEdit('/im/act/ruprocdef/ruprocdef_edit', data, layTable, '50%', '70%');
					break;
				case "del":
					crud.imDel('/ruprocdef/delete', data.ID_);
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
</body>
</html>
