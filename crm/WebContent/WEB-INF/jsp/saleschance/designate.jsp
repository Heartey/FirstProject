<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/commons/common.jsp" %>    

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>指派销售机会</title>
    <script type="text/javascript">
	    $(function(){
	    	var val = $("#designeeDate").val();

	    	if(val == null || val == ""){
	    		$("#designeeDate").val(new Date().format("yyyy-MM-dd"));
	    	}
	    })
    </script>
  </head>

  <body class="main">
  <span class="page_title">指派销售机会</span>

  <div class="button_bar">
	<button class="common_button" onclick="javascript:history.go(-1);">返回</button>
	<button class="common_button" onclick="document.forms[0].submit();">保存</button>
  </div>
  <form id="chance" action="${ctx}/chance/dispatch" method="post">
  	<input id="id" name="id" type="hidden" value="156"/>
		
		<table class="query_form_table" border="0" cellPadding="3" cellSpacing="0">
				<tr>
					<th>编号</th>
					<td>${salesChance.id }</td>
					<th>机会来源</th>
					<td>${salesChance.source }</td>
				</tr>
				<tr>
					<th>客户名称</th>
					<td>${salesChance.custName }</td>
					<th>成功机率%</th>
					<td>${salesChance.rate }</td>
				</tr>
				<tr>
					<th>概要</th>
					<td colspan="2">${salesChance.title }</td>
				</tr>
				<tr>
					<th>联系人</th>
					<td>${salesChance.contact }</td>
					<th>联系人电话</th>
					<td>${salesChance.contactTel }</td>
				</tr>
				<tr>
					<th>机会描述</th>
					<td colspan="3">${salesChance.description }</td>
				</tr>
				<tr>
					<th>创建人</th>
					<td>${salesChance.createBy.name }</td>
					<th>创建时间</th>
					<td>${salesChance.createDate }</td>
				</tr>
				
		</table>
		<br />
		
		<table class="query_form_table" border="0" cellPadding="3" cellSpacing="0">				
			<tr>					
				<th>指派给</th>
				<td>
					<select id="designee.id" name="designee.id">
						<option value="">请选择</option>	
						<option value="21">bcde</option><option value="22">abcd</option><option value="24" selected="selected">a</option>
					</select>
					<span class="red_star">*</span>
				</td>
				<th>指派时间</th>
				<td>
					<input id="designeeDate" name="designeeDate" readonly="readonly" type="text" value="2014-02-06"/><span class="red_star">*</span>
				</td>
			</tr>
		</table>
	 </form>
  </body>
</html>