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
	<th>　작성자　</th>
	<th>　제목　</th>
	<th>　작성일자　</th>
	<th>　조회수　</th>
</tr>	
	<c:forEach items="${noticelist}" var="data">
<tr>
	<th>　${data.nt_no}　</th>
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
</table>

</body>
</html>