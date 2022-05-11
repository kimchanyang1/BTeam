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
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form class="form-horizontal" action="Signup" method="post">
<div style="width: 50%;margin: auto;padding-top: 20px;">
	<div class="form-group">
		<label class="control-label col-sm-2" for="mem_id">아이디</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="mem_id" name="mem_id" placeholder="아이디를 입력해주세요">
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="mem_pw">비밀번호</label>
		<div class="col-sm-10">
			<input type="password" class="form-control" id="mem_pw" name="mem_pw" placeholder="비밀번호를 입력해주세요">
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
			<button type="submit" class="btn btn-default">입력</button>
		</div>
	</div>
</div>
</form>
</body>
</html>