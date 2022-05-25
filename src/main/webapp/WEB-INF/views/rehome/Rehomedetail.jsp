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
<script type="text/javascript">
$(document).ready(function(){
	$('#rehomedelete').click(function(){
		let msg = confirm("정말 삭제하시겠습니까?");
		if (msg) {
			var url = "rehomedelete?rh_no=${rd.rh_no}";
			$(location).attr('href',url);
		}
	});
});
</script>

<title>분양/임시보호 게시글</title>
</head>
<body oncontextmenu='return false' onselectstart='return false' ondragstart='return false'>

<h4><B><font color="#fdafab">임시분양/보호 게시판</font></B></h4>
<br><br>

<input type="hidden" name="rh_no" value="${rd.rh_no }">
<input type="hidden" name="mem_no" value="${rd.mem_no }">

<table border="0" align="center" width="700">
<c:if test="${mem_no eq 0}">
<tr>
	<th align="left" colspan="4">　${rd.rh_gb1}　 
		<c:if test="${rd.rh_gb1 != '승인'}">
			<button onclick="location.href='rehomeok?rh_no=${rd.rh_no}&rh_gb1=승인'">승인</button>
			<button onclick="location.href='rehomeok?rh_no=${rd.rh_no}&rh_gb1=보류'">보류</button>
			<button onclick="location.href='rehomeok?rh_no=${rd.rh_no}&rh_gb1=거절'">거절</button>
		</c:if>
	</th>
</tr>
</c:if>
<tr>
	<th align="left" colspan="4"><B>　${rd.rh_gb2}　</B>	
		<c:if test="${mem_no eq 0}">
			<c:if test="${rd.rh_gb2 eq '임시보호'}">
				<button id="longbutton" onclick="location.href='rehomeimboform?rh_no=${rd.rh_no}'">임시보호 완료</button>
			</c:if>
			<c:if test="${rd.rh_gb2 != '분양완료'}">
				<button id="longbutton" onclick="location.href='rehomebun?rh_no=${rd.rh_no}'">분양 완료</button>
			</c:if>
		</c:if>
	</th>
</tr>
<tr>
	<td colspan="4" align="left">
		<h4><B>　[${rd.rh_gb2 }/${rd.rh_gb3 }]${rd.rh_title}</B></h4>
	</td>
</tr>
<tr>
	<td colspan="4" align="left">
		<fmt:parseDate value="${rd.rh_writeday }" var="writedaydate" pattern="yyyy-MM-dd HH:mm:ss"/>
		<fmt:formatDate value="${writedaydate }" var="writedaystring" pattern="yyyy-MM-dd HH:mm"/>
		<B>　${rd.mem_nickname }</B>　　조회 ${rd.rh_readcount}　　${writedaystring }　　댓글 ?</td>
</tr>
<tr>
	<td>　　</td></tr>
<tr>
	<td colspan="4" align="center" bgcolor="#fbdee2">
	<B>　반려동물 정보　</B></td></tr>
<tr>
	<td width="100px"><B>이름</B></td><td width="250px">${rd.rh_pname }</td>
	<td width="100px"><B>등록번호</B></td><td width="250px">${rd.rh_pno }</td></tr>
<tr>
	<td><B>발견장소</B></td><td>${rd.rh_misplace }</td>
	<td><B>발견날짜</B></td><td>${rd.rh_misdate }</td></tr>
<tr>
	<td>　　</td></tr>
<tr>
	<td colspan="4" align="center" bgcolor="#fbdee2">
	<B>　임시보호자 정보　</B></td></tr>
<tr>
	<td width="100px"><B>닉네임</B></td><td width="250px">${rd.mem_nickname }</td>
	<td width="100px"><B>연락처</B></td><td width="250px">${rd.mem_tel }</td></tr>
</table>

<table border="0" align="center" width="700">
<tr>
	<td colspan="4">
		<B>　</B>
	</td>
</tr>
<tr>
	<td colspan="4">
		<B>　</B>
	</td>
</tr>
<tr>
	<td>　　　　</td>
	<td colspan="2"><img src="${pageContext.request.contextPath}/image/${rd.rh_image }" width="500px"></td>
	<td>　　　　</td>
</tr>
<tr>
	<td>　　</td></tr>
<tr>
	<td>　　　　</td>
	<td colspan="2" height="300px"><textarea id="detailarea" readonly="readonly">${rd.rh_content }</textarea></td>
	<td>　　　　</td>
</tr>
<tr>
	<td>　　</td></tr>
<tr>
	<td>　　</td></tr>
<tr>
	<td colspan="4" align="right">
		<c:if test="${mem_nickname eq rd.mem_nickname || mem_id eq 'admin'}">
			<c:choose>
				<c:when test="${rd.rh_gb2 eq '분양완료'}">
					<button id="longbutton" onclick="location.href='epilogueinputform?ep_gb=분양완료&ep_originno=${rd.rh_no}'"><B>후기글쓰기</B></button>
				</c:when>
				<c:otherwise>
					<a href="rehomemodifyform?rh_no=${rd.rh_no}"><B><input type="button" value="수정"></B></a>
					<B><input id="rehomedelete" type="button" value="삭제"></B>
				</c:otherwise>
			</c:choose>
		</c:if>
	</td>
</tr>
<tr>
	<td colspan="4">
		<c:choose>
			<c:when test="${move.lastno != 9999}">
				<button id="b2" onclick="location.href='rehomedetail?rh_no=${move.lastno}'"><B>◀ 이전글</B></button>
			</c:when>
			<c:otherwise>
				<B>이전글이 없습니다</B>
			</c:otherwise>
		</c:choose>
		<button id="b2" onclick="location.href='rehome'"><B>목록</B></button>
		<c:choose>
			<c:when test="${move.nextno != 9999}">
				<button id="b2" onclick="location.href='rehomedetail?rh_no=${move.nextno}'"><B>다음글 ▶</B></button>
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