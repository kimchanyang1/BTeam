<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>자유게시판</h3>
<br><br>
<form action="boardmodify" method="post" enctype="multipart/form-data">
<table border="1" align="center" width="600">
<c:forEach items="${boardmodify }" var="b">
<tr>
	<td><input type="text" name="bd_no" value="${b.bd_no}" readonly="readonly"></td></tr>
<tr>
	<th>　제목　</th>
	<td><input type="text" name="bd_title" value="${b.bd_title }"></td></tr>
<tr>
	<th>　내용　</th>
	<td><textarea name="bd_content">${b.bd_content }</textarea></td></tr>
<tr>
	<th>　이미지　</th>
	<td><img src="${pageContext.request.contextPath}/image/${b.bd_image}">
		<input type="file" name="bd_image"></td></tr>	
<tr>
	<td colspan="2" align="center">　　
		<input type="hidden" name="mem_no" value="${mem_no }" readonly="readonly"></td></tr>
<tr>
	<td colspan="2" align="center">　　
		<input type="hidden" name="mem_nickname" value="${mem_nickname }" readonly="readonly"></td></tr>
<tr>
	<td colspan="2" align="center">
		<input type="submit" value="수정"></td></tr>
</c:forEach>
</table>
</form>
</body>
</html>