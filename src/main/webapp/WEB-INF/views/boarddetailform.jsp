<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>자유게시판</h3>
<br><br>
<table border="1" align="center" width="600">
<c:forEach items="${boarddetail }" var="b">
<tr>
	<th>　글번호　</th>
	<td><input type="text" name="bd_no" value="${b.bd_no}" readonly="readonly"></td></tr>
<tr>
	<th>　작성자　</th>
	<td><input type="text" value="${b.mem_nickname}" readonly="readonly"></td></tr>
<tr>
	<th>　조회수　</th>
	<td><input type="text" value="${b.bd_readcount}" readonly="readonly"></td></tr>	
<tr>
	<th>　작성일자　</th>
	<td><input type="text" value="${b.bd_writeday}" readonly="readonly"></td></tr>
<tr>
	<th>　제목　</th>
	<td><input type="text" value="${b.bd_title }" readonly="readonly"></td></tr>
<tr>
	<th>　이미지　</th>
	<td><img src="${pageContext.request.contextPath}/image/${b.bd_image}"></td></tr>
<tr>
	<th>　내용　</th>
	<td><textarea readonly="readonly">${b.bd_content }</textarea></td></tr>	
<tr>
	<td colspan="2" align="center">　　
		<input type="hidden" value="${b.mem_no }" readonly="readonly">
		<input type="hidden" name="mem_no" value="${mem_no }" readonly="readonly"></td></tr>
<tr>
	<td colspan="2" align="center">　　
		<input type="hidden" name="mem_nickname" value="${mem_nickname }" readonly="readonly"></td></tr>
<tr>
	<td colspan="2" align="right">
		<button><a href="">추천</a></button>
		<c:set var="writername" value="${b.mem_no }"/>
		<c:set var="loginname" value="${mem_no }"/>
		<c:choose>	
			<c:when test="${writername eq loginname }">
				<button><a href="boardmodifyselect?bd_no=${b.bd_no }&mem_no=${mem_no }&mem_nickname=${mem_nickname }">수정</a></button>
				<button><a href="boarddelete?bd_no=${b.bd_no }">삭제</a></button>
			</c:when>
		</c:choose>
		</td></tr>
</c:forEach>
</table>
</body>
</html>