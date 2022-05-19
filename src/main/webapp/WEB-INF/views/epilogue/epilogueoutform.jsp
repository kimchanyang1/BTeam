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
<section>
<h4><B><font color="#fdafab">후기게시판</font></B></h4>
<h6><B><font color="red">* 글쓰기는 로그인 후 가능합니다.</font></B></h6>
<br><br>
<table border="0" align="center" width="700">
	<tr>
		<td>
<c:forEach var="e" begin="0" end="${fn:length(epiloguelist)-1}" step="1">
		<div class="container">
		  <div class="row">
		    <div class="col-md-4">
		      <div class="thumbnail">
		      <p align="left"><B>구분</B>　${epiloguelist[e].ep_gb } </p>
		      <p align="left"><B>제목</B>　${epiloguelist[e].ep_title } </p>
		       <a href="epiloguedetail?ep_no=${epiloguelist[e].ep_no }">
		          <img src="${pageContext.request.contextPath}/image/${epiloguelist[e].ep_image }" alt="Lights" style="width: 100px; height: 100px;">
		          <div class="caption">
		            <p>${epiloguelist[e].mem_nickname }</p>
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




<table border="1" align="center" width="700">
<tr>
	<th>　글번호　</th>
	<th>　구분　</th>
	<th>　제목　</th>
	<th>　작성자　</th>
	<th>　작성일자　</th>
	<th>　조회수　</th>
<c:forEach items="${epiloguelist }" var="e">
<tr>
	<th>　${e.ep_no }　</th>
	<th>　${e.ep_gb }　</th>
	<th><a href="epiloguedetail?ep_no=${e.ep_no }">${e.ep_title }　</a></th>
	<th>　${e.mem_nickname }　</th>
	<th>　<fmt:parseDate value="${e.ep_writeday }" var="writedaydate" pattern="yyyy-MM-dd HH:mm:ss"/>
		<fmt:formatDate value="${writedaydate }" var="writedaystring" pattern="yyyy-MM-dd HH:mm"/>
		${writedaystring }　</th>
	<th>　${e.ep_readcount }　</th>
</c:forEach>
</table>
<br><br>
<table border="1" align="center" width="700">
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
			<input type="submit" value="검색">
		</form>
	</td>
</tr>
</table>
</section>
</body>
</html>