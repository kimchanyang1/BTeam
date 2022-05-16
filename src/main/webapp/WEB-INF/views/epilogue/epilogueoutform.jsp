<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>후기게시판</h3>
<br><br>
<table border="1" align="center">
<tr>
	<td colspan="6">
		<form action="epiloguesearch">
			<select name="selectname1">
		  		<option value="gohome">　귀가　</option>
		  		<option value="rehome">　분양　</option>
		  	</select>
			<select name="selectname2">
		  		<option value="ep_title">　제목　</option>
		  		<option value="mem_nickname">　작성자　</option>
		  	</select>
			<input type="text" name="searchname">
			<input type="submit" value="검색">
		</form>
	</td></tr>
<tr>
	<th>　글번호　</th>
	<th>　구분　</th>
	<th>　제목　</th>
	<th>　작성자　</th>
	<th>　작성일자　</th>
	<th>　조회수　</th>
<c:forEach items="${epiloguelist }" var="e">
<tr>
	<th>　${e.ep_no }　</th>
	<th>　${e.ep_gb }　</th>
	<th><a href="epiloguedetail?ep_no=${e.ep_no }">${e.ep_title }　</a></th>
	<th>　${e.mem_nickname }　</th>
	<th>　<fmt:parseDate value="${e.ep_writeday }" var="writedaydate" pattern="yyyy-MM-dd HH:mm:ss"/>
		<fmt:formatDate value="${writedaydate }" var="writedaystring" pattern="yyyy-MM-dd HH:mm"/>
		${writedaystring }　</th>
	<th>　${e.ep_readcount }　</th>
</c:forEach>
</table>
</body>
</html>