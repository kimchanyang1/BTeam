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

<h4><B><font color="#fdafab">후기게시판</font></B></h4>
<br><br>

<table border="0" align="center" width="700">
<c:forEach items="${epiloguedetail }" var="e">
<tr>
	<td colspan="3" align="left">
		<B>　${e.ep_gb}</B>
	</td>
</tr>
<tr>
	<td colspan="3" align="left">
		<h4><B>　${e.ep_title }</B></h4>
	</td>
</tr>
<tr>
	<td colspan="3" align="left">
		<fmt:parseDate value="${e.ep_writeday }" var="writedaydate" pattern="yyyy-MM-dd HH:mm:ss"/>
		<fmt:formatDate value="${writedaydate }" var="writedaystring" pattern="yyyy-MM-dd HH:mm"/>
		<B>　${e.mem_nickname}</B>　　조회 ${e.ep_readcount}　　${writedaystring }　　댓글 ?</td>
</tr>
<tr>
	<td>　　</td></tr>
<tr>
	<td>　　</td></tr>
<tr>
	<td>　　　　</td>
	<td><img src="${pageContext.request.contextPath}/image/${e.ep_image}" width="600px"></td>
	<td>　　　　</td>
</tr>
<tr>
	<td>　　</td></tr>
<tr>
	<td>　　　　</td>
	<td><textarea id="detailarea" readonly="readonly">${e.ep_content }</textarea></td>
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
		<c:if test="${e.mem_no eq mem_no || mem_id eq 'admin'}">
			<button onclick="location.href='epiloguemodifyselect?ep_no=${e.ep_no }&mem_no=${mem_no }&mem_nickname=${mem_nickname }'"><B>수정</B></button>
			<button onclick="location.href='epiloguedelete?ep_no=${e.ep_no }'"><B>삭제</B></button>
		</c:if>
	</td>
</tr>
<tr>
	<td colspan="3">
		<button id="b2" onclick="location.href='rehomedetail?rh_no=${rdto[rd].rh_no }'"><B>◀ 이전글</B></button>
		<button id="b2" onclick="location.href='epilogue'"><B>목록</B></button>
		<button id="b2" onclick="location.href='rehomedetail?rh_no=${rdto[rd].rh_no }'"><B>다음글 ▶</B></button>
	</td>
</tr>
</c:forEach>
</table>

</body>
</html>