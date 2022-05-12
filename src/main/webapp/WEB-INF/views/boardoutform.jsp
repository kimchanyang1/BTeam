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
<form action="boardsearch">
<table border="1" align="center">
<input type="hidden" name="mem_no" value="${mem_no }" readonly="readonly">
<input type="hidden" name="mem_nickname" value="${mem_nickname }" readonly="readonly">
<button><a href="boardinputform?mem_no=${mem_no }&mem_nickname=${mem_nickname }">글쓰기</a></button>
<tr>
	<td colspan="6"><select name="selectname">
	  	<option value="bd_title">　제목　</option>
	  	<option value="mem_nickname">　작성자　</option></select>
		<input type="text" name="searchname">
		<input type="submit" value="검색"></td></tr>
<tr>
	<th>　글번호　</th>
	<th>　제목　</th>
	<th>　작성자　</th>
	<th>　작성일자　</th>
	<th>　조회수　</th>
	<th>　추천수　</th></tr>
<c:forEach items="${boardlist }" var="b">
<tr>
	<th>　${b.bd_no }　</th>
	<th><a href="boarddetail?bd_no=${b.bd_no }">${b.bd_title }　</a></th>
	<th>　${b.mem_nickname }　</th>
	<th>　${b.bd_writeday }　</th>
	<th>　${b.bd_readcount }　</th>
	<th>　${b.bd_likes }　</th></tr>
</c:forEach>
</table>
</form>
</body>
</html>