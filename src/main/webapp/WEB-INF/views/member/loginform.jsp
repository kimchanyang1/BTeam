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

<h4><B><font color="#fdafab">로그인</font></B></h4>
<br><br>

<form action="login" method="post">
	
<div style="width: 20%;margin: auto;padding: 10px;">
	<span class="glyphicon glyphicon-user"><input id="login" type="text" name="mem_id" placeholder="아이디" value="${memoryid}"></span><br>
	<span class="glyphicon glyphicon-lock"><input id="login" type="password" name="mem_pw" placeholder="비밀번호"></span>
	<div style="padding: 5px;">
		<label class="checkbox-inline"><input type="checkbox" name="memoryid" 
			<c:if test="${memorycheck eq true}">checked="checked"</c:if>
		>아이디 기억하기</label>
	</div>
	<br>
	<div style="padding: 5px;">
		<input type="submit" value="로그인">
	</div>
</div>
</form>
</body>
</html>