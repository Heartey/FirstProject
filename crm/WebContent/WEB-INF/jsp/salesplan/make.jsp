<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/commons/common.jsp" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<title>制定计划</title>
	<script type="text/javascript">
		$(function(){
			
			$("button[id^='save']").click(function(){
				var id = $(this).attr("id");
				id = id.split("-")[1];
				var todo = $("#todo-" + id).val();
				
				var url = "${ctx}/plan/make-ajax";
				var args = {"id":id, "todo":todo};
				$.post(url, args, function(data){
					$.post(url, args, function(data){
						if(data == "1"){
							alert("修改成功!");
						}else{
							alert("修改失败!");
						}
					});
				});
				
				return false;
			});		
			
			$("button[id^='delete']").click(function(){
				var id = $(this).attr("id");
				id = id.split("-")[1];
				
				var url = "${ctx}/plan/delete-ajax";
				var args = {"id":id};
				$.post(url, args, function(data){
					if(data == "1"){
						$("#plan-" + id).remove();
						alert("删除成功!");
					}else{
						alert("删除失败!");
					}
				});
				
				return false;
			});	
			
			$("#execute").click(function(){
				var id = $(":hidden[name='chance.id']").val();
				window.location.href = "${ctx}/plan/execution?id=" + id;
				return false;
			});
			
function delPlan(button){
	var value = $(button).prev().val();
	var id = $(button).next.val();
	if(!confirm("你确定要删除"+value+"的信息吗?")){
		return;
	}
	
	var tr = $(button).parent().parent();
	var url = "${ctx}/plan/create";
	var params = {'_method':"delete","time":new Date()}
	$.post(url,params,function(data){
		if(data.status == 200){
			tr.remove();
			alert("删除成功");
		}
	});
}			
			/* $("#create").click(function(){
				//1.获取input里的value值
				var date = $("#date").val();
				var todo = $("#todo").val();
				
				//3.发送Ajax请求
				var url = "${ctx}/plan/create";
				var params = {"time":new Date(),"date":date,"todo":tode}
				$.post(url,params,function(datall){
					if(data.status == 200){
						//2.创建标签
						var tr = "<tr></tr>"
						var dateTd = "<td><input type='text' value='"+date+"'></td>"
						var todoTd = "<td><input type='text' value='"+todo+"'></td>"
						var updateTd = "<td><input type='hidden' value='"+todo+"'><button id='update_"+datall.data.id+"'>修改</button><input type='hidden' value='"+datall.data.id+"'></td>"
						var deleteTd = $("<td><input type='hidden' value='"+todo+"'><button id='delete_"+datall.data.id+"'>删除</button><input type='hidden' value='"+datall.data.id+"'></td>")
						
						$($tr).append($(dateTd)).append($(todoTd)).append($(updateTd)).append($(deleteTd)).appendTo($(".data_list_table"))
						deleteTd.find("#delete_"+datall.data.id).click(function(){
							delPlan(this);
						})
					}
					
				}) 
				
			});*/
			
		})
	</script>
</head>

<body class="main">
	<span class="page_title">制定计划</span>
	<div class="button_bar">
		<button class="common_button" id="execute">
			执行计划
		</button>
		<button class="common_button" onclick="javascript:history.go(-1);">
			返回
		</button>
	</div>
	
		<form action="${ctx}/plan/create" method="post">
		<table class="query_form_table" border="0" cellPadding="3"
			cellSpacing="0">
			<c:forEach items="${salesPlanList }" var="salesPlanList">
				<tr>
				<th>编号</th>
				<td>${salesPlanLis.id }&nbsp;</td>
				
				<th>机会来源</th>
				<td>${salesPlanList.source }&nbsp;</td>
			</tr>
			<tr>
				<th>客户名称</th>
				<td>${salesPlanList.custName }&nbsp;</td>
				
				<th>成功机率（%）</th>
				<td>${salesPlanList.rate }&nbsp;</td>
			</tr>
			
			<tr><th>概要</th>
				<td colspan="3">${salesPlanList.title }&nbsp;</td>
			</tr>
			
			<tr>
				<th>联系人</th>
				<td>${salesPlanList.contact }&nbsp;</td>
				<th>联系人电话</th>
				<td>${salesPlanList.contactTel }&nbsp;</td>
			</tr>
			<tr>
				<th>机会描述</th>
				<td colspan="3">${salesPlanList.description }&nbsp;</td>
			</tr>
			<tr>
				<th>创建人</th>
				<td>${salesPlanList.createBy }&nbsp;</td>
				<th>创建时间</th>
				<td>${salesPlanList.createDate }&nbsp;</td>
			</tr>		
			<tr>					
				<th>指派给</th>
				<td>${salesPlanList.designee }&nbsp;</td>
			</tr>
			</c:forEach>

		</table>

		<br />
		
		<table class="data_list_table" border="0" cellPadding="3"
			cellSpacing="0">
			<tr>
				<th width="200px">
					日期
				</th>
				<th width="200px">
					计划项
				</th>
				<th>
					修改
				</th>
				<th>
					删除
				</th>
			</tr>
			
			<tr>
				<td><input type="text"></td>	
				<td><input type="text"></td>
				<td>
					<input type="hidden" value="">
					<button>修改</button>
					<input type="hidden" value="">
				</td>
				<td>
					<input type="hidden" value="">
					<button>删除</button>
					<input type="hidden" value="">
				</td>
			</tr>
			
		</table>
		<div class="button_bar">
			<button id="create" class="common_button" onclick="document.form[0].submit();">
				新建
			</button>
		</div>
		<input type="hidden" name="chance.id" value="1002" />
		<table class="query_form_table" border="0" cellPadding="3"
			cellSpacing="0">
			<tr>
				<th>
					日期
					0
					(格式: yyyy-mm-dd)
				</th>
				<td>
					<input type="text" name="date" id="date" value=""/>
					&nbsp;
				</td>
				<th>
					计划项
				</th>
				<td>
					<input type="text" name="todo" size="50" id="todo" />
					&nbsp;
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
