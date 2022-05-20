<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<section>

<h4><B><font color="#fdafab">귀가 완료 게시판</font></B></h4>
<h6><B>이곳에 있는 아이들은 귀가 완료된 아이들입니다</B></h6>
<h6><B>따뜻한 관심 감사합니다 🐶😻</B></h6>
<br><br>

<table border="0" align="center" width="700">
<tr>
	<td>
		<c:forEach var="mic" begin="0" end="${fn:length(missingend)-1}" step="1">
		<div class="container">
			<div class="row">
				<div class="col-md-4">
					<div class="thumbnail">
						<p align="left"><B>구분</B>　[${missingend[mic].mis_gb2 }/${missingend[mic].mis_gb2 }] </p>
						<p align="left"><B>제목</B>　${missingend[mic].mis_title } </p>
							<fmt:parseDate value="${missing[mic].mis_writeday }" var="writedaydate" pattern="yyyy-MM-dd HH:mm:ss"/>
							<fmt:formatDate value="${writedaydate }" var="writedaystring" pattern="yyyy-MM-dd HH:mm"/>
						<p align="left"><B>일자</B>　${writedaystring } </p>
						<a href="missingdetail?mis_no=${missingend[mic].mis_no }">
						<img src="${pageContext.request.contextPath}/image/${missingend[mic].mis_image }" style="width: 200px; height: 200px;">
				<div class="caption">
					<p><B>${missingend[mic].mem_nickname }</B></p>
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