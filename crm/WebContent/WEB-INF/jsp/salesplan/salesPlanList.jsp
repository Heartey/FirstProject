<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/commons/common.jsp" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<title>客户开发计划</title>
</head>

<body class="main">
	<form action="${ctx}/plan/list" method="post">
		<div class="page_title">
			客户开发计划
		</div>
		<div class="button_bar">
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
						状态
					</th>
					<th>
						操作
					</th>
				</tr>
				
				<c:forEach items="${chanceList }" var="chanceList">
					<tr>
						<td class="list_data_number">
							${chanceList.id }
						</td>
						<td class="list_data_text">
							${chanceList.custName }
						</td>
						<td class="list_data_text">
							${chanceList.title }
						</td>
						<td class="list_data_text">
							${chanceList.contact }
						</td>
						<td class="list_data_text">
							${chanceList.contactTel }
						</td>
						<td class="list_data_text">
							${chanceList.createDate }
						</td>
						<td class="list_data_text">
							<script type="text/javascript">
								switch('2')
								{
									case '2':
										document.write('开发中');
										break;
									case '3':
										document.write('开发成功');
										break;
									case '4':
									    document.write('开发失败');
									   	break;
								}
							</script>
						</td>
						<td class="list_data_op">
							
								<img
									onclick="window.location.href='${ctx}/plan/make?id=${chanceList.id }'"
									title="制定计划" src="${ctx}/static/images/bt_plan.gif" class="op_button" />
								<img
									onclick="window.location.href='${ctx}/plan/execution?id=1002'"
									title="执行计划" src="${ctx}/static/images/bt_feedback.gif" class="op_button" />
								<img 
									onclick="window.location.href='${ctx}/chance/finish?id=1002'"
									title="开发成功" src="${ctx}/static/images/bt_yes.gif" class="op_button" />
							
							
						</td>
					</tr>
				</c:forEach>
				
			</table>
			
			








<div style="text-align:right; padding:6px 6px 0 0;">

	

	共 1 条记录 
	&nbsp;&nbsp;
	
	当前第 1 页/共 1 页
	&nbsp;&nbsp;
	
	
	 
	
	
	转到 <input id="pageNo" size='1'/> 页
	&nbsp;&nbsp;

</div>

<script type="text/javascript" src="${ctx}/static/jquery/jquery-1.9.1.min.js"></script>
<script type="text/javascript">

	$(function(){
		
		$("#pageNo").change(function(){
			
			var pageNo = $(this).val();
			var reg = /^\d+$/;
			if(!reg.test(pageNo)){
				$(this).val("");
				alert("输入的页码不合法");
				return;
			}
			
			var pageNo2 = parseInt(pageNo);
			if(pageNo2 < 1 || pageNo2 > parseInt("1")){
				$(this).val("");
				alert("输入的页码不合法");
				return;
			}
			
			//查询条件需要放入到 class='condition' 的隐藏域中. 
			window.location.href = window.location.pathname
				+ "?page=" + pageNo2 + "&sortType=&&";
			
		});
	})
</script>
		
		
		
		
		</form>
</body>
</html>

