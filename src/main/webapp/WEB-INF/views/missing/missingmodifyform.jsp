<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
th {
	text-align: center;
}
td {
	text-align: left;
	height: 35px;
}
table {
	border-spacing: 10px;
	border-collapse: separate;
}
textarea {
	line-height: 150%;
}
</style>
<meta charset="UTF-8">
<title>실종신고 게시글 수정</title>
</head>
<body>

<h4><B><font color="#fdafab">글수정</font></B></h4>
<br><br>

<form action="missingmodifyinput" method="post" enctype="multipart/form-data">
	<input type="hidden" name="mis_no" value="${mic.mis_no}">
	<input type="hidden" name="mem_no" value="${mic.mem_no}">
	<input type="hidden" name="mem_nickname" value="${mic.mem_nickname}">
	<input type="hidden" name="mem_tel" value="${mic.mem_tel}">
	<input type="hidden" name="mis_writeday" value="${mic.mis_writeday}">
	<input type="hidden" name="mis_readcount" value="${mic.mis_readcount}">

<table border="0" align="center">
	<tr>
		<td bgcolor="#fbdee2">　　</td>
		<td>
			<table border="0" align="center">
			<tr>
				<th>　　구분　　</th>
				<td><input type="text" name="mis_gb" value="${mic.mis_gb}"></td>
			</tr>
			<tr>
				<th>　　종류　　</th>
				<td>
					<input
						type="radio"
						name="mis_gb2"
						value="개"
						<c:if test="${mic.mis_gb2 eq '개'}">checked="checked"</c:if>
						> 개&emsp;
					<input
						type="radio"
						name="mis_gb2"
						value="고양이"
						<c:if test="${mic.mis_gb2 eq '고양이'}">checked="checked"</c:if>
						> 고양이
					<label>
						<input type="radio" name="mis_gb2" value="개"
						<c:if test="${mic.mis_gb2 eq '개'}">checked="checked"</c:if>
						>개
					</label>
					&emsp;
					<label>
						<input type="radio" name="mis_gb2" value="고양이"
						<c:if test="${mic.mis_gb2 eq '고양이'}">checked="checked"</c:if>
						>고양이
					</label>
				</td>
			</tr>
			<tr>
				<th>　　제목　　</th>
				<td><input type="text" name="mis_title" value="${mic.mis_title}"></td>
			</tr>
			</table>	
		</td>
	</tr>
	<tr>
		<td colspan="2"><hr></td>
	</tr>
		<tr>
		<td bgcolor="#fbdee2"><B>반려<br>동물<br>정보</B></td>
		<td>
			<table border="0" align="center">
			<tr>
				<th>　이름　</th>
				<td><input type="text" name="mis_pname" value="${mic.mis_pname}"></td>
			</tr>
			<tr>
				<th>　등록번호　</th>
				<td><input type="text" name="mis_pno" value="${mic.mis_pno}"></td>
			</tr>
			<tr>
				<th>　발견날짜　</th>
				<td><input type="date" name="mis_misdate" value="${mic.mis_misdate}"></td>
			</tr>
			<tr>
				<th>　발견장소　</th>
				<td><input type="text" name="mis_misplace" value="${mic.mis_misplace}"></td>
			</tr>
			<tr>
				<th>　이미지　</th>
				<td><input type="file" name="mis_image"></td>
			</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td colspan="2"><hr></td>
	</tr>
	
	<tr>
		<td bgcolor="#fbdee2">　　</td>
		<td>
			<table border="0" align="center">
			<tr>
				<th>　　내용　　</th>
			<td><textarea rows="20" cols="40" name="mis_content">${mic.mis_content}
				</textarea></td>
			</tr>
			</table>
	</tr>
	
	<tr>
		<td>　　</td>
	</tr>
	
	<tr>
		<th colspan="2">
		<input type="submit" value="수정">
			<a href="missingdetail?mis_no=${mic.mis_no}"><input id="cancel" type="button" value="취소"></a>
		</th>
	</tr>	
</table>
</form>
</body>
</html>