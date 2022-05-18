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
<title>분양/임시보호</title>
</head>
<body>
<section>

<h4><B><font color="#fdafab">임시분양/보호 게시판 글쓰기</font></B></h4>
<br><br>

<form action="rehomeinput" method="post" enctype="multipart/form-data">
<table border="0" align="center">
	<tr>
		<td bgcolor="#fbdee2">　　</td>
		<td>
			<table border="0" align="center">
			<tr>
				<th>　　구분　　</th>
				<td><input type="radio" name="rh_gb2" value="임보"> 임시보호 &emsp;
					<input type="radio" name="rh_gb2" value="분양"> 분양
				</td>
			</tr>
			<tr>
				<th>　　종류　　</th>
				<td><input type="radio" name="rh_gb3" value="개">개 &emsp;
					<input type="radio" name="rh_gb3" value="고양이"> 고양이</td>
			</tr>
			<tr>
				<th>　　제목　　</th>
				<td><input type="text" name="rh_title"></td>
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
				<td><input type="text" name="rh_pname"></td>
			</tr>
			<tr>
				<th>　등록번호　</th>
				<td><input type="text" name="rh_pno"></td>
			</tr>
			<tr>
				<th>　발견날짜　</th>
				<td><input type="date" name="rh_misdate"></td>
			</tr>
			<tr>
				<th>　발견장소　</th>
				<td><input type="text" name="rh_misplace"></td>
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
				<td><textarea name="rh_content">* 필수
· 품종:
· 색상:
· 크기:
· 성별:
· 나이:

· 그 외 (사고 경위 등을 작성해 주세요): </textarea></td>
			</tr>
			</table>
	</tr>
	<tr>
		<td>　　</td>
	<tr>
		<td colspan="2" align="center">
		<input type="submit" value="수정">
		<a href="rehomeoutform"><input type="button" value="취소"></a>
		</td>
	</tr>
</table>
</form>

</section>
</body>
</html>