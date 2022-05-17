<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="cdn.jsp"></jsp:include>
<title>분양/임시보호 게시글 수정</title>
</head>
<body>
<h2 align="center">분양/임시보호 게시글 수정</h2>
<br>
<form class="form-horizontal" action="rehomemodify" method="post" enctype="multipart/form-data">

	<input type="hidden" name="rh_no" value="${rd.rh_no}">
	<input type="hidden" name="rh_gb1" value="${rd.rh_gb1}">
	<input type="hidden" name="mem_no" value="${rd.mem_no}">
	<input type="hidden" name="mem_nickname" value="${rd.mem_nickname}">
	<input type="hidden" name="mem_tel" value="${rd.mem_tel}">
	<input type="hidden" name="rh_writeday" value="${rd.rh_writeday}">
	<input type="hidden" name="rh_readcount" value="${rd.rh_readcount}">

	<div class="form-group">
    	<label class="control-label col-sm-2" for="rh_gb2">임시보호/분양</label>
	    	<div class="col-sm-10">
		    	<label><input type="radio" name="rh_gb2" value="임시보호" id="rh_gb2"> 임시보호</label> &emsp;
		    	<label><input type="radio" name="rh_gb2" value="분양" id="rh_gb2"> 분양</label>
	    	</div>
    </div>
    <div class="form-group">
    	<label class="control-label col-sm-2" for="rh_gb3">동물 종류</label>
    		<div class="col-sm-10">
		    	<label><input type="radio" name="rh_gb3" value="개" id="rh_gb3"> 개</label> &emsp;
		    	<label><input type="radio" name="rh_gb3" value="고양이" id="rh_gb3"> 고양이</label>
	    	</div>
    </div>
    <div class="form-group">
    	<label class="control-label col-sm-2" for="rh_title">제목</label>
	    	<div class="col-sm-10">
	    		<input type="text" name="rh_title" class="form-control" id="rh_title" value="${rd.rh_title}">
	    	</div>
    </div>
    <div class="form-group">
    	<label class="control-label col-sm-2" for="rh_pname">반려동물 이름</label>
    		<div class="col-sm-10">
    			<input type="text" name="rh_pname" class="form-control" id="rh_pname" value="${rd.rh_pname}">
    		</div>
    </div>
    <div class="form-group">
    	<label class="control-label col-sm-2" for="rh_pno">반려동물 등록번호</label>
    		<div class="col-sm-10">
    			<input type="text" name="rh_pno" class="form-control" id="rh_pno" value="${rd.rh_pno}">
    		</div>
    </div>
    <div class="form-group">
    	<label class="control-label col-sm-2" for="rh_misdate">반려동물 발견날짜</label>
    		<div class="col-sm-10">
    			<input type="date" name="rh_misdate" class="form-control" id="rh_misdate" value="${rd.rh_misdate}">
    		</div>
    </div>
    <div class="form-group">
    	<label class="control-label col-sm-2" for="rh_misplace">반려동물 발견장소</label>
    		<div class="col-sm-10">
    			<input type="text" name="rh_misplace" class="form-control" id="rh_misplace" value="${rd.rh_misplace}">
    		</div>
    </div>
    <div class="form-group">
    	<label class="control-label col-sm-2" for="rh_image">반려동물 이미지</label>
    		<div class="col-sm-10">
    			<input type="file" name="rh_image" class="form-control" id="rh_image" value="${rd.rh_image}">
    		</div>
    </div>
    <div class="form-group">
    	<label class="control-label col-sm-2" for="rh_content">글 내용</label>
    		<div class="col-sm-10">
    			<textarea class="form-control" rows="20" name="rh_content" id="rh_content" placeholder="(필수: 품종, 색상, 크기, 성별, 나이 / 사고 경위 등을 작성해 주세요)">${rd.rh_readcount}</textarea>
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