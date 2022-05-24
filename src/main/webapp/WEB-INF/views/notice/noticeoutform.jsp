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
		<th>　${data.nt_no}　</th>
		<th>
			<a href="noticedetail?nt_no=${data.nt_no}">
				<input id="title" type="text" value="　${data.nt_title}" style="cursor: pointer;" readonly="readonly"></a></th>
		<th>　${data.mem_nickname}　</th>
		<th>　<fmt:parseDate value="${data.nt_writeday}" var="writedaydate" pattern="yyyy-MM-dd HH:mm:ss"/>
			<fmt:formatDate value="${writedaydate }" var="writedaystring" pattern="yy-MM-dd HH:mm"/>
			${writedaystring }　</th>
		<th>　${data.nt_readcount}　</th>
	</tr>
	</c:forEach>
	<tr>
		<th colspan="5">　　</th></tr>
	<tr>
		<th colspan="5">
			<c:if test="${page.startPage != 1}">
				<a href="noticeoutform?nowPage=1"><i class="fas fa-angle-double-left" style="font-size:18px;"></i></a>
			</c:if>
			<c:if test="${page.startPage != 1}">
				<a href="noticeoutform?nowPage=${page.startPage - 1}"><i class="fas fa-angle-left" style="font-size:18px;"></i></a>
			</c:if>
			<c:forEach begin="${page.startPage}" end="${page.endPage}" step="1" var="i">
				<c:choose>
					<c:when test="${i eq page.nowPage}">
						<font color="#ff8000"><B> 　${i}　</B></font>
					</c:when>
					<c:otherwise><a href="noticeoutform?nowPage=${i}">　${i}　</a></c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${page.endPage != page.lastPage}">
				<a href="noticeoutform?nowPage=${page.endPage + 1}"><i class="fas fa-angle-right" style="font-size:18px;"></i></a>
			</c:if>
			<c:if test="${page.endPage != page.lastPage}">
				<a href="noticeoutform?nowPage=${page.lastPage}"><i class="fas fa-angle-double-right" style="font-size:18px;"></i></a>
			</c:if>
		</th>
	</tr>
</table>

</body>
</html>