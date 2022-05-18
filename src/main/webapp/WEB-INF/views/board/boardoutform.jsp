<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
th {
text-align: center;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<section>
<h4><B><font color="#fdafab">자유게시판</font></B></h4>
<h6><B><font color="red">* 글쓰기는 로그인 후 가능합니다.</font></B></h6>
<br><br>
<table border="0" align="center" width="700">
<tr>
	<td colspan="6" align="left">
		<c:if test="${logon eq true && mem_no != null}">
			<button onclick="location.href='boardinputform'">글쓰기</button>
		</c:if>
	</td>
</tr>
<tr>
	<td colspan="6">　　</td></tr>
<tr>
	<td colspan="6">　　</td></tr>
<tr>
	<td colspan="6">　　</td></tr>
<tr>
	<th>　글번호　</th>
	<th>　제목　</th>
	<th>　작성자　</th>
	<th>　작성일자　</th>
	<th>　조회수　</th>
	<th>　추천수　</th></tr>
<tr>
	<td colspan="6">　　</td></tr>	
<c:forEach items="${boardlist }" var="b">
<tr>
	<th>　${b.bd_no }　</th>
	<th>
		<a href="boarddetail?bd_no=${b.bd_no }">
			<input type="text" value="　${b.bd_title }"></a></th>
	<th>　${b.mem_nickname }　</th>
	<th>　<fmt:parseDate value="${b.bd_writeday }" var="writedaydate" pattern="yyyy-MM-dd HH:mm:ss"/>
		<fmt:formatDate value="${writedaydate }" var="writedaystring" pattern="yy-MM-dd HH:mm"/>
		${writedaystring }　</th>
	<th>　${b.bd_readcount }　</th>
	<th>　${b.bd_likes }　</th></tr>
</c:forEach>
</table>
<br>
<br>
<table border="0" align="center" width="700">
<tr>
	<td colspan="6">　　</td></tr>
<tr>
	<td colspan="6">
		<form action="boardsearch">
			<select name="selectname">
		  		<option value="bd_title">　제목　</option>
		  		<option value="mem_nickname">　작성자　</option>
		  	</select>
			<input type="text" name="searchname">
			<input type="submit" value="검색">
		</form>
	</td>
</tr>
</table>
</section>
</body>
</html>