<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
$(document).ready(function(){
	$('#memdelete').click(function(){
		let kk = confirm($('#mem_no').text()+'님 정말 탈퇴하실건가요?');
		if (kk) {
			alert('탈퇴 실행');
			var url = "memdelete?mem_no="+$('#mem_no').text();
			$(location).attr('href',url);
		}
	});
});
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="membermodify" method="post">
<table style="margin: auto;">
	<tr>
		<th>회원번호</th>
		<td id="mem_no"><input type="text" value="${mdto.mem_no}" readonly="readonly" name="mem_no"></td>
	</tr>
	<tr>
		<th>아이디</th>
		<td><input type="text" value="${mdto.mem_id}" readonly="readonly" name="mem_id"></td>
	</tr>
	<tr>
		<th>비밀번호</th>
		<td><input type="password" value="${mdto.mem_pw}" name="mem_pw"></td>
	</tr>
	<tr>
		<th>이름</th>
		<td><input type="text" value="${mdto.mem_name}" readonly="readonly" name="mem_name"></td>
	</tr>
	<tr>
		<th>닉네임</th>
		<td><input type="text" value="${mdto.mem_nickname}" name="mem_nickname"></td>
	</tr>
	<tr>
		<th>주민등록번호</th>
		<td><input type="text" value="${mdto.mem_jumin}" name="mem_jumin"></td>
	</tr>
	<tr>
		<th>전화번호</th>
		<td><input type="tel" value="${mdto.mem_tel}" name="mem_tel"></td>
	</tr>
	<tr>
		<th>이메일</th>
		<td><input type="email" value="${mdto.mem_mail}" name="mem_mail"></td>
	</tr>
	<tr>
		<th>주소</th>
		<td><input type="text" value="${mdto.mem_address}" name="mem_address"></td>
	</tr>
	<tr>
		<td colspan="2">
			<button type="submit">수정</button>
			<button onclick="location.href='memdetail">취소</button>
		</td>
	</tr>
</table>
</form>
</body>
</html>