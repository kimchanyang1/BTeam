<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="cdn.jsp"></jsp:include>
<title>분양/임시보호 보호자 정보 수정</title>
</head>
<body>
<h2 align="center">분양/임시보호 보호자 정보 수정</h2>
<br>
<form class="form-horizontal" action="rehomeimbo" method="post" align="center">
	<input type="hidden" name="rh_no" value="${rh_no}">
	<div class="form-group">
		<label class="control-label col-sm-offset-3 col-sm-2" for="mem_no">임시보호자 회원번호</label>
	    	<div class="col-sm-4">
		    	<input type="number" name="mem_no" id="mem_no" class="form-control">
	    	</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-offset-3 col-sm-2" for="mem_nickname">임시보호자 닉네임</label>
	    	<div class="col-sm-4">
		    	<input type="text" name="mem_nickname" id="mem_nickname" class="form-control">
	    	</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-offset-3 col-sm-2" for="mem_tel">임시보호자 연락처</label>
	    	<div class="col-sm-4">
		    	<input type="text" name="mem_tel" id="mem_tel" class="form-control">
	    	</div>
	</div>
	 <div class="text-center">
    	<input type="submit" value="등록" class="btn btn-lg btn-primary active">
		<input type="reset" value="취소" class="btn btn-lg btn-primary disabled">
		<a href="rehomeoutform"><input type="button" value="목록" class="btn btn-lg btn-default"></a>
    </div>
</form>

</body>
</html>