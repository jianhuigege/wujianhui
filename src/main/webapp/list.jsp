<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>ssm</title>
<link
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<body>
	
	<div style="margin:auto;width:860px;">
	<h2>SpringMVC + Spring + Mybatis + MySQL</h2>
	<form action="list" method="post" name="f">
		<div class="form-group">
		<input type="text" name="name" placeholder="玩具名" class="form-control">
		</div>
		<div class="form-group">
		<input type="date" name="beginDate" class="form-control">
		</div>
		<div class="form-group">
		<input type="date" name="endDate" class="form-control">
		</div>
		<button type="submit" class="btn btn-primary btn-block">查询</button>
		<a href="edit.jsp">新增</a>
	</form>
	
	<table class="table">
		<caption>Toy CRUD</caption>
		<thead>
			<tr>
				<th>玩具名</th>
				<th>价格</th>
				<th>生产日期</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${toys }" var="toy">
				<tr>
					<td>${toy.name }</td>
					<td><spring:eval expression="toy.price"/> </td>
					<td><fmt:formatDate value="${toy.createDate }" pattern="yyyy-MM-dd" /></td>
					<td><button type="button" class="btn btn-primary" onclick="edit(${toy.id})">编辑</button>&nbsp;&nbsp;
					<button type="button" class="btn btn-primary" onclick="remove(${toy.id},'${toy.name }')">删除</button></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	</div>
	<script type="text/javascript">
		function edit(id) {
			location.href="findById?id="+id;
		}
		
		function remove(id,name) {
			if(confirm("是否确认删除"+name+"?")) {
				location.href="remove?id="+id;
			}
		}
		
	</script>
</body>
</html>