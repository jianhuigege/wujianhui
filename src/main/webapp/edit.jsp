<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
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
	<div style="margin: auto; width: 860px;">
		<h2>SpringMVC + Spring + Mybatis + MySQL</h2>
		<c:if test="${empty toy }">新增玩具</c:if>
		<c:if test="${!empty toy }">修改玩具</c:if>
		<form action="save" method="post" name="f" role="formRole">
			<div class="from-group">
				<input type="hidden" name="id" value="${toy.id }"> <label>玩具名</label>
				<input type="text" name="name" class="form-control"
					placeholder="玩具名" value="${toy.name }" required> <small
					style="color: red;">*</small>
			</div>
			<div class="from-group">
				<label>价格</label> <input type="number" name="price"
					class="form-control" step="0.01" placeholder="价格"
					value="${toy.price }">
			</div>
			<div class="from-group">
				<label>生产日期</label>
				<c:if test="${empty toy }">
					<input type="date" name="createDate" class="form-control">
				</c:if>
				<c:if test="${!empty toy }">
					<input type="date" name="createDate" class="form-control"
						value="<spring:eval expression="toy.createDate"/>">
				</c:if>

			</div>
			<button type="submit" class="btn btn-success btn-block">保存</button>
		</form>
	</div>
</body>
</html>