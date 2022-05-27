<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function logincheck() {
	try{
		var f = document.form1;

		var id = f.mem_id.value;
		var pw = f.mem_pw.value;
		if (id=="") {
			alert("아이디를 입력해 주세요");
			return false;
		}else if (pw=="") {
			alert("비밀번호를 입력해 주세요.");
			return false;
		}
		document.form1.submit();
    }
    catch(err){
		alert(err.message);
    }
}
</script>
</head>
<body>

<h4><B><font color="#fdafab">로그인</font></B></h4>
<br><br>

<form action="login" method="post" name="form1">
	
<div style="width: 20%;margin: auto;padding: 10px;">
	<span class="glyphicon glyphicon-user"><input id="login" type="text" name="mem_id" placeholder="아이디" value="${memoryid}"></span><br>
	<span class="glyphicon glyphicon-lock"><input id="login" type="password" name="mem_pw" placeholder="비밀번호"></span>
	<div style="padding: 5px;">
		<label class="checkbox-inline"><input type="checkbox" name="memoryid" 
			<c:if test="${memorycheck eq true}">checked="checked"</c:if>
		>아이디 기억하기</label>
	</div>
	<br>
	<div style="padding: 5px;">
		<input type="button" onclick="logincheck()" value="로그인">
	</div>
</div>
</form>
</body>
</html>