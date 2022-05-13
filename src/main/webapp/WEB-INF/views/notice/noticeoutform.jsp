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
<table border="1" style="margin: auto; width: 50%;">
	<thead>
		<tr>
			<th>글번호</th>
			<th>닉네임</th>
			<th>제목</th>
			<th>작성일자</th>
			<th>조회수</th>
		</tr>
	</thead>
	<tbody>
	<c:forEach items="${noticelist}" var="data">
		<tr>
			<td>${data.nt_no}</td>
			<td>${data.mem_nickname}</td>
			<td><a href="noticedetail?nt_no=${data.nt_no}">${data.nt_title}</a></td>
			<td>${data.nt_writeday}</td>
			<td>${data.nt_readcount}</td>
		</tr>
	</c:forEach>
	</tbody>
</table>
<c:if test="${logon eq true && login.mem_id eq 'admin'}">
<button onclick="location.href='noticeinputform'">글 입력</button>
</c:if>
</body>
</html>