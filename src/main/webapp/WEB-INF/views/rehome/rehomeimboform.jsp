<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>분양/임시보호 게시글 수정</title>
</head>
<body>

<form action="rehomeimbo" method="post">
	<input type="hidden" name="rh_no" value="${rh_no}">
	<table>
		<tr>
			<th>임시보호자 회원번호</th>
			<td>
				<input type="number" name="mem_no">
			</td>
		</tr>
		<tr>
			<th>임시보호자 닉네임</th>
			<td>
				<input type="text" name="mem_nickname">
			</td>
		</tr>
		<tr>
			<th>임시보호자 연락처</th>
			<td>
				<input type="text" name="mem_tel">
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="등록">
				<input type="reset" value="취소">
				<a href="rehomeoutform"><input type="button" value="목록"></a>
			</td>
		</tr>
	</table>
</form>

</body>
</html>