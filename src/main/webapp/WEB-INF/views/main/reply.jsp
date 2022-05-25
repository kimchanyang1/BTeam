<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table></table>
<div style="width: 700px;margin: auto;display: flex;background: #fbdee2;padding: 5px;"><B style="margin: auto;">댓글</B></div>
<c:if test="${fn:length(replist)>0}">
<c:forEach begin="0" end="${fn:length(replist)-1}" var="rep">
<script type="text/javascript">
$(document).ready(function(){
	$("#repmodify"+${rep}).click(function(){
		var value = 
		"<form action='boardreplyinput' method='post'>"+
		"<div style='width: 700px;margin: auto;display: flex;padding: 10px;'>"+
			"<div  style='text-align: center;flex-basis: 20%;align-self: center;'>"+
				"<i class='fas fa-user w3-padding-16'> ${ mdto.mem_id }</i>"+
			"</div>"+
			"<div style='flex: 1;text-align: justify;'>"+
				"<input type='hidden' name='bd_no' id='bd_no' value='${ boarddetail.bd_no }'>"+ 
				"<input type='hidden' name='mem_id' id='mem_id' value='${ mdto.mem_id }'>"+
				"<textarea id='replyarea' name='rep_content'>${replist[rep].rep_content}</textarea>"+
			"</div>"+
			"<div style='flex-basis: 20%;align-self: center;'>"+
				"<B><input id='replybutton' type='submit' value='등록'></B>"+
			"</div>"+
		"</div>"+
		"</form>";
		$('#rep'+${rep}).html(value);
	});
});
</script>
<div style="width: 700px;margin: auto;display: flex;padding: 10px;" id="rep${rep}">
	<div  style="text-align: center;flex-basis: 20%;">
		<br>
		<B>${replist[rep].rep_id}</B>
	</div>
	<div style="flex: 1;text-align: justify;">
		<br>
		${replist[rep].rep_content}
	</div>
	<div style="flex-basis: 20%;">
		<fmt:parseDate value="${replist[rep].rep_writeday}" var="writedayDate" pattern="yyyy-MM-dd HH:mm:ss"/>
		<fmt:formatDate value="${writedayDate}" var="writedayString" pattern="yyyy-MM-dd HH:mm"/>
		<p>${writedayString}</p>
		<p id="repmodify${rep}" style="cursor: pointer;">수정</p>　
		<p style="cursor: pointer;">삭제</p>
	</div>
</div>
</c:forEach>
</c:if>
<form action="boardreplyinput" method="post">
<div style="width: 700px;margin: auto;display: flex;padding: 10px;">
	<div  style="text-align: center;flex-basis: 20%;align-self: center;">
		<br>
		<c:if test="${ mdto.mem_id != null }">
			<i class="fas fa-user w3-padding-16"> ${ mdto.mem_id }</i>
		</c:if>	
	</div>
	<div style="flex: 1;text-align: justify;">
		<br>
		<c:if test="${ mdto.mem_id != null }">		
			<input type="hidden" name="bd_no" id="bd_no" value="${ boarddetail.bd_no }"> 
			<input type="hidden" name="mem_id" id="mem_id" value="${ mdto.mem_id }">
			<textarea id="replyarea" name="rep_content"></textarea>
		</c:if>
		<c:if test="${ mdto.mem_id == null }">
			<textarea id="replyarea" readonly="readonly">

					댓글 작성은 로그인 후 가능합니다.
			</textarea>
		</c:if>
	</div>
	<div style="flex-basis: 20%;align-self: center;">
		<br>
		<c:if test="${ mdto.mem_id != null }">
			<B><input id="replybutton" type="submit" value="등록"></B>
		</c:if>
		<c:if test="${ mdto.mem_id == null }">
			<button id="replybutton" onclick="location.href='loginform'"><B>로그인</B></button>
		</c:if>
	</div>
</div>
</form>
</body>
</html>