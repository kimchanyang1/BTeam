<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>분양/임시보호 게시글 수정</title>
</head>
<body>

<form action="rehomemodify" method="post" enctype="multipart/form-data">

	<input type="hidden" name="rh_no" value="${rd.rh_no}">
	<input type="hidden" name="mem_no" value="${rd.mem_no}">
	<input type="hidden" name="mem_nickname" value="${rd.mem_nickname}">
	<input type="hidden" name="mem_tel" value="${rd.mem_tel}">
	<input type="hidden" name="rh_writeday" value="${rd.rh_writeday}">
	<input type="hidden" name="rh_readcount" value="${rd.rh_readcount}">

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
			<td><input type="text" name="rh_title" value="${rd.rh_title}"></td>
		</tr>
		<tr>
			<th>반려동물 이름</th>
			<td><input type="text" name="rh_pname" value="${rd.rh_pname}"></td>
		</tr>
		<tr>
			<th>반려동물 등록번호</th>
			<td><input type="text" name="rh_pno" value="${rd.rh_pno}"></td>
		</tr>
		<tr>
			<th>반려동물 발견날짜</th>
			<td><input type="date" name="rh_misdate" value="${rd.rh_misdate}"></td>
		</tr>
		<tr>
			<th>반려동물 발견장소</th>
			<td><input type="text" name="rh_misplace" value="${rd.rh_misplace}"></td>
		</tr>
		<tr>
			<th>반려동물 이미지</th>
			<td><input type="file" name="rh_image"></td>
		</tr>
		<tr>
			<th>글 내용</th>
			<td><textarea rows="20" cols="40" name="rh_content">${rd.rh_content}
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