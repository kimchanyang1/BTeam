<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
<h1>여기는 수정폼</h1>
	
<form action="missingmodifyinput" method="post" enctype="multipart/form-data">
	<input type="hidden" name="mis_no" value="${mic.mis_no}">
	<input type="hidden" name="mem_no" value="${mic.mem_no}">
	<input type="hidden" name="mem_nickname" value="${mic.mem_nickname}">
	<input type="hidden" name="mem_tel" value="${mic.mem_tel}">
	<input type="hidden" name="mis_writeday" value="${mic.mis_writeday}">
	<input type="hidden" name="mis_readcount" value="${mic.mis_readcount}">

<table border="1">
<tr><td>구분</td><td><input type="text" name="mis_gb" value="${mic.mis_gb}"></td></tr>
<tr><td>글제목</td><td><input type="text" name="mis_title"></td></tr>
<tr><td>동물종류</td>
<td>
	&emsp;<input type="radio" name="mis_gb2" value="개">개
	<input type="radio" name="mis_gb2" value="고양이">고양이
</td>
</tr>
<tr><td>이름</td><td><input type="text" name="mis_pname" value="${mic.mis_pname}"></td></tr>
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
<tr><td>분실날짜</td><td><input type="date" name="mis_misdate" value="${mic.mis_writeday }"></td></tr>
<tr><td>분실장소</td><td><input type="text" name="mis_misplace" value="${mic.mis_misplace}"></td></tr>
<tr><td>등록번호</td><td><input type="text" name="mis_pno" value="${mic.mis_pno}"></td></tr>
<tr><td>동물사진</td><td><input type="file" name="mis_image"></td></tr>
<tr><td><input type="submit" value="전송"></td></tr>
</table>
</form>
</body>
</html>