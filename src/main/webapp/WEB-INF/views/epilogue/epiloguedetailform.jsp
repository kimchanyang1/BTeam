<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>후기게시판</h3>
<br><br>
<table border="1" align="center" width="600">
<c:forEach items="${epiloguedetail }" var="e">
<tr>
	<th>　구분　</th>
	<td><input type="text" value="${e.ep_gb}" readonly="readonly"></td></tr>
<tr>
	<th>　글번호　</th>
	<td><input type="text" name="ep_no" value="${e.ep_no}" readonly="readonly"></td></tr>
<tr>
	<th>　작성자　</th>
	<td><input type="text" value="${e.mem_nickname}" readonly="readonly"></td></tr>
<tr>
	<th>　조회수　</th>
	<td><input type="text" value="${e.ep_readcount}" readonly="readonly"></td></tr>	
<tr>
	<th>　작성일자　</th>
	<td><!-- a hh: 오전/오후　　HH: 24시 기준 -->
		<fmt:parseDate value="${e.ep_writeday }" var="writedaydate" pattern="yyyy-MM-dd HH:mm:ss"/>
		<fmt:formatDate value="${writedaydate }" var="writedaystring" pattern="yyyy-MM-dd HH:mm"/>
		<input type="text" value="${writedaystring }" readonly="readonly">
	</td></tr>
<tr>
	<th>　제목　</th>
	<td><input type="text" value="${e.ep_title }" readonly="readonly"></td></tr>
<tr>
	<th>　이미지　</th>
	<td><img src="${pageContext.request.contextPath}/image/${e.ep_image}"></td></tr>
<tr>
	<th>　내용　</th>
	<td><textarea readonly="readonly">${e.ep_content }</textarea></td></tr>	
<tr>
	<td colspan="2" align="center">　　
		<input type="hidden" value="${e.mem_no }" readonly="readonly">
		<input type="hidden" name="mem_no" value="${mem_no }" readonly="readonly"></td></tr>
<tr>
	<td colspan="2" align="center">　　
		<input type="hidden" name="mem_nickname" value="${mem_nickname }" readonly="readonly"></td></tr>
<tr>
	<td colspan="2" align="right">
		<c:if test="${e.mem_no eq mem_no || mem_id eq 'admin'}">
			<button onclick="location.href='epiloguemodifyselect?ep_no=${e.ep_no }&mem_no=${mem_no }&mem_nickname=${mem_nickname }'">수정</button>
			<button onclick="location.href='epiloguedelete?ep_no=${e.ep_no }'">삭제</button>
		</c:if>
	</td></tr>
</c:forEach>
</table>
</body>
</html>