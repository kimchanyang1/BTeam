<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
td {
	text-align: center;
	height: 35px;
}
table {
	border-spacing: 10px;
	border-collapse: separate;
}
textarea {
	line-height: 150%;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h4><B><font color="#fdafab">글수정</font></B></h4>
<br><br>

<form action="epiloguemodify" method="post" enctype="multipart/form-data">
	<input type="hidden" name="ep_no" value="${epiloguelist.ep_no}" readonly="readonly">
	<input type="hidden" name="mem_no" value="${mem_no }" readonly="readonly">
	<input type="hidden" name="mem_nickname" value="${mem_nickname }" readonly="readonly">

<table border="0" align="center">
<tr>
	<td><B>　구분　</B></td>
	<td><input type="text" value="${epiloguelist.ep_gb }" readonly="readonly"></td></tr>	
<tr>
	<td><B>　제목　</B></td>
	<td><input type="text" name="ep_title" value="${epiloguelist.ep_title }"></td></tr>
<tr>
	<td><B>　내용　</B></td>
	<td><textarea name="ep_content">${epiloguelist.ep_content }</textarea></td></tr>
<tr>
	<td><B>　이미지　</B></td>
	<td><input type="file" name="ep_image"></td></tr>	
<tr>
	<td colspan="2">　　</td></tr>
<tr>
	<td colspan="2"><B>
		<input type="submit" value="수정">
		<a href="epiloguedetail?ep_no=${epiloguelist.ep_no}"><input id="cancel" type="button" value="취소"></a></B></td></tr>

</table>
</form>

</body>
</html>