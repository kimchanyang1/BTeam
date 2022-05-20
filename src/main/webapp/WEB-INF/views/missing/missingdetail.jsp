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

<h4><B><font color="#fdafab">실종신고 게시판</font></B></h4>
<br><br>

<table border="0" align="center" width="700">
	<tr>
		<th align="left" colspan="4">　${mic.mis_gb}　 
			<c:if test="${mem_id eq 'admin' || mem_no eq mic.mem_no}">
					<c:if test="${mic.mis_gb eq '실종'}">
						<button onclick="location.href='rehoming?mis_no=${mic.mis_no}'">귀가완료</button>
					</c:if>
			</c:if>
		</th>
	</tr>		
	<tr>
		<td colspan="4" align="left">
			<h4><B>　[${mic.mis_gb }/${mic.mis_gb2 }]${mic.mis_title}</B></h4>
		</td>
	</tr>
	
	<tr>
		<td colspan="4" align="left">
			<fmt:parseDate value="${mic.mis_writeday }" var="writedaydate" pattern="yyyy-MM-dd HH:mm:ss"/>
			<fmt:formatDate value="${writedaydate }" var="writedaystring" pattern="yyyy-MM-dd HH:mm"/>
			<B>　${mic.mem_nickname }</B>　　조회 ${mic.mis_readcount}　　${writedaystring }　　댓글 ?</td>
	</tr>
		
	<tr>
		<td>　　</td></tr>
		
	<tr>
		<td colspan="4" align="center" bgcolor="#fbdee2"><B>　반려동물 정보　</B></td></tr>
	
	<tr>
		<td width="100px"><B>이름</B></td><td width="250px">${mic.mis_pname }</td>
		<td width="100px"><B>등록번호</B></td><td width="250px">${mic.mis_pno }</td>
	</tr>
	<tr>
		<td><B>발견장소</B></td><td>${mic.mis_misplace }</td>
		<td><B>발견날짜</B></td><td>${mic.mis_misdate }</td>
	</tr>
	
	<tr>
		<td>　　</td></tr>
	
	<tr><td colspan="4" align="center" bgcolor="#fbdee2"><B>　실종신고자 정보　</B></td></tr>
	<tr>
		<td width="100px"><B>닉네임</B></td><td width="250px">${mic.mem_nickname }</td>
		<td width="100px"><B>연락처</B></td><td width="250px">${mic.mem_tel }</td>
	</tr>
</table>

<table border="0" align="center" width="700">
<tr>
	<td colspan="3"><B>　</B></td>	</tr>
<tr>
	<td colspan="3"><B>　</B></td>
</tr>

<tr>
	<td>　　　　</td>
	<td colspan="2"><img src="${pageContext.request.contextPath}/image/${mic.mis_image }"></td>
	<td>　　　　</td>
</tr>

<tr>
	<td>　　</td></tr>
	
<tr>
	<td>　　　　</td>
	<td colspan="2" height="300px">
	<textarea id="detailarea" readonly="readonly">${mic.mis_content }</textarea>
	</td>
	<td>　　　　</td>
</tr>

<tr>
	<td>　　</td></tr>
	
<tr>
	<td>　　</td></tr>
	
	<tr>
	<td colspan="4" align="right">
		<c:if test="${mem_nickname eq mic.mem_nickname || mem_id eq 'admin'}">
					<a href="missingmodifyform?mis_no=${mic.mis_no}"><B><input type="button" value="수정"></B></a>
					<a href="missingdelete?mis_no=${mic.mis_no}"><B><input type="button" value="삭제"></a>	
				<c:if test="${mic.mis_gb eq '귀가'}">
					<button id="longbutton" onclick="location.href='epilogueinputform?ep_gb=귀가완료&ep_originno=${mic.mis_no}'"><B>후기글쓰기</B></button>
				</c:if>
		</c:if>
	</td>
	</tr>
<tr>
	<td colspan="4">
		<button id="b2" onclick="location.href='rehomedetail?rh_no=${rdto[rd].rh_no }'"><B>◀ 이전글</B></button>
		<button id="b2" onclick="location.href='rehome'"><B>목록</B></button>
		<button id="b2" onclick="location.href='rehomedetail?rh_no=${rdto[rd].rh_no }'"><B>다음글 ▶</B></button>
	</td>
</tr>		
</table>

</body>
</html>