<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="rehomesearch" method="post">
<table>
	<tr>
		<td colspan="3">
			<input type="checkbox" name="gb2" value="임보"> 임보 &emsp;
			<input type="checkbox" name="gb2" value="분양"> 분양 &emsp;
			<input type="checkbox" name="gb3" value="개"> 개 &emsp;
			<input type="checkbox" name="gb3" value="고양이"> 고양이 &emsp;
		</td>
	</tr>
	<tr>
		<th>
			발견장소
		</th>
		<td>
			<input type="text" name="sword">
		</td>
		<td>
			<input type="submit" value="조회">
		</td>
	</tr>
</table>
</form>

</body>
</html>