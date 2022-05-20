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
function id_check(){
    var mem_id = $('#mem_id').val();
    $.ajax({
        url:'IdCheckForm',
        type:'GET',
        data:{'mem_id':mem_id},
        async:true,
        success:function(responseData){
        	$("#ajax").remove();
			var use = JSON.parse(responseData);
            alert(use+"개의 아이디 보유");
            if (use == 0) {
                $("#idCheck").attr("value","idChecked");
			}else {
                $("#idCheck").attr("value","idUnchecked");
			}
        },
        error:function(request,error){
            alert("에러입니다"+mem_id);
            alert("리퀘스트 스테이터스 : "+request.status+"\n에러 : "+error+"\n리스폰스텍스트"+request.responseText);
        }
    });
};
function reCheck() {
    $("#idCheck").attr("value","idUnchecked");
}
function checking() {
	try{
		var f = document.form1;

		var id = f.mem_id.value;
		var idCheck = f.idCheck.value;
		var pw = f.mem_pw.value;
		var pwCheck = f.pwCheck.value;
		var name = f.mem_name.value;
		var nickname = f.mem_nickname.value;
		var jumin = f.mem_jumin.value;
		var tel = f.mem_tel.value;
		var emailid = f.emailid.value;
		var address = f.mem_address.value;
		if (id=="") {
			alert("아이디를 입력해 주세요");
			return false;
		}else if (idCheck!="idChecked") {
			alert("아이디 체크를 해주세요");
			return false;
		}else if (pw=="") {
			alert("비밀번호를 입력해 주세요.");
			return false;
		}else if (pw!=pwCheck) {
			alert("비밀번호가 서로 다릅니다.");
			return false;
		}else if (name=="") {
			alert("이름을 입력해 주세요.");
			return false;
		}else if (nickname=="") {
			alert("닉네임을 입력해 주세요.");
			return false;
		}else if (jumin=="") {
			alert("주민번호를 입력해 주세요.");
			return false;
		}else if (tel=="") {
			alert("전화번호를 입력해 주세요.");
			return false;
		}else if (emailid=="") {
			alert("이메일을 입력해 주세요.");
			return false;
		}else if (address=="") {
			alert("주소를 입력해 주세요.");
			return false;
		}
		document.form1.submit();
		alert("회원가입 완료");
    }
    catch(err){
		alert(err.message);
    }
}
</script>

<style type="text/css">
th {
	text-align: left;
}
td {
	height: 35px;
}
table {
	border-spacing: 5px;
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

<form action="signup" method="post" name="form1">
<table border="0" align="center">
	<tr>
		<th><br>　아이디　</th>
		<td align="right">
			<button type="button" onclick="id_check()" id="parentForm"><B>중복확인</B></button>
			<input type="hidden" value="idUnchecked" name="idCheck" id="idCheck" readonly="readonly">
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<input id="mem_id" type="text" name="mem_id" placeholder="아이디를 입력해주세요" onkeydown="reCheck()">
		</td>
	</tr>

	<tr>
		<th colspan="2"><br>　비밀번호　</th>
	</tr>
	<tr>
		<td colspan="2">
			<input type="password" name="mem_pw" placeholder="비밀번호를 입력해주세요"></td>
	</tr>

	<tr>
		<th colspan="2"><br>　비밀번호 확인　</th>
	</tr>
	<tr>	
		<td colspan="2">
			<input type="password" name="pwCheck" placeholder="비밀번호를 다시 입력해주세요"></td>
	</tr>

	<tr>
		<th colspan="2"><br>　이름　</th>	
	</tr>
	<tr>
		<td colspan="2">
			<input type="text" name="mem_name" placeholder="이름을 입력해주세요"></td>
	</tr>
	
	<tr>
		<th colspan="2"><br>　닉네임　</th>
	</tr>
	<tr>	
		<td colspan="2">
			<input type="text" name="mem_nickname" placeholder="닉네임을 입력해주세요"></td>
	</tr>
	
	<tr>
		<th colspan="2"><br>　주민등록번호　</th>
	</tr>
	<tr>	
		<td colspan="2">
			<input type="text" name="mem_jumin" placeholder="주민등록번호를 입력해주세요"></td>
	</tr>
	
	<tr>
		<th colspan="2"><br>　연락처　</th>
	</tr>
	<tr>	
		<td colspan="2">
			<input type="text" name="mem_tel" placeholder="연락처를 입력해주세요"></td>
	</tr>
	
	<tr>
		<th colspan="2"><br>　이메일　</th>
	</tr>
	<tr>	
		<td colspan="2">
			<input id="email" type="text" name="emailid" placeholder="이메일을 입력해주세요">@
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
		<th colspan="2"><br>　주소　</th>
	</tr>
	<tr>	
		<td colspan="2">
			<input type="text" name="mem_address" placeholder="주소를 입력해주세요"></td>
	</tr>	
	
	<tr>
		<td colspan="2">　　</td>
	</tr>
	
	<tr>
		<td colspan="2"><B>
			<button type="button" onclick="checking()">가입</button>　
			<a href="home"><input id="cancel" type="button" value="취소"></a></B></td>
	</tr>
</table>	

</form>
</body>
</html>