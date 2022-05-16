<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>후기게시판 글쓰기</h3>
<br><br>
<form action="epilogueinput" method="post" enctype="multipart/form-data">
<table border="1" align="center">
<tr>
	<th>　구분　</th>
	<td><input type="text" name="ep_gb" value="${ep_gb}" readonly="readonly"></td></tr>
<tr>
	<th>　제목　</th>
	<td><input type="text" name="ep_title"></td></tr>
<tr>
	<th>　내용　</th>
	<td><textarea name="ep_content"></textarea></td></tr>
<tr>
	<th>　이미지　</th>
	<td><input type="file" name="ep_image"></td>
</tr>
<tr>
	<td colspan="2" align="center">
		<input type="submit" value="등록"></td></tr>
</table>
<input type="hidden" name="mem_nickname" value="${mem_nickname}" readonly="readonly">
<input type="hidden" name="mem_no" value="${mem_no}" readonly="readonly">
<input type="hidden" name="ep_originno" value="${ep_originno}" readonly="readonly">
</form>
</body>
</html>