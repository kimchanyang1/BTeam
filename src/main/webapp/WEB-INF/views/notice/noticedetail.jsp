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
<script type="text/javascript">
$(document).ready(function(){
	$('#noticedelete').click(function(){
		let kk = confirm($('#mem_nickname').text()+'글을 정말 삭제하시겠습니까?');
		if (kk) {
			alert('삭제 실행');
			var url = "noticedelete?nt_no="+$('#nt_no').text();
			$(location).attr('href',url);
		}
	});
});
</script>
<table style="width: 50%;margin: auto;" border="1">
	<tr>
		<th>글번호</th>
		<td id="nt_no">${ndto.nt_no}</td>
	</tr>
	<tr>
		<th>닉네임</th>
		<td id="mem_nickname">${ndto.mem_nickname}</td>
	</tr>
	<tr>
		<th>작성일자</th>
		<td>${ndto.nt_writeday}</td>
	</tr>
	<tr>
		<th>조회수</th>
		<td>${ndto.nt_readcount}</td>
	</tr>
	<tr>
		<th>제목</th>
		<td>${ndto.nt_title}</td>
	</tr>
	<tr>
		<th>내용</th>
		<td>${ndto.nt_content}</td>
	</tr>
</table>
<c:if test="${logon eq true && mem_id eq 'admin'}">
<button onclick="location.href='noticemodifyform?nt_no=${ndto.nt_no}'">수정</button>
<button id="noticedelete">삭제</button>
</c:if>
</body>
</html>