<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/commons/common.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<title>销售机会管理</title>
	<script type="text/javascript">
		$(function(){
			$("#new").click(function(){
				//window.location.href="${ctx}" + "/chance/create";
				var href = $(this).attr("href");
				$("#postForm").attr("action",href).submit();
				return false;
			});
			
			$("#delete").click(function(){
				//window.location.onclick="${ctx}/chance/delete?id="+${chance.id };
				var onclick = $(this).attr("onclick");
				var href = onclick.split("'")[1];
				alert(href);
				if(!confirm("确认删除?")){
					return;
				}
				$("#updateForm").attr("action",href).submit();
				
				return false;
			});
			
			/* $("#update").click(function(){
				var onclick = $(this).attr("onclick");
				var href = onclick.split("'")[1];
				alert(href);
				if(!confirm("确认修改?")){
					return;
				}
				$("#deleteForm").attr("action",href).submit();
				
				return false;
			}); */
			
		});
		
	</script>
</head>

<body class="main">
	<form id="postForm" action="" method="post">
		<input type="hidden" name="_method" value="post">
	</form>
	<form id="deleteForm" action="" method="post">
		<input type="hidden" name="_method" value="delete">
	</form>
	<form id="updateForm" action="" method="post">
		<input type="hidden" name="_method" value="put">
	</form>
	<form id="command" action="${ctx }/chance/list" method="get">
		<div class="page_title">
			销售机会管理
		</div>
		<div class="button_bar">
			<button class="common_button" id="new" href="${ctx }/create">
				新建
			</button>
			<button class="common_button" onclick="document.forms[0].submit();">
				查询
			</button>
		</div>
		<table class="query_form_table" border="0" cellPadding="3"
			cellSpacing="0">
			<tr>
				<th class="input_title">
					客户名称
				</th>
				<td class="input_content">
					<input type="text" name="search_LIKE_custName" />
				</td>
				<th class="input_title">
					概要
				</th>
				<td class="input_content">
					<input type="text" name="search_LIKE_title" />
				</td>
				<th class="input_title">
					联系人
				</th>
				<td class="input_content">
					<input type="text" name="search_LIKE_contact" />
				</td>
			</tr>
		</table>
	</form>
		<!-- 列表数据 -->
		<br />
		
		
			<table class="data_list_table" border="0" cellPadding="3"
				cellSpacing="0">
				<tr>
					<th>
						编号
					</th>
					<th>
						客户名称
					</th>
					<th>
						概要
					</th>
					<th>
						联系人
					</th>
					<th>
						联系人电话
					</th>
					<th>
						创建时间
					</th>
					<th>
						操作
					</th>
				</tr>
				
				<c:forEach items="${page.list }" var="chance">	
				
					<tr>
						<td class="list_data_number">${chance.id }</td>
						<td class="list_data_text">${chance.custName }</td>
						<td class="list_data_text">${chance.title }</td>
						<td class="list_data_text">${chance.contact }</td>
						<td class="list_data_text">${chance.contactTel }</td>
						<td class="list_data_text">
						<fmt:formatDate value="${chance.createDate }" pattern="yyyy-MM-dd"/>
							<%-- ${chance.createDate } --%>
						</td>
						<td class="list_data_op">
							<img onclick="window.location.href='${ctx}/chance/dispatch?id=${chance.id }'" 
								title="指派" src="${ctx}/static/images/bt_linkman.gif" class="op_button" />
							<img id="update" onclick="window.location.href='${ctx}/chance/update?id=${chance.id }'" 
								title="编辑" src="${ctx}/static/images/bt_edit.gif"
								class="op_button" />
							<img id="delete" onclick="window.location.href='${ctx}/chance/delete?id=${chance.id }'" 
								title="删除" src="${ctx}/static/images/bt_del.gif" class="op_button" />

						</td>
					</tr>
				</c:forEach>	
			</table>
			

<%@ include file="/WEB-INF/jsp/pages/page.jsp" %>

</body>
</html>
