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
        url:'IdCheckForm', //Controller에서 인식할 주소
        type:'GET', //POST 방식으로 전달
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
/*
function id_check(){
	var url = "IdCheckForm";
	var windowTargetName = "targetName";
	var features = "scrollbars=no,width=500,height=300,location=no, resizable=no";
	window.open(url, windowTargetName, features);
}
*/
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
		var domain2 = f.domain2.value;
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
<script type="text/javascript">
/*
$(document).ready(function(){
	$("#submit").click(function(){
		alert("회원가입 시작");
		var f = document.form1;
		var id = f.mem_id.value;
		var idCheck = f.idCheck.value;
		if (id="") {
			alert("아이디를 입력해 주세요");
		}else if (idCheck!="idChecked") {
			alert("아이디 체크를 해주세요");
		}
		alert("회원가입 완료");
	});
});
*/
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form class="form-horizontal" action="signup" method="post" name="form1">
<div style="width: 50%;margin: auto;padding-top: 20px;">
	<div class="form-group">
		<label class="control-label col-sm-2" for="mem_id">아이디</label>
		<div class="col-sm-10">
			<input type="text" id="mem_id" name="mem_id" placeholder="아이디를 입력해주세요" onkeydown="reCheck()">
			<button type="button" onclick="id_check()" id="parentForm">아이디 중복확인</button>
			<input type="text" value="idUnchecked" name="idCheck" id="idCheck" readonly="readonly">
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="mem_pw">비밀번호</label>
		<div class="col-sm-10">
			<input type="password" class="form-control" id="mem_pw" name="mem_pw" placeholder="비밀번호를 입력해주세요">
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="pwCheck">비밀번호 확인</label>
		<div class="col-sm-10">
			<input type="password" class="form-control" id="pwCheck" name="pwCheck" placeholder="비밀번호를 다시 입력해주세요">
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="mem_name">이름</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="mem_name" name="mem_name" placeholder="이름을 입력해주세요">
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="mem_nickname">닉네임</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="mem_nickname" name="mem_nickname" placeholder="닉네임을 입력해주세요">
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="mem_jumin">주민등록번호</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="mem_jumin" name="mem_jumin" placeholder="주민등록번호를 입력해주세요">
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="mem_tel">연락처</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="mem_tel" name="mem_tel" placeholder="연락처를 입력해주세요">
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="emailid">이메일</label>
		<div class="col-sm-4" style="width: 60%;" id="email">
			<input type="text" id="emailid" name="emailid">@
			<select name="domain" id="domain">
				<option value="naver.com">naver.com</option>
				<option value="daum.net">daum.net</option>
				<option value="gmail.com">gmail.com</option>
				<option value="nate.com">nate.com</option>
				<option value="manual">직접입력</option>
			</select>
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="mem_address">주소</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="mem_address" name="mem_address" placeholder="주소를 입력해주세요">
		</div>
	</div>
	<div class="form-group">
		<div class="col-sm-offset-2 col-sm-10">
			<input type="button" onclick="checking()" value="입력">
		</div>
	</div>
</div>
</form>
</body>
</html>