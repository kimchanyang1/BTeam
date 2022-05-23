<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
th {
	text-align: center;
	height: 35px;
}
td {
	height: 35px;
}
table {
	border-spacing: 5px;
	border-collapse: separate;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h4><B><font color="#fdafab">내 글 확인</font></B></h4>
<br><br>
<hr>

<table border="0" align="center">
	<tr>
		<td><B><button onclick="location.href='membermissingwrite'">실종신고</button></B></td>
		<td><B><button onclick="location.href='memberrehomewrite'">분양/임시보호</button></B></td>
		<td><B><button onclick="location.href='memberepiloguewrite'">후기</button></B></td>
		<td><B><button onclick="location.href='memberboardwrite'">자유게시판</button></B></td>
	</tr>
</table>

</body>
</html>