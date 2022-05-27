<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h5><B>인기 게시글 한 눈에 보기</B></h5>
<h3><B>지금 사람들은 이 게시글에 주목하고 있어요!</B></h3>

<br><br><br><br><br>

<div>
	<h4><B><font color="#fdafab">🌸 실종 게시판 🌸</font></B></h4><br>
	<div class="container" style="margin: auto;" width="700">
		<div class="row">
			<c:if test="${fn:length(missingout) > 0}">
			<c:forEach var="mic" begin="0" end="2" step="1">	
				<div class="col-md-4">
					<div class="thumbnail" style="cursor: pointer;" onclick="location.href='missingdetail?mis_no=${missingout[mic].mis_no}'">
						<p align="left"><B>제목</B>　${missingout[mic].mis_title } </p>
							<fmt:parseDate value="${missingout[mic].mis_writeday }" var="writedaydate" pattern="yyyy-MM-dd HH:mm:ss"/>
							<fmt:formatDate value="${writedaydate }" var="writedaystring" pattern="yyyy-MM-dd HH:mm"/>
						<p align="left"><B>일자</B>　${writedaystring } </p>
					 		<img src="${pageContext.request.contextPath}/image/${missingout[mic].mis_image}" style="width: 200px; height: 200px;">	
						<div class="caption">
							<p><B>${missingout[mic].mem_nickname}</B></p>
						</div>
					</div>
				</div>
			</c:forEach>
			</c:if>
		</div>
	</div>
</div>

<br><br><br><br><br>

<div>
	<h4><B><font color="#fdafab">🌸 임시보호/분양 게시판 🌸</font></B></h4><br>
	<div class="container">
		<div class="row">
			<c:forEach var="rd" items="${rdto}" begin="0" end="2">
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
	</div>
</div>

<br><br><br><br><br>

<div>
	<h4><B><font color="#fdafab">🌸 자유게시판 🌸</font></B></h4><br>
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
