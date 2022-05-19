<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<title>분양/임시보호 게시글 수정</title>
</head>
<body>

<h4><B><font color="#fdafab">글수정</font></B></h4>
<br><br>

<form action="rehomemodify" method="post" enctype="multipart/form-data">

	<input type="hidden" name="rh_no" value="${rd.rh_no}">
	<input type="hidden" name="rh_gb1" value="${rd.rh_gb1 }">	
	<input type="hidden" name="mem_no" value="${rd.mem_no}">
	<input type="hidden" name="mem_nickname" value="${rd.mem_nickname}">
	<input type="hidden" name="mem_tel" value="${rd.mem_tel}">
	<input type="hidden" name="rh_writeday" value="${rd.rh_writeday}">
	<input type="hidden" name="rh_readcount" value="${rd.rh_readcount}">

<table border="0" align="center">
	<tr>
		<td bgcolor="#fbdee2">　　</td>
		<td>
			<table border="0" align="center">
			<tr>
				<th>　　구분　　</th>
				<td><input type="radio" name="rh_gb2" value="임보"> 임보　　
					<input type="radio" name="rh_gb2" value="분양"> 분양</td>
			</tr>
			<tr>
				<th>　　종류　　</th>
				<td><input type="radio" name="rh_gb3" value="개"> 개　　
					<input type="radio" name="rh_gb3" value="고양이"> 고양이</td>
			</tr>
			<tr>
				<th>　　제목　　</th>
				<td><input type="text" name="rh_title" value="${rd.rh_title}"></td>
			</tr>
			</table>	
		</td>
	</tr>
	<tr>
		<td colspan="2"><hr></td></tr>
	<tr>
		<td bgcolor="#fbdee2"><B>반려<br>동물<br>정보</B></td>
		<td>
			<table border="0" align="center">
			<tr>
				<th>　이름　</th>
				<td><input type="text" name="rh_pname" value="${rd.rh_pname}"></td>
			</tr>
			<tr>
				<th>　등록번호　</th>
				<td><input type="text" name="rh_pno" value="${rd.rh_pno}"></td>
			</tr>
			<tr>
				<th>　발견날짜　</th>
				<td><input type="date" name="rh_misdate" value="${rd.rh_misdate}"></td>
			</tr>
			<tr>
				<th>　발견장소　</th>
				<td><input type="text" name="rh_misplace" value="${rd.rh_misplace}"></td>
			</tr>
			<tr>
				<th>　이미지　</th>
				<td><input type="file" name="rh_image"></td>
			</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td colspan="2"><hr></td></tr>
	<tr>
		<td bgcolor="#fbdee2">　　</td>
		<td>
			<table border="0" align="center">
			<tr>
				<th>　　내용　　</th>
			<td><textarea rows="20" cols="40" name="rh_content">${rd.rh_content}
				</textarea></td>
			</tr>
			</table>
	</tr>
	<tr>
		<td>　　</td>
	<tr>
		<th colspan="2">
		<input type="submit" value="수정">
		<a href="rehomedetail?rh_no=${rd.rh_no}"><input id="cancel" type="button" value="취소"></a>
		</th>
	</tr>
</table>
</form>

</body>
</html>