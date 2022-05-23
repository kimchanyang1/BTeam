<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>분양/임시보호 완료 목록</title>
</head>
<body>

<h4><B><font color="#fdafab">분양 완료 게시판</font></B></h4>
<h6><B>이곳에 있는 아이들은 분양이 완료된 아이들입니다</B></h6>
<h6><B>따뜻한 관심 감사합니다 🐶😻</B></h6>
<br><br>

<table border="0" align="center" width="700">
<tr>
	<td>
	<c:if test="${fn:length(rehomeEndList) > 0}">
	<c:forEach var="rd" begin="0" end="${fn:length(rehomeEndList)-1}" step="1">
	<div class="container">
		<div class="row">
			<div class="col-md-4">
				<div class="thumbnail">
					<p align="left"><B>구분</B>　[${rehomeEndList[rd].rh_gb2 }/${rehomeEndList[rd].rh_gb3 }] </p>
					<p align="left"><B>제목</B>　${rehomeEndList[rd].rh_title } </p>
						<fmt:parseDate value="${rehomeEndList[rd].rh_writeday }" var="writedaydate" pattern="yyyy-MM-dd HH:mm:ss"/>
						<fmt:formatDate value="${writedaydate }" var="writedaystring" pattern="yyyy-MM-dd HH:mm"/>
					<p align="left"><B>일자</B>　${writedaystring } </p>
					<a href="rehomedetail?rh_no=${rehomeEndList[rd].rh_no }">
					<img src="${pageContext.request.contextPath}/image/${rehomeEndList[rd].rh_image }" style="width: 200px; height: 200px;">
				<div class="caption">
					<p><B>${rehomeEndList[rd].mem_nickname }</B></p>
				</div>
				</a>	
				</div>
			</div>
	<c:if test="${e%3 eq 2}">
	</td>
</tr>
<tr>
	<td>
	</c:if>
	</c:forEach>
	</c:if>
	<tr>
		<th colspan="5">
			<c:if test="${page.startPage != 1}">
				<a href="rehomeEndPage?nowPage=1">&lt;&lt;</a>
			</c:if>
			<c:if test="${page.startPage != 1}">
				<a href="rehomeEndPage?nowPage=${page.startPage - 1}">&lt;</a>
			</c:if>
			<c:forEach begin="${page.startPage}" end="${page.endPage}" step="1" var="i">
				<c:choose>
					<c:when test="${i eq page.nowPage}">${i}</c:when>
					<c:otherwise><a href="rehomeEndPage?nowPage=${i}">${i}</a></c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${page.endPage != page.lastPage}">
				<a href="rehomeEndPage?nowPage=${page.endPage + 1}">&gt;</a>
			</c:if>
			<c:if test="${page.endPage != page.lastPage}">
				<a href="rehomeEndPage?nowPage=${page.lastPage}">&gt;&gt;</a>
			</c:if>
		</th>
	</tr>
</table>

</body>
</html>