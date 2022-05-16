<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h3>실종강아지</h3>
<a href="missinginputform"><input type="button" value="글 작성"></a>
<table border="1">
	<thead>
		<tr>
			<th>글번호</th>
			<th>제목</th>
			<th>작성일자</th>
			<th>조회수</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${missingend}" var="mic">
		<tr>
			<td>${mic.mis_no}</td>
			<td><a href="missingdetail?mis_no=${mic.mis_no}">${mic.mis_title}</a></td>
			<td>${mic.mis_writeday}</td>
			<td>${mic.mis_readcount}</td>
		</tr>
		</c:forEach>
	</tbody>
</table>
</body>
</html>