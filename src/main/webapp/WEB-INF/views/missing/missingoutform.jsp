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
<link href="./resources/css/style.css" rel="stylesheet" />
</head>

<body>
<section style="overflow:auto; overflow-x:hidden; height: 700px">
<h4><B><font color="#fdafab">실종신고게시판</font></B></h4>
<h6><B>실종된 반려동물을 찾는 게시판입니다</B></h6>
<h6><B><font color="red">* 글쓰기는 로그인 후 가능합니다</font></B></h6>
<br><br>

<table border="0"  align="center" width="500">
	<tr>
		<td>
			<c:if test="${logon eq true && mem_no != null}">
			<a href="missinginputform"><input type="button" value="글 작성"></a>
			</c:if>
		</td>
	</tr>

	<tr>
		<td>
		<c:forEach var="mic" begin="0" end="${fn:length(missingout)-1}" step="1">		
		<div class="container">
			<div class="row">
			<div class="col-md-4">
				<div class="thumbnail">
				<p align="left"><B>제목</B>　${missingout[mic].mis_title } </p>
					<fmt:parseDate value="${missingout[mic].mis_writeday }" var="writedaydate" pattern="yyyy-MM-dd HH:mm:ss"/>
					<fmt:formatDate value="${writedaydate }" var="writedaystring" pattern="yyyy-MM-dd HH:mm"/>
				<p align="left"><B>일자</B>　${writedaystring } </p>
				<a href="missingdetail?mis_no=${missingout[mic].mis_no}">
			 		<img src="${pageContext.request.contextPath}/image/${missingout[mic].mis_image}" style="width: 200px; height: 200px;">	
				<div class="caption">
					<p><B>${missingout[mic].mem_nickname }</B></p>
				</div>
				</a>
				</div>
			</div>
		<c:if test="${e%3 eq 2}">
		</td>
	</tr>
		</c:if>
		</c:forEach>
	</tbody>

</table>
</section>
</body>
</html>