<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>분양/임보 목록</title>
</head>
<body>

<table>
	<tr><th>글 번호</th><th>글 상태</th><th>제목</th><th>실종 장소</th><th>실종 날짜</th><th>작성 날짜</th><th>조회 수</th></tr>
	<c:forEach items="${rdto }" var="rh">
	<tr>
		<td>${rh.rh_no }</td>
		<td>${rh.rh_gb1 }</td>
		<td>[${rh.rh_gb2 }/${rh.rh_gb3 }/${rh.rh_title}]</td>
		<td>${rh.rh_misplace }</td>
		<td>${rh.rh_misdate }</td>
		<td>${rh.rh_writeday }</td>
		<td>${rh.rh_readcount }</td>
	</tr>
	</c:forEach>
	<tr><td><a href="rehome"><input type="button" value="글 등록"></a></td></tr>
</table>

</body>
</html>