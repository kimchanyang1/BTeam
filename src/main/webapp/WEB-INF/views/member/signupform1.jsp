<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
textarea {
	width: 100%;
	height: 6.25em;
	border: thin;
	resize: none;
}
</style>
<script type="text/javascript" src="https://nid.naver.com/js/clickcr.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#clickall").click(function(){
		var clickall=$("#clickall").prop("checked");
		if (clickall) {
			$("#click1").prop("checked",true);
			$("#click2").prop("checked",true);
		} else {
			$("#click1").prop("checked",false);
			$("#click2").prop("checked",false);
		}
	});
	$(".click").click(function(){
		var click1=$("#click1").prop("checked");
		var click2=$("#click2").prop("checked");
		if (click1 && click2) {
			$("#clickall").prop("checked",true);
		}
		if (!click1 || !click2) {
			$("#clickall").prop("checked",false);
		}
	});
	$(".click").click(function(){
		var clickall=$("#clickall").prop("checked");
		if (clickall) {
			$("#next").prop("disabled",false);
		} else {
			$("#next").prop("disabled",true);
		}
	});
});
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div style="width: 40%;margin: auto;">
<h4>이용약관</h4>
<textarea rows="10" cols="30">
1.
2.
3.
4.
5.
2.
3.
4.
2.
3.
4.
2.
3.
4.
2.
3.
4.
</textarea>
<br>
위 항목에 동의합니다.<input type="checkbox" id="click1" class="click">
<h4>개인정보처리방침</h4>
<textarea rows="10" cols="30">
1.
2.
3.
4.
5.
</textarea>
<br>
위 항목에 동의합니다.
<input type="checkbox" id="click2" class="click"><br><br>
전체 동의
<input type="checkbox" id="clickall" class="click"><br><br>
<button disabled="disabled" id="next" onclick="location.href='signupform2'">다음 페이지</button>
</div>
</body>
</html>