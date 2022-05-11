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
<table border="1" align="center">
<button><a href="">글쓰기</a></button>
<tr>
	<th>　글번호　</th>
	<th>　제목　</th>
	<th>　작성자　</th>
	<th>　작성일자　</th>
	<th>　조회수　</th>
	<th>　추천수　</th></tr>
<c:forEach items="${board }" var="b">
<tr>
	<th>　${b.bd_no }　</th>
	<th>　${b.bd_title }　</th>
	<th>　${b.bd_writer }　</th>
	<th>　${b.bd_writeday }　</th>
	<th>　${b.bd_readcount }　</th>
	<th>　${b.bd_likes }　</th></tr>
</c:forEach>
</table>
</body>
</html>