<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="rehomesearch">
<table>
	<tr>
		<td colspan="2">
			<input type="checkbox" name="svalue" value="임보"> 임보
			<input type="checkbox" name="svalue" value="분양"> 분양
			<input type="checkbox" name="svalue" value="개"> 개
			<input type="checkbox" name="svalue" value="고양이"> 고양이
		</td>
	</tr>
	<tr>
		<th>
			발견장소
		</th>
		<td>
			<input type="text" name="svalue">
		</td>
		<td>
			<input type="submit" value="검색">
		</td>
	</tr>
</table>
</form>

</body>
</html>