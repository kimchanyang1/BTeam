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
<title>관리자 페이지 - 회원 관리 목록</title>
</head>
<body>

<h4><B><font color="#fdafab">회원 관리 목록</font></B></h4>
<br><br>

<table border="0" align="center" width="800">
<tr>
	<th>　회원번호　</th>
	<th>　아이디　</th>
	<th>　이름　</th>
	<th>　닉네임　</th>
	<th>　나이　</th>
	<th>　성별　</th>
</tr>	
<c:forEach items="${ADmemberList}" var="am">
<tr>
	<th>　${am.mem_no }　</th>
	<th>
		<a href="ADmemberdetail?mem_no=${am.mem_no }">
			<input id="title" type="text" value="　${am.mem_id }" readonly="readonly" style="cursor: pointer;">
		</a>
	</th>
	<th>　${am.mem_name }　</th>
	<th>　${am.mem_nickname }　</th>
	<th>　
	<c:choose>
		<c:when test="${am.age eq -1}">NULL</c:when>
		<c:when test="${am.age eq -2}">SHOTR</c:when>
		<c:otherwise>${am.age}</c:otherwise>
	</c:choose>
	　</th>
	<th>　${am.gender} </th>
</tr>
</c:forEach>
	<tr>
		<th colspan="5">
			<c:if test="${page.startPage != 1}">
				<a href="ADmemberPage?nowPage=1">&lt;&lt;</a>
			</c:if>
			<c:if test="${page.startPage != 1}">
				<a href="ADmemberPage?nowPage=${page.startPage - 1}">&lt;</a>
			</c:if>
			<c:forEach begin="${page.startPage}" end="${page.endPage}" step="1" var="i">
				<c:choose>
					<c:when test="${i eq page.nowPage}">${i}</c:when>
					<c:otherwise><a href="ADmemberPage?nowPage=${i}">${i}</a></c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${page.endPage != page.lastPage}">
				<a href="ADmemberPage?nowPage=${page.endPage + 1}">&gt;</a>
			</c:if>
			<c:if test="${page.endPage != page.lastPage}">
				<a href="ADmemberPage?nowPage=${page.lastPage}">&gt;&gt;</a>
			</c:if>
		</th>
	</tr>
</table>
<br><br>

<table border="0" align="center" width="700">
<tr>
	<th colspan="6">
		<form action="ADmembersearch">
			<select name="selectname">
		  		<option value="mem_id">　아이디　</option>
		  		<option value="mem_name">　이름　</option>
		  		<option value="mem_nickname">　닉네임　</option>
		  	</select>
			<input type="text" name="searchname">
			<input type="submit" value="검색">
		</form>
	</th>
</tr>
</table>

</body>
</html>