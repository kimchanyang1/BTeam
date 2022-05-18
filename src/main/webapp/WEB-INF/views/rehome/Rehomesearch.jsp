<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="cdn.jsp"></jsp:include>
<title>분양/임시보호 검색</title>
</head>
<body>
<form action="rehomesearch" method="post" class="form-horizontal">
	<div class="form-group text-center">
		<label class="col-sm-offset-4 col-sm-1"><input type="checkbox" name="gb2" value="임시보호"> 임시보호</label>
		<label class="col-sm-1"><input type="checkbox" name="gb2" value="분양"> 분양</label>
		<label class="col-sm-1"><input type="checkbox" name="gb3" value="개"> 개</label>
		<label class="col-sm-1"><input type="checkbox" name="gb3" value="고양이"> 고양이</label>
	</div>
	<div class="form-group text-center">
		<div class="col-sm-offset-4 col-sm-1">
			<label for="search">발견장소</label>
		</div>
		<div class="col-sm-2">
			<input type="text" name="sword" class="form-control" id="search">
		</div>
		<div class="col-sm-1">
			<input type="submit" value="조회" class="btn btn-sm btn-basic">
		</div>
	</div>
</form>
</body>
</html>