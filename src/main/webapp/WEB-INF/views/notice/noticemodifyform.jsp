<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
th {
	text-align: center;
}
td {
	text-align: center;
	height: 35px;
}
table {
	border-spacing: 10px;
	border-collapse: separate;
}
textarea {
	line-height: 150%;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h4><B><font color="#fdafab">글수정</font></B></h4>
<br><br>

<form action="noticemodify" method="post">

<table border="0" align="center">
	<tr>
		<th>　글번호　</th>
		<td><input type="text" name="nt_no" value="${ndto.nt_no}" readonly="readonly"></td>
	</tr>
	<tr>
		<th>　제목　</th>
		<td><input type="text" name="nt_title" value="${ndto.nt_title}"></td>
	</tr>
	<tr>
		<th>　내용　</th>
		<td><textarea name="nt_content">${ndto.nt_content}</textarea></td>
	</tr>
	<tr>
		<td colspan="2">　　</td>
	</tr>
	<tr>
		<th colspan="2">
			<input type="submit" value="수정">　
			<a href="noticedetail?nt_no=${ndto.nt_no}"><input id="cancel" type="button" value="취소"></a></th>
	</tr>
</table>
</form>
</body>
</html>