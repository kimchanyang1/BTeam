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
<title>Insert title here</title>
</head>
<body>
<h4><B><font color="#fdafab">회원정보 수정</font></B></h4>
<h6><B>　　</B></h6>
<h6><B><font color="red">* 모욕감을 주는 닉네임/성적인 닉네임 사용 시 제재의 대상이 될 수 있습니다</font></B></h6>
<br><br>

<form action="membermodify" method="post">
<table border="0" align="center">
	<tr>
		<th><B>　회원번호　</B></th>
		<td id="mem_no"><input type="text" value="${mdto.mem_no}" readonly="readonly" name="mem_no"></td>
	</tr>
	<tr>
		<th><B>　아이디　</B></th>
		<td><input type="text" value="${mdto.mem_id}" readonly="readonly" name="mem_id"></td>
	</tr>
	<tr>
		<th><B>　비밀번호　</B></th>
		<td><input type="password" value="${mdto.mem_pw}" name="mem_pw"></td>
	</tr>
	<tr>
		<th><B>　이름　</B></th>
		<td><input type="text" value="${mdto.mem_name}" readonly="readonly" name="mem_name"></td>
	</tr>
	<tr>
		<th><B>　닉네임　</B></th>
		<td><input type="text" value="${mdto.mem_nickname}" name="mem_nickname"></td>
	</tr>
	<tr>
		<th><B>　주민등록번호　</B></th>
		<td><input type="text" value="${mdto.mem_jumin}" name="mem_jumin"></td>
	</tr>
	<tr>
		<th><B>　연락처　</B></th>
		<td><input type="tel" value="${mdto.mem_tel}" name="mem_tel"></td>
	</tr>
	<tr>
		<th><B>　이메일　</B></th>
		<td><input type="email" value="${mdto.mem_mail}" name="mem_mail"></td>
	</tr>
	<tr>
		<th><B>　주소　</B></th>
		<td><input type="text" value="${mdto.mem_address}" name="mem_address"></td>
	</tr>
	<tr>
		<td colspan="2">　　</td>
	</tr>
	<tr>
		<th colspan="2">
			<button type="submit">수정</button>　
			<a href="memberdetail"><input id="cancel" type="button" value="취소"></a>
		</th>
	</tr>
</table>
</form>
</body>
</html>