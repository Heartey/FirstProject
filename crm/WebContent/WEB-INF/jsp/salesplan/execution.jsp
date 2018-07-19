<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/commons/common.jsp" %>
    
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>执行计划</title>
    <script type="text/javascript">
    	$(function(){
    		$(":text[id^='result-']").each(function(){
    			var val = $(this).val();
    			if(val != null && $.trim(val) != ""){
    				$(this).attr("disabled", "disabled");
    			}
    		});
    		
    		$("button[id^='saveresult']").click(function(){
    			var id = $(this).attr("id");
				id = id.split("-")[1];
				var result = $(this).prev(":text").val();
				
				if(result != null && $.trim(result) != ""){
					var url = "${ctx}/plan/execute?id=" + id + "&result=" + result;
					window.location.href = url;
				}
				
				return false;
    		});
    	})
    </script>
  </head>

  <body class="main">
	<span class="page_title">执行计划</span>
	<div class="button_bar">
		<button class="common_button" onclick="window.location.href='${ctx}/chance/stop?id=1002'">终止开发</button>
		<button class="common_button" onclick="window.location.href='${ctx}/plan/make?id=1002'">制定计划</button>
		<button class="common_button" onclick="javascript:history.go(-1);">返回</button>			
		<button class="common_button" onclick="window.location.href='${ctx}/chance/finish?id=1002'">开发成功</button>
	</div>
  	<form action="${ctx}/plan/execute" method="post">
		<table class="query_form_table" border="0" cellPadding="3" cellSpacing="0">
			<c:forEach items="${salesPlanList }" var="salesPlanList">
				<tr>
				<th>编号</th>
				<td>${user.role.name }&nbsp;</td>
				
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
	
	
		还没有制定任何计划
	
  </form>
  </body>
</html>
