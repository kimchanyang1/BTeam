<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
function cancel() {
	window.close();
}
$(document).ready(function(){
	$("#idCheckButton").click(function(){
		alert("버튼은눌림");$("body").append("click!!!<br/>");
		$.ajax({
			type : "post",
			url : "idCheck",
			data : $("#idCheck").value(),
			succes : function(data){
				alert("data");
			},
			error : function(){
				alert("ERROR");
			}
		});
	});
});
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<input type="text" name="idCheck" id="idCheck">
<button type="button" id="idCheckButton">아이디 확인</button>
<p></p>
<button type="submit">아이디 사용</button>
<button type="button" onclick="cancel()">취소</button>
</body>
</html>