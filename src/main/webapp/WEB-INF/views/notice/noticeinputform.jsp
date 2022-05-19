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

<h4><B><font color="#fdafab">공지게시판 글쓰기</font></B></h4>
<br><br>

<form action="noticeinput" method="post">
	<input type="hidden" value="${mem_no}" name="mem_no" readonly="readonly">

<table border="0" align="center">
	<tr>
		<td><B>　작성자　</B></td>
		<td><input type="text" name="mem_nickname" value="${mem_nickname}" readonly="readonly"></td>
	</tr>
	<tr>
		<td><B>　제목　</B></td>
		<td><input type="text" name="nt_title"></td>
	</tr>
	<tr>
		<td><B>　내용　</B></td>
		<td><textarea name="nt_content"></textarea></td>
	</tr>
	<tr>
		<td colspan="2"><B>
			<input type="submit" value="등록"></B>　
			<a href="noticeoutform"><input id="cancel" type="button" value="취소"></a>
		</td>		
	</tr>
</table>
</form>

</body>
</html>