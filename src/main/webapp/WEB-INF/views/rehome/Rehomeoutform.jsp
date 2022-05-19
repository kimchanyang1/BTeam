<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>분양/임시보호</title>
</head>
<body>

<h4><B><font color="#fdafab">임시분양/보호 게시판</font></B></h4>
<h6><B>임시분양자 또는 분양자를 구하는 게시판입니다</B></h6>
<h6><B><font color="red">* 글쓰기는 로그인 후 가능합니다</font></B></h6>
<br><br>

<form action="rehomesearch" method="post">
<table border="0" align="center" width="500">
	<tr>
		<td colspan="3">
			<input type="checkbox" name="gb2" value="임보"> 임보 &emsp;
			<input type="checkbox" name="gb2" value="분양"> 분양 &emsp;
			<input type="checkbox" name="gb3" value="개"> 개 &emsp;
			<input type="checkbox" name="gb3" value="고양이"> 고양이 &emsp;
		</td>
	</tr>
	<tr>
		<td>　발견장소　</td>
		<td><input type="text" name="sword"></td>
		<td><B><input type="submit" value="조회"></B></td>
	</tr>
</table>
</form>

<table border="0" align="center" width="700">
<tr>
	<td align="left">
		<c:if test="${logon eq true && mem_no != null}">　
			<button onclick="location.href='rehomeinputform'"><B>글쓰기</B></button>
		</c:if>
	</td>
</tr>
<tr>
	<td colspan="6">　　</td></tr>
<tr>
	<td colspan="6">　　</td></tr>
<tr>
	<td>
	<c:forEach var="rd" begin="0" end="${fn:length(rdto)-1}" step="1">
	<div class="container">
		<div class="row">
			<div class="col-md-4">
				<div class="thumbnail">
					<p align="left"><B>구분</B>　[${rdto[rd].rh_gb2 }/${rdto[rd].rh_gb3 }] </p>
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
</table>

</body>
</html>