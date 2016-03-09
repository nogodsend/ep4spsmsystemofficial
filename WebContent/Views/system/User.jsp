<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath();
%>
<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户管理</title>

<jsp:include page="../master/includeCSS.jsp" />
</head>
<body class="sticky-header">
	<section> <jsp:include page="../master/left-side.jsp" /> <!-- 主内容开始-->
	<div class="main-content">
		<!--页头开始-->
		<jsp:include page="../master/header-section.jsp" />
		<!--页头结束-->

		<!--页标题开始-->
		<div class="page-heading">
			<h3>用户管理</h3>
			<ul class="breadcrumb">
				<li><a href="#">系统管理</a></li>
				<li class="active">用户管理</li>
			</ul>
		</div>
		<!--页标题结束-->

		<!--页内容开始-->
		<div class="wrapper">
			<div class="row">
				<div class="col-sm-12">
					<section class="panel"> <header class="panel-heading">
					用户管理<span class="tools pull-right"> <a href="javascript:;"
						class="fa fa-chevron-down"></a> <a href="javascript:;"
						class="fa fa-times"></a>
					</span> </header>
					<div class="panel-body">
						<div>
						<br>
							<div class="clearfix">

								<div class="form-group input-group col-sm-3 pull-left">
									<input type="text" class="form-control"> <span
										class="input-group-btn">
										<button type="button" class="btn btn-success" id="deletes">
											<i class="fa fa-search"></i>查询
										</button>
									</span>
								</div>

								<div class="form-group btn-group pull-right">
									<button type="button" class="btn btn-primary"
										data-toggle="modal" data-target="#myModal">
										<i class="fa fa-plus"></i> 添加
									</button>
									<button type="button" class="btn btn-danger" id="deletes">
										<i class="fa fa-times"></i> 批量删除
									</button>
									<button class="btn btn-info dropdown-toggle"
										data-toggle="dropdown">
										Tools <i class="fa fa-angle-down"></i>
									</button>
									<ul class="dropdown-menu pull-right">
										<li><a href="#">Print</a></li>
										<li><a href="#">Save as PDF</a></li>
										<li><a href="#">Export to Excel</a></li>
									</ul>
								</div>
							</div>
							<br>

							<table class="table table-hover table-advance dataTable "
								id="dt-1" style="width: 100%">
								<thead>
									<tr>
										<th><input class="checkall" type="checkbox" name="iCheck" /></th>
										<th>头像</th>
										<th>用户名</th>
										<th>真实姓名</th>
										<th>性别</th>
										<th>年龄</th>
										<th>电子邮件</th>
										<th>电话</th>
										<th>创建时间</th>
										<th>操作</th>
									</tr>
								</thead>
								<tfoot>
									<tr>
										<th><input class="checkall" type="checkbox" name="iCheck" /></th>
										<th>头像</th>
										<th>用户名</th>
										<th>真实姓名</th>
										<th>性别</th>
										<th>年龄</th>
										<th>电子邮件</th>
										<th>电话</th>
										<th>创建时间</th>
										<th>操作</th>
									</tr>
								</tfoot>
								<tbody></tbody>
							</table>
						</div>
					</div>
					</section>
				</div>
			</div>
		</div>
		<!--页内容结束-->


		<!--页脚开始-->
		<jsp:include page="../master/footer-section.jsp" />
		<!--页脚结束-->
	</div>
	<!-- 主内容结束--> </section>

	<jsp:include page="../master/includeJS.jsp" />
	
	<!--定义操作列按钮模板-->
<script id="tpl" type="text/x-handlebars-template">
    {{#each func}}
    <button type="button" class="btn btn-{{this.type}} btn-sm" onclick="{{this.fn}}"><i class="fa fa-{{this.icon}}"></i> {{this.name}}</button>
    {{/each}}
</script>

<script>
var table;
var editFlag = false;
var tpl = $("#tpl").html();
//预编译模板
var template = Handlebars.compile(tpl);

$(function () { 
    table = $('#example').DataTable({           
        "processing": true,
        "serverSide": true,
        "ajax": "../User/List",           
        "iDisplayLength": 10,//每页显示10条数据
      //当处理大数据时，延迟渲染数据，有效提高Datatables处理能力
        "deferRender": true,
        columns: [
            {"data": null,
            	 'render':function(data,type,full){  
                     var content = '<input class="check checker" type="checkbox" name="id"  value="'+data.id+'">';
                     return content;  
                 }  
            },
            {"data": "roleName"},
            {"data": "createTime"},
            {"data": null}
        ],
        "order": [[ 1, "asc" ]],
        columnDefs: [{"bSortable": false, "aTargets": [0, 3 ]},
                     {"class":"acenter","aTargets": [0,1,2, 3 ]},
                     {
                         targets: 3,
                         render: function (a, b, c, d) {
                             var context =
                             {
                                 func: [
                                     {"name": "修改", "fn": "edit(\'" + c.id + "\',\'" + c.roleName + "\',\'" + c.createTime + "\')", "type": "success","icon":"pencil"},
                                     {"name": "删除", "fn": "del(\'" + c.id + "\')", "type": "danger","icon":"times"}
                                 ]
                             };
                             var html = template(context);
                             return html;
                         }
                     }
      
                 ],
        "language": {
            "lengthMenu": "_MENU_ 条记录每页",
            "zeroRecords": "没有找到符合条件的数据",    
            "info": "当前第 _START_ - _END_ 条　共计 _TOTAL_ 条，  第 _PAGE_ 页 ( 总共 _PAGES_ 页 )", 
            "infoEmpty": "无记录",
            "infoFiltered": "(从 _MAX_ 条记录过滤)",
            "paginate": {
                "previous": "上一页",
                "next": "下一页"
            }
        },
        initComplete: function () {
        }

    });

    $('#example').on( 'draw.dt', function () {
    	 /*  initiCheck();
    	  highlight();
    	  chk(); */
    });
    
});
</script>

</body>
</html>