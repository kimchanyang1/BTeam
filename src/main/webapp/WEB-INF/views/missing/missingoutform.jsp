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
<h4><B><font color="#fdafab">실종신고 게시판</font></B></h4>
<h6><B>실종된 반려동물을 찾는 게시판입니다</B></h6>
<h6><B><font color="red">* 글쓰기는 로그인 후 가능합니다</font></B></h6>
<br><br>


<div class="container" align="center" width="700">
	<div>
		<c:if test="${logon eq true && mem_no != null}">
			<button onclick="location.href='missinginputform'"><B>글쓰기</B></button>
		</c:if>
	</div>
	<br><br>
	<div class="row">
		<c:forEach var="mic" items="${missingout}">	
		<div class="col-md-4">
			<div class="thumbnail" style="cursor: pointer;" onclick="location.href='missingdetail?mis_no=${mic.mis_no}'">
				<p align="left"><B>제목</B>　${mic.mis_title } </p>
					<fmt:parseDate value="${mic.mis_writeday }" var="writedaydate" pattern="yyyy-MM-dd HH:mm:ss"/>
					<fmt:formatDate value="${writedaydate }" var="writedaystring" pattern="yyyy-MM-dd HH:mm"/>
				<p align="left"><B>일자</B>　${writedaystring } </p>
			 		<img src="${pageContext.request.contextPath}/image/${mic.mis_image}" style="width: 200px; height: 200px;">	
				<div class="caption">
					<p><B>${mic.mem_nickname}</B></p>
				</div>
			</div>
		</div>
	</c:forEach>
	</div>
<c:if test="${paging.startPage != 0}">
	<c:if test="${paging.startPage != 1}">
		<a href="missingoutform?nowPage=1"><i class="fas fa-angle-double-left" style="font-size:18px;"></i></a>
	</c:if>           
	<c:if test="${paging.startPage != 1 }">
		<a href="missingoutform?nowPage=${paging.startPage - 1}"><i class="fas fa-angle-left" style="font-size:18px;"></i></a>
	</c:if>
	<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="i">
		<c:choose>
			<c:when test="${paging.nowPage eq i}">
				<font color="#ff8000"><B>　${i}　</B></font>
			</c:when>
			<c:otherwise>
				<a href="missingoutform?nowPage=${i}">　${i}　</a>
			</c:otherwise>      		
		</c:choose>        	
	</c:forEach>
	<c:if test="${paging.endPage != paging.lastPage}">
		<a  href="missingoutform?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}"><i class="fas fa-angle-right" style="font-size:18px;"></i></a>
	</c:if>
	<c:if test="${paging.endPage != paging.lastPage}">
		<a href="missingoutform?nowPage=${page.lastPage}"><i class="fas fa-angle-double-right" style="font-size:18px;"></i></a>
	</c:if>
</c:if>
</div>
</body>
</html>