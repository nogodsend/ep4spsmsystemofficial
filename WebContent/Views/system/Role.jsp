<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();%>
<%String contextPath = request.getContextPath();%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户管理</title>
   
   <jsp:include page="../master/includeCSS.jsp" />

</head>
<body class="sticky-header">
<section>
   <jsp:include page="../master/left-side.jsp" />
    
    <!-- main content start-->
    <div class="main-content" >

         <jsp:include page="../master/header-section.jsp" />

       <div class="page-heading">
            <h3>
              基础列表
            </h3>
            <ul class="breadcrumb">
                <li>
                    <a href="#">主页</a>
                </li>
                <li>
                    <a href="#">数据列表</a>
                </li>
                <li class="active">JQ DATATABLES </li>
            </ul>
        </div>
        
         <!--body wrapper start-->
        <div class="wrapper">
        <!--  <div class="row">
         
            <div class="col-md-12">
             <h3>
              基础列表
            </h3>
                breadcrumbs start
                <ul class="breadcrumb panel">
                    <li><a href="#"><i class="fa fa-home"></i></a></li>
                    <li><a href="#">数据列表</a></li>
                    <li class="active">JQ DATATABLES</li>
                </ul>
                breadcrumbs end
            </div>
        </div> -->
        <div class="row">
        <div class="col-sm-12">
        <section class="panel">
        <header class="panel-heading">
            JQ DATATABLES
            <span class="tools pull-right">
                <a href="javascript:;" class="fa fa-chevron-down"></a>
                <a href="javascript:;" class="fa fa-times"></a>
             </span>
        </header>
        <div class="panel-body">
        
        <div class="adv-table">
        <div class="clearfix">
         
                    <div class="panel pull-left" id="mytool">
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal"><i class="fa fa-plus"></i> 添加</button>
                    <button type="button" class="btn btn-danger" id="deletes"><i class="fa fa-times"></i> 批量删除</button>

                    </div>
                    <div class="btn-group pull-right">
                        <button class="btn btn-info dropdown-toggle" data-toggle="dropdown">Tools <i class="fa fa-angle-down"></i>
                        </button>
                        <ul class="dropdown-menu pull-right">
                            <li><a href="#">Print</a></li>
                            <li><a href="#">Save as PDF</a></li>
                            <li><a href="#">Export to Excel</a></li>
                        </ul>
                    </div>
                </div>
                
        <table  class="table table-hover table-advance dataTable " id="example" style="width:100%">
         
        <thead>
        <tr>
            <th><input class="check all" type="checkbox"  name="iCheck"/></th>
            <th>角色名称</th>
            <th>创建时间</th>
            <th>操作</th>
        </tr>
        </thead>
        <tfoot>
<tr>
    <th><input class="check all" type="checkbox" name="iCheck"/></th>
            <th>角色名称</th>
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
        <!--body wrapper end-->

        <!--footer section start-->
         <jsp:include page="../master/footer-section.jsp" />
        <!--footer section end-->


    </div>
    <!-- main content end-->
</section>

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel"><i class="fa fa-desktop"></i> 新增</h4>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <input type="text" class="form-control" id="id" placeholder="ID" disabled="disabled">
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" id="roleName" placeholder="角色名称">
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" id="createTime" placeholder="创建时间">
                </div>
                
            </div>
            <div class="modal-footer">                
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="save">保存</button>
            </div>
        </div>
    </div>
</div>

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
            "ajax": "../Role/List",           
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
                //$("#mytool").append('<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal"><i class="fa fa-plus"></i> 添加</button>');
                //$("#mytool").append('<button type="button" class="btn btn-danger" id="deletes"><i class="fa fa-plus"></i>批量删除</button>');
               
                //chk();
            }
 
        });
 
        $("#save").click(add);
        $('#example').on( 'draw.dt', function () {
        	  initiCheck();
        	  highlight();
        	  chk();
        });
        
        $("#deletes").click(function(){
        	var ids=getSelectedRowId();
        	
        	if (ids.replace(/(^s*)|(s*$)/g, "").length >0) 
        	{ 
        		del(ids);
        	} 
        })
        
    });
    
    function chk(){
    	var checkAll = $('input.all');
	    var checkboxes = $('input.checker');   	  
	    
	    checkAll.on('ifChecked ifUnchecked', function(event) {
	    
	        if (event.type == 'ifChecked') {
	        	checkboxes.iCheck('check');
	        } else {
	        	checkboxes.iCheck('uncheck');
	        }
	    });
	    checkboxes.on('ifChanged', function(event) {
	    	//alert(checkboxes.filter('input:checked').length);
	    	var tr=$(this).parent().parent().parent();
	    	 tr.toggleClass('selected');
	    	 if(checkboxes.filter(':checked').length == checkboxes.length) {
	    	      checkAll.prop('checked', 'checked');
	    	     
	    	    } else {
	    	      checkAll.removeProp('checked');
	    	    	
	    	    }
	    	    checkAll.iCheck('update');
	    });    
    }
    
    function getSelectedRowId(){
    	var ids="";
    	var str="";
    	  $("input[name='id']:checkbox").each(function(){
    	    if(true == $(this).is(':checked')){
    	      str+=$(this).val()+",";
    	    }
    	  });
    	  if(str.substr(str.length-1)== ','){
    	    ids = str.substr(0,str.length-1);
    	  }
    	  console.log(ids);
    	  return ids;
    }
    
   function initiCheck(){
	   $('input').iCheck({
   	    checkboxClass: 'icheckbox_square-green',
   	    radioClass: 'iradio_square-green',
   	    increaseArea: '20%' // optional
   	  });
   }
   

   var lastIdx = null;
   function highlight(){
	   $('#example tbody')
       .on( 'mouseover', 'td', function () {
           var colIdx = table.cell(this).index().column;
           if ( colIdx !== lastIdx ) {
               $( table.cells().nodes() ).removeClass( 'highlight' );
               $( table.column( colIdx ).nodes() ).addClass('highlight');
           }
       } )
       .on( 'mouseleave', function () {
           $( table.cells().nodes() ).removeClass( 'highlight' );
       } );
   }
   
   
    /**
     *编辑方法
     **/
    function edit(id,roleName,createTime) {
        console.log(name);
        editFlag = true;
        $("#myModalLabel").text("修改");
        $("#id").val(id).attr("disabled",true);
        $("#roleName").val(roleName);
        $("#createTime").val(createTime);
        $("#myModal").modal("show");
    }
    
    /**
     * 添加数据
     **/
    function add() {
        var addJson = {
            "id": $("#id").val(),
            "roleName": $("#roleName").val(),
            "createTime": $("#createTime").val()
        };
 
        ajax(addJson);
    }
    
    function ajax(obj) {
    	var json={
                "id": obj.id,
                "roleName": obj.roleName,
                "createTime": obj.createTime
            };
        var url ="../Role/Add" ;
        if(editFlag){
            url = "../Role/Update";
        }
        $.ajax({
            url:url ,
            method:"post",
            data:{"role": JSON.stringify(json)}, success: function (data) {
                table.ajax.reload();
                $("#myModal").modal("hide");
                $("#myModalLabel").text("新增");
                clear();
                console.log("结果" + data);
            }
        });
    }
    
    /**
     * 删除数据
     * @param name
     */
    function del(id) {
        $.ajax({
            url: "../Role/Delete",
            data: {
                "id": id
            }, success: function (data) {
                table.ajax.reload();
                console.log("删除成功" + data);
            }
        });
    }
    
    /**
     * 清除
     */
    function clear() {
        $("#id").val("").attr("disabled",false);
        $("#roleName").val("");
        $("#createTime").val("");
        editFlag = false;
    }
    
</script>

</body>
</html>