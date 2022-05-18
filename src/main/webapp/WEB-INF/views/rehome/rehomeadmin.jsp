<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>분양/임시보호 관리자 페이지</title>
</head>
<body>
<section>

<h4><B><font color="#fdafab">관리자 전용 분양 완료 게시판</font></B></h4>
<h6><B><font color="red">관리자 전용 게시판입니다</font><br>
승인할 시, 분양/임시보호 게시판으로 글이 이동합니다</B></h6>
<br><br>
<table border="0" align="center" width="700">
<tr>
	<td>
	<c:forEach var="rd" begin="0" end="${fn:length(rdto)-1}" step="1">
	<div class="container">
		<div class="row">
			<div class="col-md-4">
				<div class="thumbnail">
					<p align="left"><B>구분　<font color="red">${rdto[rd].rh_gb1 } </font></B></p>
					<p align="left"><B>제목</B>　${rdto[rd].rh_title } </p>
						<fmt:parseDate value="${rdto[rd].rh_writeday }" var="writedaydate" pattern="yyyy-MM-dd HH:mm:ss"/>
						<fmt:formatDate value="${writedaydate }" var="writedaystring" pattern="yyyy-MM-dd HH:mm"/>
					<p align="left"><B>일자</B>　${writedaystring } </p>
					<a href="rehomedetail?rh_no=${rdto[rd].rh_no }">
					<img src="${pageContext.request.contextPath}/image/${rdto[rd].rh_image }" style="width: 200px; height: 200px;">
				<div class="caption">
					<p><B>${rdto[rd].mem_nickname }</B></p>
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
</section>
</body>
</html>