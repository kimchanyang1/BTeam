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

<h4><B><font color="#fdafab">공지게시판</font></B></h4>
<br><br>

<script type="text/javascript">
$(document).ready(function(){
	$('#noticedelete').click(function(){
		let msg = confirm("${ndto.mem_nickname}님 글을 정말 삭제하시겠습니까?");
		if (msg) {
			var url = "noticedelete?nt_no="+${ndto.nt_no};
			$(location).attr('href',url);
		}
	});
});
</script>

<table border="0" align="center" width="700">
<tr>
	<td colspan="3" align="left">
	<B>　글번호 ${ndto.nt_no}</B>
	</td>
</tr>
<tr>
	<td colspan="3" align="left">
	<h4><B>　${ndto.nt_title}</B></h4>
	</td>
</tr>
<tr>
	<td colspan="3" align="left">
		<fmt:parseDate value="${ndto.nt_writeday}" var="writedaydate" pattern="yyyy-MM-dd HH:mm:ss"/>
		<fmt:formatDate value="${writedaydate }" var="writedaystring" pattern="yyyy-MM-dd HH:mm"/>
		<B>　${ndto.mem_nickname}</B>　　조회 ${ndto.nt_readcount}　　${writedaystring } </td>
</tr>
<tr>
	<td>　　</td></tr>
<tr>
	<td>　　</td></tr>
<tr>
	<td>　　　　</td>
	<td><textarea id="detailarea" readonly="readonly">${ndto.nt_content}</textarea></td>
	<td>　　　　</td>
</tr>
<tr>
	<td colspan="3" align="right">
		<c:if test="${logon eq true && mem_id eq 'admin'}">
			<button onclick="location.href='noticemodifyform?nt_no=${ndto.nt_no}'"><B>수정</B></button>
			<button id="noticedelete"><B>삭제</B></button>
		</c:if>
	</td>
</tr>
<tr>
	<td colspan="3">
		<c:choose>
			<c:when test="${move.lastno != 9999}">
				<button id="b2" onclick="location.href='noticedetail?nt_no=${move.lastno}'"><B>◀ 이전글</B></button>
			</c:when>
			<c:otherwise>
				<B>이전글이 없습니다</B>
			</c:otherwise>
		</c:choose>
		<button id="b2" onclick="location.href='noticeoutform'"><B>목록</B></button>
		<c:choose>
			<c:when test="${move.nextno != 9999}">
				<button id="b2" onclick="location.href='noticedetail?nt_no=${move.nextno}'"><B>다음글 ▶</B></button>
			</c:when>
			<c:otherwise>
				<B>다음글이 없습니다</B>
			</c:otherwise>
		</c:choose>
	</td>
</tr>

</table>

</body>
</html>