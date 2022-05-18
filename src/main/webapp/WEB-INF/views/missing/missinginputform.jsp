<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>실종신고 접수</h3>
<form action="missinginput" method="post" enctype="multipart/form-data">
<div style="width: 50%;margin: auto;padding-top: 20px;">
	<div class="form-group">
		<label class="control-label col-sm-2" for="mis_gb2">동물종류</label>	
			<td>
				&emsp;<input type="radio" name="mis_gb2" value="개">개
				<input type="radio" name="mis_gb2" value="고양이">고양이
			</td>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="mis_title">글제목</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="mis_title" name="mis_title" placeholder="제목을 입력해주세요">
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="mis_pname">이름</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="mis_pname" name="mis_pname" placeholder="이름을 입력해주세요">
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="mis_misdate">분실날짜</label>
		<div class="col-sm-10">
			<input type="date" class="form-control" id="mis_misdate" name="mis_misdate">
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="mis_misplace">분실장소</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="mis_misplace" name="mis_misplace" placeholder="분실장소를 입력해주세요">
		</div>
	</div>
	
	<div class="form-group">
		<label class="control-label col-sm-2" for="mis_pno">등록번호</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="mis_pno" name="mis_pno" placeholder="등록번호를 입력해주세요">
		</div>
	</div>
	
	<div class="form-group">
		<label class="control-label col-sm-2" for="mis_image">반려동물사진</label>
		<div class="col-sm-10">
			<input type="file" class="form-control" id="mis_image" name="mis_image">
		</div>	
	</div>
		<div class="form-group">
		<label class="control-label col-sm-2" for="mis_content">상세정보</label>
		<div class="col-sm-10">
		<textarea class="form-control" row="5" id="mis_content" name="mis_content"></textarea>			
		</div>
	</div>

	<div class="form-group">
		<div class="col-sm-offset-2 col-sm-10">
			<button type="submit" class="btn btn-default">접수</button>
		</div>
	</div>
<!-- 
<table border="1">
<tr><td>글제목</td><td><input type="text" class="mis_title" id="mis_title" name="mis_title"></td></tr>
<tr><td>이름</td><td><input type="text" name="mis_pname"></td></tr>
<tr><td>상세정보</td>
<td> 
<textarea name="mis_content" cols="30" rows="5">
품종 :
색상 :
크기 :
나이 :
성별 :
사고경위 :
</textarea>
</td></tr>
<tr><td>분실날짜</td><td><input type="date" name="mis_misdate"></td></tr>
<tr><td>분실장소</td><td><input type="text" name="mis_misplace"></td></tr>
<tr><td>등록번호</td><td><input type="text" name="mis_pno"></td></tr>
<tr><td>동물사진</td><td><input type="file" name="mis_image"></td></tr>
<tr><td></td></tr>
</table>
<input class="btn btn-default" type="submit" value="신고">
 -->
 </div>
</form>
</body>
</html>