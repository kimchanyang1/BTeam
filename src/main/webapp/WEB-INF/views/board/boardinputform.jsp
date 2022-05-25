<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
td {
	text-align: center;
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
<title>Insert title here</title>
<script type="text/javascript">
function check() {
	try{
		var f = document.form1;

		var title = f.bd_title.value;
		var content = f.bd_content.value;
		if (title=="") {
			alert("제목은 필수입니다.");
			return false;
		}else if (content=="") {
			alert("내용을 적어주세요.");
			return false;
		}
		f.submit();
    }
    catch(err){
		alert(err.message);
    }
}
</script>
</head>
<body>

<h4><B><font color="#fdafab">자유게시판 글쓰기</font></B></h4>
<br><br>

<form action="boardinput" method="post" enctype="multipart/form-data" name="form1">
	<input type="hidden" name="mem_no" value="${mem_no}" readonly="readonly">
	<input type="hidden" name="mem_nickname" value="${mem_nickname}" readonly="readonly">

<table border="0" align="center">
<tr>
	<td><label for="bd_title"><B>　제목　</B></label></td>
	<td><input type="text" name="bd_title"></td></tr>
<tr>
	<td><label for="bd_content"><B>　내용　</B></label></td>
	<td><textarea name="bd_content"></textarea></td></tr>
<tr>
	<td><label for="bd_image"><B>　이미지　</B></label></td>
	<td><input type="file" name="bd_image"></td></tr>
<tr>
	<td colspan="2" align="center">　　
		</td></tr>
<tr>
	<td colspan="2"><B>
		<input type="button" onclick="check()" value="등록">
		<a href="board"><input id="cancel" type="button" value="취소"></a></B></td></tr>
</table>
</form>

</body>
</html>