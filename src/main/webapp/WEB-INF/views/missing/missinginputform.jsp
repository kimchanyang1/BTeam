<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="missinginput" method="post" enctype="multipart/form-data">
<table border="1">
<tr><td>구분</td><td><input type="text" name="mis_gb"></td></tr>
<tr><td>글제목</td><td><input type="text" name="mis_title"></td></tr>
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
<tr><td><input type="submit" value="전송"></td></tr>
</table>
</form>
</body>
</html>