<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
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

<h4><B><font color="#fdafab">자유게시판 글쓰기</font></B></h4>
<br><br>

<form action="boardinput" method="post" enctype="multipart/form-data">
	<input type="hidden" name="mem_no" value="${mem_no }" readonly="readonly">
	<input type="hidden" name="mem_nickname" value="${mem_nickname }" readonly="readonly">

<table border="0" align="center">
<tr>
	<td><B>　제목　</B></td>
	<td><input type="text" name="bd_title"></td></tr>
<tr>
	<td><B>　내용　</B></td>
	<td><textarea name="bd_content"></textarea></td></tr>
<tr>
	<td><B>　이미지　</B></td>
	<td><input type="file" name="bd_image"></td></tr>
<tr>
	<td colspan="2" align="center">　　
		</td></tr>
<tr>
	<td colspan="2"><B>
		<input type="submit" value="등록"></B></td></tr>
</table>
</form>

</body>
</html>