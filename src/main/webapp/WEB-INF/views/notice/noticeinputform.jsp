<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="noticeinput" method="post">
<input type="hidden" value="${mem_no}" name="mem_no" readonly="readonly">
<table style="margin: auto;width: 50%;">
	<tr>
		<th>작성자</th>
		<td><input type="text" name="mem_nickname" value="${mem_nickname}" readonly="readonly"></td>
	</tr>
	<tr>
		<th>제목</th>
		<td><input type="text" name="nt_title"></td>
	</tr>
	<tr>
		<th>내용</th>
		<td><textarea rows="10" cols="20" name="nt_content"></textarea></td>
	</tr>
	<tr>
		<td colspan="2">
			<button type="submit">글 작성</button>
		</td>
	</tr>
</table>
</form>
</body>
</html>