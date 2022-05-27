<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
$(document).ready(function(){
    $('#memberdelete').click(function(){
        let kk = confirm("${mdto.mem_nickname}"+'님 정말 탈퇴하실건가요?');
        if (kk) {
            alert('탈퇴 실행');
            var url = "memberdelete?mem_no="+${mdto.mem_no};
            $(location).attr('href',url);
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
<h4><B><font color="#fdafab">회원정보</font></B></h4>
<h6><B>　　</B></h6>
<h6><B><font color="red">　　</font></B></h6>
<br><br>

<table border="0" align="center">
	<tr>
		<th></th>
		<td style="text-align: right;"><B><button onclick="location.href='memberwritelist'">내 글 확인</button></B></td>
	</tr>
	<tr>
		<th><B>　회원번호　</B></th>
		<td id="mem_no"><input type="text" value="${mdto.mem_no}" readonly="readonly"></td>
	</tr>
	<tr>
		<th><B>　아이디　</B></th>
		<td><input type="text" value="${mdto.mem_id}" readonly="readonly"></td>
	</tr>
	<tr>
		<th><B>　비밀번호　</B></th>
		<td><input type="password" value="${mdto.mem_pw}" readonly="readonly"></td>
	</tr>
	<tr>
		<th><B>　이름　</B></th>
		<td><input type="text" value="${mdto.mem_name}" readonly="readonly"></td>
	</tr>
	<tr>
		<th><B>　닉네임　</B></th>
		<td id="mem_nickname"><input type="text" value="${mdto.mem_nickname}" readonly="readonly"></td>
	</tr>
	<tr>
		<th><B>　주민등록번호　</B></th>
		<td><input type="text" value="${mdto.mem_jumin}" readonly="readonly"></td>
	</tr>
	<tr>
		<th><B>　연락처　</B></th>
		<td><input type="tel" value="${mdto.mem_tel}" readonly="readonly"></td>
	</tr>
	<tr>
		<th><B>　이메일　</B></th>
		<td><input type="email" value="${mdto.mem_mail}" readonly="readonly"></td>
	</tr>
	<tr>
		<th><B>　주소　</B></th>
		<td><input type="text" value="${mdto.mem_address}" readonly="readonly"></td>
	</tr>
	<tr>
		<td colspan="2">　　</td>
	</tr>
	<tr>
		<th colspan="2">
			<button onclick="location.href='membermodifyform'">수정</button>　
			<button id="memberdelete">회원탈퇴</button>
		</th>
	</tr>
</table>
</body>
</html>