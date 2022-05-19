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
<script type="text/javascript">
$(document).ready(function(){
	
	$("#likes_update").click(function(){
		alert("추천시작"+";");
		$.ajax({
			url: "likesupdate", //경로... 어케 잡지?
	        type: "POST",
	        data: {
	        	likes_boardno: ${boarddetail.bd_no},
	        	likes_id: ${mem_id}
	        },
	        success: function () {
		        likesCount();
	        },
	        error:function(request,error){
	            alert("에러입니다");
	            alert("리퀘스트 스테이터스 : "+request.status+"\n에러 : "+error+"\n리스폰스텍스트"+request.responseText);
	        }
		});
	});
	
	function likesCount() {
		$.ajax({
			url: "likescount", //경로... 근데 백을 제가 다르게 짜놔서 경로 잡아도 안될듯
            type: "POST",
            data: {
            	likes_boardno: ${boarddetail.bd_no}
            },
            success: function (responseData) {
            	$("#ajax").remove();
    			var count = JSON.parse(responseData);
            	$(".likes_count").html(count); //span 으로 가서 추천 수 보여줌
            },
	        error:function(request,error){
	            alert("에러입니다"+${boarddetail.bd_no}+";");
	            alert("리퀘스트 스테이터스 : "+request.status+"\n에러 : "+error+"\n리스폰스텍스트"+request.responseText);
	        }
		});
    }
    likesCount();
});
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body oncontextmenu='return false' onselectstart='return false' ondragstart='return false'>

<h4><B><font color="#fdafab">자유게시판</font></B></h4>
<br><br>
;${mem_id1};
<table border="0" align="center" width="700">
	<input type="hidden" value="${boarddetail.mem_no }" readonly="readonly">
	<input type="hidden" name="mem_no" value="${mem_no }" readonly="readonly">
	<input type="hidden" name="mem_nickname" value="${mem_nickname }" readonly="readonly">
<tr>
	<td colspan="3" align="left">
		<B>　글번호 ${boarddetail.bd_no}</B>
	</td>
</tr>
<tr>
	<td colspan="3" align="left">
		<h4><B>　${boarddetail.bd_title }</B></h4>
	</td>
</tr>
<tr>
	<td colspan="3" align="left">
		<fmt:parseDate value="${boarddetail.bd_writeday }" var="writedaydate" pattern="yyyy-MM-dd HH:mm:ss"/>
		<fmt:formatDate value="${writedaydate }" var="writedaystring" pattern="yyyy-MM-dd HH:mm"/>
		<B>　${boarddetail.mem_nickname}</B>　　조회 ${boarddetail.bd_readcount}　　${writedaystring }　　댓글 ?　　추천수 ?</td>
</tr>
<tr>
	<td>　　</td></tr>
<tr>
	<td>　　</td></tr>
<tr>
	<td>　　　　</td>
	<td><img src="${pageContext.request.contextPath}/image/${boarddetail.bd_image}" width="500px"></td>
	<td>　　　　</td>
</tr>
<tr>
	<td>　　</td></tr>
<tr>
	<td>　　　　</td>
	<td><textarea id="detailarea" readonly="readonly">${boarddetail.bd_content }</textarea></td>
	<td>　　　　</td>
</tr>
<tr>
	<td colspan="3" align="center">
		<input type="hidden" value="${e.mem_no }" readonly="readonly">
		<input type="hidden" name="mem_no" value="${mem_no }" readonly="readonly">
	</td>
</tr>
<tr>
	<td colspan="3" align="center">　　
		<input type="hidden" name="mem_nickname" value="${mem_nickname }" readonly="readonly">
	</td></tr>
<tr>
	<td colspan="3" align="right">
		<button><a href=""><B>추천</B></a></button>
		<div>
			<c:if test="${ mem_id == null }">
				추천은 로그인 후 사용 가능합니다.
					<i class="fas fa-heart" style="font-size:16px;color:red"></i>
					<span class="likes_count"></span>	
			</c:if>
			<c:if test="${ mem_id != null }">
				<button class="w3-button w3-black w3-round" id="likes_update">
					<i class="fas fa-heart" style="font-size:16px;color:red"></i>
					&nbsp;<span class="likes_count"></span>
				</button> 
			</c:if>
		</div>
		<p id="check">el표기먹는지</p>
		<c:if test="${boarddetail.mem_no eq mem_no || mem_id eq 'admin'}">
			<button onclick="location.href='boardmodifyselect?bd_no=${boarddetail.bd_no }&mem_no=${mem_no }&mem_nickname=${mem_nickname }'"><B>수정</B></button>
			<button onclick="location.href='boarddelete?bd_no=${boarddetail.bd_no }'"><B>삭제</B></button>
		</c:if>
	</td>
</tr>
<tr>
	<td colspan="3">
		<button id="b2" onclick="location.href='boarddetail?bd_no=${(boarddetail.bd_no)-1 }'"><B>◀ 이전글</B></button>
		<button id="b2" onclick="location.href='board'"><B>목록</B></button>
		<button id="b2" onclick="location.href='barddetail?bd_no=${(boarddetail.bd_no)+1 }'"><B>다음글 ▶</B></button>
	</td>
</tr>
</table>

</body>
</html>