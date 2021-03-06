<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>임시보호/분양</title>
</head>
<body>

<h4><B><font color="#fdafab">임시보호/분양 게시판</font></B></h4>
<h6><B>임시보호자 또는 분양자를 구하는 게시판입니다</B></h6>
<h6><B><font color="red">* 글쓰기는 로그인 후 가능합니다</font></B></h6>
<br><br>

<form action="rehomesearch" method="post">
<table border="0" align="center" width="500">
	<tr>
		<td colspan="3">
			<label><input type="checkbox" name="gb2" value="임시보호"> 임시보호</label> &emsp;
			<label><input type="checkbox" name="gb2" value="분양"> 분양</label> &emsp;
			<label><input type="checkbox" name="gb3" value="개"> 개</label> &emsp;
			<label><input type="checkbox" name="gb3" value="고양이"> 고양이</label> &emsp;
		</td>
	</tr>
	<tr>
		<td>　발견장소　</td>
		<td><input type="text" name="sword"></td>
		<td><B><input type="submit" value="조회"></B></td>
	</tr>
</table>
</form>

<br><br>
<div class="container">
	<div style="text-align: left;">
	<c:if test="${logon eq true && mem_no != null}">　
		<button onclick="location.href='rehomeinputform'"><B>글쓰기</B></button>
	</c:if>
	</div>
<br>
	<div class="row">
		<c:forEach items="${rdto}" var="rd">
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
	<c:if test="${paging.startPage != 1}">
		<a href="rehomeoutform?nowPage=1"><i class="fas fa-angle-double-left" style="font-size:18px;"></i></a>
	</c:if>           
	<c:if test="${paging.startPage != 1 }">
		<a href="rehomeoutform?nowPage=${paging.startPage - 1}"><i class="fas fa-angle-left" style="font-size:18px;"></i></a>
	</c:if>
	<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="i">
		<c:choose>
			<c:when test="${paging.nowPage eq i}">
				<font color="#ff8000"><B>　${i}　</B></font>
			</c:when>
			<c:otherwise>
				<a href="rehomeoutform?nowPage=${i}">　${i}　</a>
			</c:otherwise>      		
		</c:choose>        	
	</c:forEach>
	<c:if test="${paging.endPage != paging.lastPage}">
		<a  href="rehomeoutform?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}"><i class="fas fa-angle-right" style="font-size:18px;"></i></a>
	</c:if>
	<c:if test="${paging.endPage != paging.lastPage}">
		<a href="rehomeoutform?nowPage=${page.lastPage}"><i class="fas fa-angle-double-right" style="font-size:18px;"></i></a>
	</c:if>
</div>
</body>
</html>