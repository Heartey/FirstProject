<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>




<div style="text-align:right; padding:6px 6px 0 0;">

<c:choose>

	<c:when test="${page.totalPage <= 5}">
		<c:set var="begin" value="1"/>
		<c:set var="end" value="${page.totalPage}"/>
	</c:when>
	<c:when test="${page.totalPage > 5}">
		<c:if test="${page.pageNumber <= 3}">
			<c:set var="begin" value="1"/>
			<c:set var="end" value="5"/>
		</c:if>
		<c:if test="${page.pageNumber > 3 and page.pageNumber < page.totalPage }">
			<c:set var="begin" value="${page.pageNumber - 2}"/>
			<c:set var="end" value="${page.pageNumber + 2}"/>
			<c:if test="${end > page.totalPage  }">
				<c:set var="begin" value="${page.pageNumber - 3}"/>
				<c:set var="end" value="${page.totalPage}"/>
			</c:if>
		</c:if>
		<c:if test="${page.pageNumber == page.totalPage }">
			<c:set var="begin" value="${page.pageNumber - 4}"/>
			<c:set var="end" value="${page.totalPage}"/>
		</c:if>
	</c:when>
</c:choose>

	<a href="${page.path }?pageNumber=1${queryString}">首页</a>
	<a href="${page.path }?pageNumber=${page.pageNumber - 1 }${queryString}">上一页</a>
	
	<c:forEach begin="${begin }" end="${end }" var="i">
		<c:if test="${i == page.pageNumber}">
			<span style="color: red">[ ${i } ]</span>
		</c:if>
		<c:if test="${i != page.pageNumber}">
			<a href="${page.path }?pageNumber=${i}${queryString}">${i }</a>
		</c:if>
	</c:forEach>
	
	<a href="${page.path }?pageNumber=${page.pageNumber + 1 }${queryString}">下一页</a>
	<a href="${page.path }?pageNumber=${page.totalPage }${queryString}">尾页</a>
	

	共 ${page.totalRecord } 条记录 
	&nbsp;&nbsp;
	
	共 ${page.totalPage } 页
	&nbsp;&nbsp;
	
	转到 <input id="pageNo" size='1'/> 页
	&nbsp;&nbsp;
	
	<script type="text/javascript" src="${ctx}/static/jquery/jquery-1.9.1.min.js"></script>
<script type="text/javascript">
	
	$(function(){
		$("#pageNo").change(function(){
			var pageNo = $(this).val();
			var reg = /^[1-9]\d*$/;
			if(!reg.test(pageNo)){
				alert("输入有误!");
				return;
			}
			window.location.href="${page.path }?pageNumber="+pageNo+"${queryString}";
		});
	});
</script>

</div>

