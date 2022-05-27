<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>임시보호/분양 완료 목록</title>
</head>
<body>

<h4><B><font color="#fdafab">분양 완료 게시판</font></B></h4>
<h6><B>이곳에 있는 아이들은 분양이 완료된 아이들입니다</B></h6>
<h6><B>따뜻한 관심 감사합니다 🐶😻</B></h6>
<br><br>

<div class="container" align="center" width="700">
	<div class="row">
		<c:forEach var="rd" items="${rehomeEndList}">	
			<div class="col-md-4">
				<div class="thumbnail" style="cursor: pointer;" onclick="location.href='rehomedetail?rh_no=${rd.rh_no}'">
					<p align="left"><B>구분</B>　[${rd.rh_gb2 }/${rd.rh_gb3 }] </p>
					<p align="left"><B>제목</B>　${rd.rh_title } </p>
						<fmt:parseDate value="${rd.rh_writeday }" var="writedaydate" pattern="yyyy-MM-dd HH:mm:ss"/>
						<fmt:formatDate value="${writedaydate }" var="writedaystring" pattern="yyyy-MM-dd HH:mm"/>
					<p align="left"><B>일자</B>　${writedaystring } </p>
					<img src="${pageContext.request.contextPath}/image/${rd.rh_image }" style="width: 200px; height: 200px;">
					<div class="caption">
						<p><B>${rd.mem_nickname }</B></p>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
	<c:if test="${page.startPage != 1}">
		<a href="rehomeend?nowPage=1"><i class="fas fa-angle-double-left" style="font-size:18px;"></i></a>
	</c:if>           
	<c:if test="${page.startPage != 1 }">
		<a href="rehomeend?nowPage=${page.startPage - 1}"><i class="fas fa-angle-left" style="font-size:18px;"></i></a>
	</c:if>
	<c:forEach begin="${page.startPage }" end="${page.endPage }" var="i">
		<c:choose>
			<c:when test="${page.nowPage eq i}">
				<font color="#ff8000"><B>　${i}　</B></font>
			</c:when>
			<c:otherwise>
				<a href="rehomeend?nowPage=${i}">　${i}　</a>
			</c:otherwise>      		
		</c:choose>        	
	</c:forEach>
	<c:if test="${page.endPage != page.lastPage}">
		<a  href="rehomeend?nowPage=${page.endPage+1 }&cntPerPage=${page.cntPerPage}"><i class="fas fa-angle-right" style="font-size:18px;"></i></a>
	</c:if>
	<c:if test="${page.endPage != page.lastPage}">
		<a href="rehomeend?nowPage=${page.lastPage}"><i class="fas fa-angle-double-right" style="font-size:18px;"></i></a>
	</c:if>
</div>
</body>
</html>