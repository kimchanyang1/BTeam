<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>분양/임시보호</title>
</head>
<body>

<form action="rehomeinput" method="post" enctype="multipart/form-data">
	<!-- 
	<input type="hidden" name="mem_no" value="">
	 -->
	<table>
		<tr>
			<th>구분1(글 상태)</th>
			<td><input type="radio" name="rh_gb1" value="미확인">미확인
				<input type="radio" name="rh_gb1" value="승인" disabled>승인
				<input type="radio" name="rh_gb1" value="보류" disabled>보류
				<input type="radio" name="rh_gb1" value="거절" disabled>거절
				<input type="radio" name="rh_gb1" value="임보 완료" disabled>임보 완료
				<input type="radio" name="rh_gb1" value="분양 완료" disabled>분양 완료</td>
		</tr>
		<tr>
			<th>구분2</th>
			<td><input type="radio" name="rh_gb2" value="임보">임보
				<input type="radio" name="rh_gb2" value="분양">분양</td>
		</tr>
		<tr>
			<th>구분3</th>
			<td><input type="radio" name="rh_gb3" value="개">개
				<input type="radio" name="rh_gb3" value="고양이">고양이</td>
		</tr>
		<tr>
			<th>제목</th>
			<td><input type="text" name="rh_title"></td>
		</tr>
		<tr>
			<th>반려동물 이름</th>
			<td><input type="text" name="rh_pname"></td>
		</tr>
		<tr>
			<th>반려동물 등록번호</th>
			<td><input type="text" name="rh_pno"></td>
		</tr>
		<tr>
			<th>반려동물 분실날짜</th>
			<td><input type="date" name="rh_misdate"></td>
		</tr>
		<tr>
			<th>반려동물 분실장소</th>
			<td><input type="text" name="rh_misplace"></td>
		</tr>
		<tr>
			<th>반려동물 이미지</th>
			<td><input type="file" name="rh_image"></td>
		</tr>
		<tr>
			<th>글 내용</th>
			<td><textarea rows="20" cols="40" name="rh_content">(필수: 품종, 색상, 크기, 성별, 나이 / 사고 경위 등을 작성해 주세요)
				</textarea></td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="등록">
				<input type="reset" value="취소">
				<a href="rehomeoutform"><input type="button" value="목록"></a>
			</td>
		</tr>
	</table>
</form>

</body>
</html>