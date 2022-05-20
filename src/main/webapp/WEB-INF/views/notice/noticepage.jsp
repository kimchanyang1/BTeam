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
	text-align: left;
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

<h4><B><font color="#fdafab">공지게시판</font></B></h4>
<h6><B>　　</B></h6>
<h6><B><font color="red">　　</font></B></h6>
<br><br>

<table border="0" align="center" width="800">
<tr>
	<td colspan="6" align="left">
		<c:if test="${mem_id eq 'admin'}">
			<button onclick="location.href='noticeinputform'"><B>글쓰기</B></button>
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
	</tr>	
		<c:forEach items="${noticeList}" var="data">
	<tr>
		<th>　${data.rn}　</th>
		<th>
			<a href="noticedetail?nt_no=${data.nt_no}">
				<input id="title" type="text" value="　${data.nt_title}"></a></th>
		<th>　${data.mem_nickname}　</th>
		<th>　<fmt:parseDate value="${data.nt_writeday}" var="writedaydate" pattern="yyyy-MM-dd HH:mm:ss"/>
			<fmt:formatDate value="${writedaydate }" var="writedaystring" pattern="yy-MM-dd HH:mm"/>
			${writedaystring }　</th>
		<th>　${data.nt_readcount}　</th>
	</tr>
	</c:forEach>
	<tr>
		<th colspan="5">
			<c:if test="${page.startPage != 1}">
				<a href="NoticePage?nowPage=1">&lt;&lt;</a>
			</c:if>
			<c:if test="${page.startPage != 1}">
				<a href="NoticePage?nowPage=${page.startPage - 1}">&lt;</a>
			</c:if>
			<c:forEach begin="${page.startPage}" end="${page.endPage}" step="1" var="i">
				<c:choose>
					<c:when test="${i eq page.nowPage}">${i}</c:when>
					<c:otherwise><a href="NoticePage?nowPage=${i}">${i}</a></c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${page.endPage != page.lastPage}">
				<a href="NoticePage?nowPage=${page.endPage + 1}">&gt;</a>
			</c:if>
			<c:if test="${page.endPage != page.lastPage}">
				<a href="NoticePage?nowPage=${page.lastPage}">&gt;&gt;</a>
			</c:if>
		</th>
	</tr>
</table>

</body>
</html>