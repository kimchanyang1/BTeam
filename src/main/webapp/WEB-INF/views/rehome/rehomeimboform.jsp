<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
th {
	text-align: center;
}
td {
	text-align: left;
	height: 35px;
}
table {
	border-spacing: 10px;
	border-collapse: separate;
}
</style>
<meta charset="UTF-8">
<jsp:include page="cdn.jsp"></jsp:include>
<title>분양/임시보호 보호자 정보 수정</title>
</head>
<body>

<section>

<h4><B><font color="#fdafab">임시보호자 정보 입력</font></B></h4>
<br><br>

<form action="rehomeimbo" method="post">
<input type="hidden" name="rh_no" value="${rh_no}">
<table border="0" align="center">
	<tr>
		<th>　회원번호　</th>
		<td>
			<input type="text" name="mem_no">
		</td>
	</tr>
	<tr>
		<th>　닉네임　</th>
		<td>
			<input type="text" name="mem_nickname">
		</td>
	</tr>
	<tr>
		<th>　연락처　</th>
		<td>
			<input type="text" name="mem_tel">
		</td>
	</tr>
	<tr>
		<td>　　</td></tr>
	<tr>
		<th colspan="2">
			<input type="submit" value="등록">
			<a href="rehomeoutform"><input type="button" value="취소"></a>
		</th>
	</tr>
</table>
</form>

</section>
</body>
</html>