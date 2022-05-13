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
<form action="noticemodify" method="post">
<table style="width: 50%;margin: auto;" border="1">
	<tr>
		<th>글번호</th>
		<td id="nt_no"><input type="text" name="nt_no" value="${ndto.nt_no}" readonly="readonly"></td>
	</tr>
	<tr>
		<th>닉네임</th>
		<td id="mem_nickname"><input type="text" name="mem_nickname" value="${ndto.mem_nickname}" readonly="readonly"></td>
	</tr>
	<tr>
		<th>작성일자</th>
		<td><input type="text" name="nt_writeday" value="${ndto.nt_writeday}" readonly="readonly"></td>
	</tr>
	<tr>
		<th>조회수</th>
		<td><input type="text" name="nt_readcount" value="${ndto.nt_readcount}" readonly="readonly"></td>
	</tr>
	<tr>
		<th>제목</th>
		<td><input type="text" name="nt_title" value="${ndto.nt_title}"></td>
	</tr>
	<tr>
		<th>내용</th>
		<td><textarea rows="10" cols="20" name="nt_content">${ndto.nt_content}</textarea></td>
	</tr>
</table>
<button type="submit">수정</button>
<button onclick="location.href='noticedetail?nt_no=${ndto.nt_no}'">취소</button>
</form>
</body>
</html>