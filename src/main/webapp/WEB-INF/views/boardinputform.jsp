<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>자유게시판 글쓰기</h3>
<br><br>
<form action="boardinput" method="post" enctype="multipart/form-data">
<table border="1" align="center">
<tr>
	<td><input type="text" name="mem_no" value="${mem_no }" readonly="readonly"></td>
	<td><input type="text" name="mem_nickname" value="${mem_nickname }" readonly="readonly"></td></tr>
<tr>
	<th>　제목　</th>
	<td><input type="text" name="bd_title"></td></tr>
<tr>
	<th>　내용　</th>
	<td><textarea name="bd_content"></textarea></td></tr>
<tr>
	<th>　이미지　</th>
	<td><input type="file" name="bd_image"></td></tr>
<tr>
	<td colspan="2">　　</td></tr>
<tr>
	<td colspan="2">　　</td></tr>
<tr>
	<td colspan="2" align="center">
		<input type="submit" value="등록"></td></tr>
</table>
</form>
</body>
</html>