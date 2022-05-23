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
	height: 35px;
}
td {
	height: 35px;
}
table {
	border-spacing: 5px;
	border-collapse: separate;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h4><B><font color="#fdafab">자유게시판</font></B></h4>
<h6><B>자유롭고 깨끗하게 사용해 주세요</B></h6>
<h6><B><font color="red">* 글쓰기는 로그인 후 가능합니다</font></B></h6>
<br><br>

<table border="0" align="center" width="800">
<tr>
	<td colspan="6" align="left">
		<c:if test="${logon eq true && mem_no != null}">
			<button onclick="location.href='boardinputform'"><B>글쓰기</B></button>
		</c:if>
	</td>
</tr>
</table>
<table border="0" align="center" width="800">
<tr>
	<th>　글번호　</th>
	<th>　제목　</th>
	<th>　작성자　</th>
	<th>　작성일자　</th>
	<th>　조회수　</th>
	<th>　추천수　</th>
</tr>	
<c:forEach items="${boardlist}" var="b">
<tr>
	<th>　${b.bd_no}　</th>
	<th>
		<a href="boarddetail?bd_no=${b.bd_no }">
			<input id="title" type="text" value="　${b.bd_title }" readonly="readonly" style="cursor: pointer;"></a></th>
	<th>　${b.mem_nickname }　</th>
	<th>　<fmt:parseDate value="${b.bd_writeday }" var="writedaydate" pattern="yyyy-MM-dd HH:mm:ss"/>
		<fmt:formatDate value="${writedaydate }" var="writedaystring" pattern="yy-MM-dd HH:mm"/>
		${writedaystring }　</th>
	<th>　${b.bd_readcount }　</th>
	<th>　${b.bd_likes }　</th>
</tr>
</c:forEach>
</table>
<br><br>

<table border="0" align="center" width="700">
	<tr>
		<th colspan="6">
			<form action="boardsearch">
				<select name="selectname">
			  		<option value="bd_title">　제목　</option>
			  		<option value="mem_nickname">　작성자　</option>
			  	</select>
				<input type="text" name="searchname">
				<input type="submit" value="검색">
			</form>
		</th>
	</tr>
	<tr>
		<th colspan="5">
			<c:if test="${page.startPage != 1}">
				<a href="boardpage?nowPage=1">&lt;&lt;</a>
			</c:if>
			<c:if test="${page.startPage != 1}">
				<a href="boardpage?nowPage=${page.startPage - 1}">&lt;</a>
			</c:if>
			<c:forEach begin="${page.startPage}" end="${page.endPage}" step="1" var="i">
				<c:choose>
					<c:when test="${i eq page.nowPage}">${i}</c:when>
					<c:otherwise><a href="boardpage?nowPage=${i}">${i}</a></c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${page.endPage != page.lastPage}">
				<a href="boardpage?nowPage=${page.endPage + 1}">&gt;</a>
			</c:if>
			<c:if test="${page.endPage != page.lastPage}">
				<a href="boardpage?nowPage=${page.lastPage}">&gt;&gt;</a>
			</c:if>
		</th>
	</tr>
</table>

</body>
</html>