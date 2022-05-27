<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
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
</head>
<body oncontextmenu='return false' onselectstart='return false' ondragstart='return false'>

<h4><B><font color="#fdafab">후기게시판</font></B></h4>
<br><br>

<table border="0" align="center" width="700">
<tr>
	<td colspan="3" align="left">
		<B>　${epiloguedetail.ep_gb}</B>
	</td>
</tr>
<tr>
	<td colspan="3" align="left">
		<h4><B>　${epiloguedetail.ep_title }</B></h4>
	</td>
</tr>
<tr>
	<td colspan="3" align="left">
		<fmt:parseDate value="${epiloguedetail.ep_writeday }" var="writedaydate" pattern="yyyy-MM-dd HH:mm:ss"/>
		<fmt:formatDate value="${writedaydate }" var="writedaystring" pattern="yyyy-MM-dd HH:mm"/>
		<B>　${epiloguedetail.mem_nickname}</B>　　조회 ${epiloguedetail.ep_readcount}　　${writedaystring }　　댓글 <font color="#ff8000">　<B><span class="reply_count"></span></B></font></td>
</tr>
<tr>
	<td>　　</td></tr>
<tr>
	<td>　　</td></tr>
<tr>
	<td>　　　　</td>
	<td><img src="${pageContext.request.contextPath}/image/${epiloguedetail.ep_image}" width="600px"></td>
	<td>　　　　</td>
</tr>
<tr>
	<td>　　</td></tr>
<tr>
	<td>　　　　</td>
	<td><textarea id="detailarea" readonly="readonly">${epiloguedetail.ep_content }</textarea></td>
	<td>　　　　</td>
</tr>
<tr>
	<td colspan="3" align="center">
		<input type="hidden" value="${epiloguedetail.mem_no }" readonly="readonly">
		<input type="hidden" name="mem_no" value="${mem_no }" readonly="readonly">
	</td>
</tr>
<tr>
	<td colspan="3" align="center">　　
		<input type="hidden" name="mem_nickname" value="${mem_nickname }" readonly="readonly">
	</td></tr>
<tr>
	<td colspan="3" align="right">　　
		<c:if test="${epiloguedetail.mem_no eq mem_no || mem_id eq 'admin'}">
			<button onclick="location.href='epiloguemodifyselect?ep_no=${epiloguedetail.ep_no }&mem_no=${mem_no }&mem_nickname=${mem_nickname }'"><B>수정</B></button>
			<button id="epiloguedelete"><B>삭제</B></button>
		</c:if>
		<script type="text/javascript">
		$(document).ready(function(){
			$('#epiloguedelete').click(function(){
				let msg = confirm("정말 삭제하시겠습니까?");
				if (msg) {
					var url = "epiloguedelete?ep_no="+"${epiloguedetail.ep_no}";
					$(location).attr('href',url);
				}
			});
		});
		$.ajax({
			url: "replycount",
		    type: "POST",
		    data: {
		    	reply_boardno: ${epiloguedetail.ep_no}
		    },
		    success: function (responseData) {
		    	$("#ajax").remove();
				var count = JSON.parse(responseData);
		    	$(".reply_count").html(count); //span 으로 가서 추천 수 보여줌
		    },
		    error:function(request,error){
		        alert("에러코드 : "+request.status+"\n에러 : "+error);
		        var win = window.open("", "ERROR", "width=500,height=600");
		        win.document.write(request.responseText);
		    }
		});
		</script>
	</td>
</tr>
<jsp:include page="/WEB-INF/views/main/reply.jsp"/>

<tr>
	<td colspan="3">
		<c:choose>
			<c:when test="${move.lastno != 9999}">
				<button id="b2" onclick="location.href='epiloguedetail?ep_no=${move.lastno}'"><B>◀ 이전글</B></button>
			</c:when>
			<c:otherwise>
				<B>이전글이 없습니다</B>
			</c:otherwise>
		</c:choose>
		<button id="b2" onclick="location.href='epilogue'"><B>목록</B></button>
		<c:choose>
			<c:when test="${move.nextno != 9999}">
				<button id="b2" onclick="location.href='epiloguedetail?ep_no=${move.nextno}'"><B>다음글 ▶</B></button>
			</c:when>
			<c:otherwise>
				<B>다음글이 없습니다</B>
			</c:otherwise>
		</c:choose>
	</td>
</tr>
</table>

</body>
</html>