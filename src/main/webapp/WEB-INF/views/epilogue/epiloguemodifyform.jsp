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
<h3>후기게시판 글수정</h3>
<br><br>
<form action="epiloguemodify" method="post" enctype="multipart/form-data">
<table border="1" align="center" width="600">
<c:forEach items="${epiloguelist }" var="e">
<tr>
	<td><input type="hidden" name="ep_no" value="${e.ep_no}" readonly="readonly"></td></tr>
<tr>
	<th>　구분　</th>
	<td><input type="text" value="${e.ep_gb }" readonly="readonly"></td></tr>	
<tr>
	<th>　제목　</th>
	<td><input type="text" name="ep_title" value="${e.ep_title }"></td></tr>
<tr>
	<th>　내용　</th>
	<td><textarea name="ep_content">${e.ep_content }</textarea></td></tr>
<tr>
	<th>　이미지　</th>
	<td><img src="${pageContext.request.contextPath}/image/${e.ep_image}">
		<input type="file" name="ep_image"></td></tr>	
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