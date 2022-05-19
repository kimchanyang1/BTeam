<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
$(document).ready(function(){
	$('#domain').on('change',function(){
		if (this.value=="manual") {
			$('#email').append('<input type="text" name="domain2" placeholder="주소부분 입력" id="domain2">');
		} else {
			$('#domain2').remove();
		}
	});
});
</script>

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
<h4><B><font color="#fdafab">회원가입</font></B></h4>
<h6><B>🌸 환영합니다 🌸</B></h6>
<h6><B><font color="red">* 모욕감을 주는 닉네임/성적인 닉네임 사용 시 제재의 대상이 될 수 있습니다</font></B></h6>
<br><br>

<form action="signup" method="post">
<table border="0" align="center">
	<tr>
		<th><B>　아이디　</B></th>
		<td><input type="text" name="mem_id" placeholder="아이디를 입력해주세요"></td>
	</tr>
	<tr>
		<th><B>　비밀번호　</B></th>
		<td><input type="password" name="mem_pw" placeholder="비밀번호를 입력해주세요"></td>
	</tr>
	<tr>
		<th><B>　이름　</B></th>
		<td><input type="text" name="mem_name" placeholder="이름을 입력해주세요"></td>
	</tr>
	<tr>
		<th><B>　닉네임　</B></th>
		<td><input type="text" name="mem_nickname" placeholder="닉네임을 입력해주세요"></td>
	</tr>
	<tr>
		<th><B>　주민등록번호　</B></th>
		<td><input type="text" name="mem_jumin" placeholder="주민등록번호를 입력해주세요"></td>
	</tr>
	<tr>
		<th><B>　연락처　</B></th>
		<td><input type="text" name="mem_tel" placeholder="연락처를 입력해주세요"></td>
	</tr>
	<tr>
		<th><B>　이메일　</B></th>
		<td><input id="email" type="text" name="emailid" placeholder="이메일을 입력해주세요">@
				<select name="domain" id="domain">
					<option value="naver.com">naver.com</option>
					<option value="daum.net">daum.net</option>
					<option value="gmail.com">gmail.com</option>
					<option value="nate.com">nate.com</option>
					<option value="manual">직접입력</option>
				</select>
		</td>
	</tr>
	<tr>
		<th><B>　주소　</B></th>
		<td><input type="text" name="mem_address" placeholder="주소를 입력해주세요"></td>
	</tr>	
	<tr>
		<td colspan="2">　　</td>
	</tr>
	<tr>
	<th colspan="2">
		<button type="submit">가입</button>　
		<a href="home"><input id="cancel" type="button" value="취소"></a></th>
	</tr>
</table>	

</form>
</body>
</html>