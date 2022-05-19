<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h4><B><font color="#fdafab">후기게시판</font></B></h4>
<h6><B>분양이 완료된 아이들의 후기글이 올라오는 게시판입니다</B></h6>
<h6><B>🐶😻</B></h6>
<br><br>

<table border="0" align="center" width="700">
<tr>
	<td>
	<c:if test="${fn:length(epiloguelist) > 0}">
	<c:forEach var="e" begin="0" end="${fn:length(epiloguelist)-1}" step="1">
	<div class="container">
		<div class="row">
			<div class="col-md-4">
				<div class="thumbnail">
					<p align="left"><B>구분</B>　${epiloguelist[e].ep_gb } </p>
					<p align="left"><B>제목</B>　${epiloguelist[e].ep_title } </p>
						<fmt:parseDate value="${epiloguelist[e].ep_writeday }" var="writedaydate" pattern="yyyy-MM-dd HH:mm:ss"/>
						<fmt:formatDate value="${writedaydate }" var="writedaystring" pattern="yyyy-MM-dd HH:mm"/>
					<p align="left"><B>일자</B>　${writedaystring } </p>
					<a href="epiloguedetail?ep_no=${epiloguelist[e].ep_no }">
					<img src="${pageContext.request.contextPath}/image/${epiloguelist[e].ep_image }" style="width: 200px; height: 200px;">
				<div class="caption">
					<p><B>${epiloguelist[e].mem_nickname }</B></p>
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
</table>

<br><br>

<table border="0" align="center" width="700">
<tr>
	<td colspan="6" align="center">
		<form action="epiloguesearch">
			<select name="selectname1">
		  		<option value="gohome">　귀가　</option>
		  		<option value="rehome">　분양　</option>
		  	</select>
			<select name="selectname2">
		  		<option value="ep_title">　제목　</option>
		  		<option value="mem_nickname">　작성자　</option>
		  	</select>
			<input type="text" name="searchname">
			<B><input type="submit" value="검색"></B>
		</form>
	</td>
</tr>
</table>

</body>
</html>