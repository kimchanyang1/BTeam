<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
table {
	border-spacing: 10px;
	border-collapse: separate;
}
textarea {
	line-height: 150%;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body oncontextmenu='return false' onselectstart='return false' ondragstart='return false'>

<h4><B><font color="#fdafab">자유게시판</font></B></h4>
<br><br>

<table border="0" align="center" width="700">
	<input type="hidden" value="${b.mem_no }" readonly="readonly">
	<input type="hidden" name="mem_no" value="${mem_no }" readonly="readonly">
	<input type="hidden" name="mem_nickname" value="${mem_nickname }" readonly="readonly">

<c:forEach items="${boarddetail }" var="b">
<tr>
	<td colspan="3" align="left">
		<B>　글번호 ${b.bd_no}</B>
	</td>
</tr>
<tr>
	<td colspan="3" align="left">
		<h4><B>　${b.bd_title }</B></h4>
	</td>
</tr>
<tr>
	<td colspan="3" align="left">
		<fmt:parseDate value="${b.bd_writeday }" var="writedaydate" pattern="yyyy-MM-dd HH:mm:ss"/>
		<fmt:formatDate value="${writedaydate }" var="writedaystring" pattern="yyyy-MM-dd HH:mm"/>
		<B>　${b.mem_nickname}</B>　　조회 ${b.bd_readcount}　　${writedaystring }　　댓글 ?　　추천수 ?</td>
</tr>
<tr>
	<td>　　</td></tr>
<tr>
	<td>　　</td></tr>
<tr>
	<td>　　　　</td>
	<td><img src="${pageContext.request.contextPath}/image/${b.bd_image}" width="500px"></td>
	<td>　　　　</td>
</tr>
<tr>
	<td>　　</td></tr>
<tr>
	<td>　　　　</td>
	<td><textarea id="detailarea" readonly="readonly">${b.bd_content }</textarea></td>
	<td>　　　　</td>
</tr>
<tr>
	<td colspan="3" align="center">
		<input type="hidden" value="${e.mem_no }" readonly="readonly">
		<input type="hidden" name="mem_no" value="${mem_no }" readonly="readonly">
	</td>
</tr>
<tr>
	<td colspan="3" align="center">　　
		<input type="hidden" name="mem_nickname" value="${mem_nickname }" readonly="readonly">
	</td></tr>
<tr>
	<td colspan="3" align="right">
		<button><a href=""><B>추천</B></a></button>
		<c:if test="${b.mem_no eq mem_no || mem_id eq 'admin'}">
			<button onclick="location.href='boardmodifyselect?bd_no=${b.bd_no }&mem_no=${mem_no }&mem_nickname=${mem_nickname }'"><B>수정</B></button>
			<button onclick="location.href='boarddelete?bd_no=${b.bd_no }'"><B>삭제</B></button>
		</c:if>
	</td>
</tr>
<tr>
	<td colspan="3">
		<button id="b2" onclick="location.href='boarddetail?bd_no=${(b.bd_no)-1 }'"><B>◀ 이전글</B></button>
		<button id="b2" onclick="location.href='board'"><B>목록</B></button>
		<button id="b2" onclick="location.href='barddetail?bd_no=${(b.bd_no)+1 }'"><B>다음글 ▶</B></button>
	</td>
</tr>
</c:forEach>
</table>

</body>
</html>