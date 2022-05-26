<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>

<div>
	<h3>실종</h3>
	<table border="0" align="center" width="700">
		<tr>
			<td>
				<c:if test="${fn:length(missingout) > 0}">
				<c:forEach var="mic" begin="0" end="2" step="1">		
				<div class="container">
					<div class="row">
						<div class="col-md-4">
							<a href="missingdetail?mis_no=${missingout[mic].mis_no}">
								<div class="thumbnail" style="cursor: pointer;">
									<p align="left"><B>제목</B>　${missingout[mic].mis_title } </p>
										<fmt:parseDate value="${missingout[mic].mis_writeday }" var="writedaydate" pattern="yyyy-MM-dd HH:mm:ss"/>
										<fmt:formatDate value="${writedaydate }" var="writedaystring" pattern="yyyy-MM-dd HH:mm"/>
									<p align="left"><B>일자</B>　${writedaystring } </p>
								 		<img src="${pageContext.request.contextPath}/image/${missingout[mic].mis_image}" style="width: 200px; height: 200px;">	
									<div class="caption">
										<p><B>${missingout[mic].mem_nickname}</B></p>
									</div>
								</div>
							</a>
						</div>
					<c:if test="${e%3 eq 2}">
			</td>
		</tr>
					</c:if>
				</c:forEach>
				</c:if>
	</table>
</div>

<div>
	<h3>임시보호/분양</h3>
	<table border="0" align="center" width="700">
		<tr>
			<td>
			<c:if test="${fn:length(rdto) > 0}">
			<c:forEach var="rd" begin="0" end="2" step="1">
			<div class="container">
				<div class="row">
					<div class="col-md-4">
						<a href="rehomedetail?rh_no=${rdto[rd].rh_no}">
							<div class="thumbnail" style="cursor: pointer;">
								<p align="left"><B>구분</B>　[${rdto[rd].rh_gb2 }/${rdto[rd].rh_gb3 }] </p>
								<p align="left"><B>제목</B>　${rdto[rd].rh_title } </p>
									<fmt:parseDate value="${rdto[rd].rh_writeday }" var="writedaydate" pattern="yyyy-MM-dd HH:mm:ss"/>
									<fmt:formatDate value="${writedaydate }" var="writedaystring" pattern="yyyy-MM-dd HH:mm"/>
								<p align="left"><B>일자</B>　${writedaystring } </p>
									<img src="${pageContext.request.contextPath}/image/${rdto[rd].rh_image }" style="width: 200px; height: 200px;">
								<div class="caption">
									<p><B>${rdto[rd].mem_nickname }</B></p>
								</div>
							</div>
						</a>
					</div>
				<c:if test="${e%3 eq 2}">
			</td>
		</tr>
				</c:if>
			</c:forEach>
			</c:if>
	</table>
</div>

<div>
	<h3>자유게시판 인기글</h3>
	<table border="0" align="center" width="800">
		<tr>
			<th>　글번호　</th>
			<th>　제목　</th>
			<th>　작성자　</th>
			<th>　작성일자　</th>
			<th>　조회수　</th>
			<th>　추천수　</th>
		</tr>	
		<c:forEach items="${boardlist}" var="b" begin="0" end="4">
		<tr>
			<th>　${b.bd_no}　</th>
			<th>
				<a href="boarddetail?bd_no=${b.bd_no }">
					<input id="title" type="text" value="　${b.bd_title }" readonly="readonly" style="cursor: pointer;"></a></th>
			<th>　${b.mem_nickname }　</th>
			<th>　<fmt:parseDate value="${b.bd_writeday }" var="writedaydate" pattern="yyyy-MM-dd HH:mm:ss"/>
				<fmt:formatDate value="${writedaydate }" var="writedaystring" pattern="yy-MM-dd HH:mm"/>
				${writedaystring }　</th>
			<th>　${b.bd_readcount }　</th>
			<th>　${b.bd_likes }　</th>
		</tr>
		</c:forEach>
	</table>
</div>

</body>
</html>
