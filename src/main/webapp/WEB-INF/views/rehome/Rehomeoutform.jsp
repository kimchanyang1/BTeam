<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>분양/임시보호 목록</title>
</head>
<body>

<jsp:include page="Rehomesearch.jsp"></jsp:include>
<br>
<hr>

<table border="1">
	<tr><th>글 번호</th><th>제목</th><th>발견 장소</th><th>발견 날짜</th><th>작성 날짜</th><th>조회 수</th></tr>
	<c:forEach items="${rdto}" var="rh">
	<tr>
		<td>${rh.rh_no }</td>
		<td><a href="rehomedetail?rh_no=${rh.rh_no }">
			[${rh.rh_gb2 }/${rh.rh_gb3 }]${rh.rh_title}
			</a></td>
		<td>${rh.rh_misplace }</td>
		<td>${rh.rh_misdate }</td>
		<td>${rh.rh_writeday }</td>
		<td>${rh.rh_readcount }</td>
	</tr>
	</c:forEach>
	<tr>
		<td>
			<c:if test="${logon eq true && mem_no != null}">
				<a href="rehomeinputform"><input type="button" value="글 등록"></a>
			</c:if>
		</td>
	</tr>
</table>
 
</body>
</html>