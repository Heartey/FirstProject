<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/commons/common.jsp" %>    

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>新建销售机会</title>
    <script type="text/javascript">
	    $(function(){
	    	var val = $("#createDate").val();

	    	 if(val == null || val == ""){
	    		$("#createDate").val(new Date().format("yyyy-MM-dd"));
	    	}
	    	
	    	/* var date = $("#createDate").val();
	    	if(date != null || date != ""){
	    		$("#createDate").val(date.format("yyyy-MM-dd"));
	    	} */
	    	
	    	$("#save").click(function(){
	    		/*
	    		if("156" == ""){
	    			$(":text[name='id']").val(-1);
	    		}
	    		*/
	    		
    			$("#chancedas").submit();
    			alert("1");
	    	});
	    })
    </script>
    
  </head>
 <body class="main">
 	<span class="page_title">新建/修改销售机会</span>
	
	
	<form id="chancedas" action="${ctx}/chance/updatetwo" method="POST">
		<div class="button_bar">
			<button class="common_button" onclick="javascript:history.go(-1);">返回</button>
			<button class="common_button" id="save">保存</button>
		</div>
		<!-- <input type="hidden" name="_method" value="put"> -->
		<table class="query_form_table" border="0" cellPadding="3" cellSpacing="0">
			<tr>
				<th>编号</th>
				<td>
					<input id="id" name="id" readonly="readonly" type="text" value="${sc.id }"/>
					&nbsp;
				</td>
				<th>机会来源</th>
				<td><input id="source" name="source" type="text" value="${sc.source }"/></td>
			</tr>
			<tr>
				<th>客户名称</th>
				<td><input id="custName" name="custName" type="text" value="${sc.custName }"/><span class="red_star">*</span></td>
				<th>成功机率（%）<br />填入数字，0~100</th>
				<td><input id="rate" name="rate" type="text" value="${sc.rate }"/><span class="red_star">*</span></td>
			</tr>
			<tr>
				<th>概要</th>
				<td colspan="2"><input id="title" name="title" type="text" value="${sc.title }"/><span class="red_star">*</span></td>
			</tr>
			<tr>
			<th>联系人</th>
			<td><input id="contact" name="contact" type="text" value="${sc.contact }"/></td>
			<th>联系人电话</th>
			<td><input id="contactTel" name="contactTel" type="text" value="${sc.contactTel }"/></td>
			</tr>
			<tr>
				<th>机会描述</th>
				<td colspan="3">
					<textarea id="description" name="description" rows="6" cols="50">${sc.description }</textarea>
					<span class="red_star">*</span>
				</td>
			</tr>
			<tr>
				<th>创建人</th>
				<td><input id="createBy" name="createBy" readonly="readonly" type="text" value="${sc.createBy.name }"/></td>
				<th>创建时间</th>
				<td><input id="createDate" name="createDate" readonly="readonly" type="text" value="${sc.createDate }"/><span class="red_star">*</span></td>
			</tr>
		</table>
		<br /><br>
  </form>
  </body>
</html>
