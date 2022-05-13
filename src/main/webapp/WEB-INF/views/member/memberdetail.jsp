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
<table style="margin: auto;">
	<tr>
		<th>회원번호</th>
		<td id="mem_no">${login.mem_no}</td>
	</tr>
	<tr>
		<th>아이디</th>
		<td>${login.mem_id}</td>
	</tr>
	<tr>
		<th>비밀번호</th>
		<td>${login.mem_pw}</td>
	</tr>
	<tr>
		<th>이름</th>
		<td>${login.mem_name}</td>
	</tr>
	<tr>
		<th>닉네임</th>
		<td>${login.mem_nickname}</td>
	</tr>
	<tr>
		<th>주민등록번호</th>
		<td>${login.mem_jumin}</td>
	</tr>
	<tr>
		<th>전화번호</th>
		<td>${login.mem_tel}</td>
	</tr>
	<tr>
		<th>이메일</th>
		<td>${login.mem_mail}</td>
	</tr>
	<tr>
		<th>주소</th>
		<td>${login.mem_address}</td>
	</tr>
	<tr>
		<td colspan="2">
			<button onclick="location.href='membermodifyform'">수정</button>
			<button id="memberdelete">회원탈퇴</button>
		</td>
	</tr>
</table>
</body>
</html>