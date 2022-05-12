<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="login" method="post">
<div style="width: 20%;margin: auto;padding: 10px;">
	<div class="input-group" style="padding: 5px;">
		<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
		<input id="id" type="text" class="form-control" name="mem_id" placeholder="아이디" value="${memoryid}">
	</div>
	<div class="input-group" style="padding: 5px;">
		<span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
		<input id="password" type="password" class="form-control" name="mem_pw" placeholder="비밀번호">
	</div>
	<div style="padding: 5px;">
		<label class="checkbox-inline"><input type="checkbox" name="memoryid" 
			<c:if test="${memorycheck eq true}">checked="checked"</c:if>
		>아이디 기억하기</label>
	</div>
	<div style="padding: 5px;">
		<button type="submit" class="btn btn-primary btn-block">로그인</button>
	</div>
</div>
</form>
</body>
</html>