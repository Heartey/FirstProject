<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/commons/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="${ctx }/static/css/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="${ctx }/static/css/themes/icon.css">
	<script type="text/javascript" src="${ctx }/static/jquery/jquery.min.js"></script>
	<script type="text/javascript" src="${ctx }/static/jquery/jquery.easyui.min.js"></script>
	<script type="text/javascript">
		$(function(){
			$('#tt').tree({
				onClick: function(node){
					//alert(node.url);  // 在用户点击的时候提示
					window.parent.document.getElementById("content").src=node.url;
				}
			});
		})

	</script>
</head>
<body>
	<ul id="tt" class="easyui-tree" data-options="url:'${ctx }/menuee',method:'get',animate:true"></ul>
</body>
</html>