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
		$.ajax({
			url: "likesupdate",
	        type: "POST",
	        data: {
	        	likes_boardno: ${boarddetail.bd_no},
	        	likes_id: "${mdto.mem_id}"
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
			url: "likescount",
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
<script type="text/javascript">
$(document).ready(function(){
	$('#boarddelete').click(function(){
		let msg = confirm("정말 삭제하시겠습니까?");
		if (msg) {
			var url = "boarddelete?bd_no="+${boarddetail.bd_no};
			$(location).attr('href',url);
		}
	});
});
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body oncontextmenu='return false' onselectstart='return false' ondragstart='return false'>

<h4><B><font color="#fdafab">자유게시판</font></B></h4>
<br><br>

<table border="0" align="center" width="700">
	<input type="hidden" value="${boarddetail.mem_no }" readonly="readonly">
	<input type="hidden" name="mem_no" value="${mdto.mem_no }" readonly="readonly">
	<input type="hidden" name="mem_nickname" value="${mdto.mem_nickname }" readonly="readonly">
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
			<B>　${boarddetail.mem_nickname}</B>　　조회 ${boarddetail.bd_readcount}　　${writedaystring }　　댓글 ?　　
			추천수 <font color="#ff8000">　<B><span class="likes_count"></span></B></font></td>
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
			<input type="hidden" name="mem_no" value="${mdto.mem_no }" readonly="readonly">
		</td>
	</tr>
	<tr>
		<td colspan="3" align="center">　　
			<input type="hidden" name="mem_nickname" value="${mdto.mem_nickname }" readonly="readonly">
		</td></tr>
	<tr>
		<td colspan="3" align="right">
			<c:if test="${ mdto.mem_id == null }">
				<font color="red"><B>추천은 로그인 후 사용 가능합니다.　</B></font>
				<button>	
					<i class="fas fa-heart" style="font-size:16px;color:red"></i>
					<span class="likes_count"></span>
				</button>	
			</c:if>
			<c:if test="${ mdto.mem_id != null }">
				<button class="w3-button w3-black w3-round" id="likes_update">
					<i class="fas fa-heart" style="font-size:16px;color:red"></i>
					&nbsp;<span class="likes_count"></span>
				</button> 
			</c:if>
			<c:if test="${boarddetail.mem_no eq mdto.mem_no || mdto.mem_id eq 'admin'}">
				<button onclick="location.href='boardmodifyselect?bd_no=${boarddetail.bd_no }&mem_no=${mdto.mem_no }&mem_nickname=${mdto.mem_nickname }'"><B>수정</B></button>
				<button id="boarddelete"><B>삭제</B></button>
			</c:if>
		</td>
	</tr>
	
	
	
	
	<tr>
		<td>　　</td></tr>
	<tr>
		<td>　　</td>
		<td width="500px">　　</td>
		<td>　　</td>
	</tr>
	<tr>
		<td colspan="4" align="center" bgcolor="#fbdee2"><B>　댓글</B>
	</tr>
<c:forEach items="${replist }" var="rep">
	<tr>
		<td colspan="2" height="20px" align="left">
			<input type="hidden" name="rep_no" value="${rep.rep_no }"><B>　${rep.rep_id }</B>
		</td>
	<!-- 작성일자 parseDate로 변환하려 하면 value attribute can not be parsed 오류남  -->	
		<td align="right">
			${rep.rep_writeday}
		</td>
	<!-- 작성일자 parseDate로 변환하려 하면 value attribute can not be parsed 오류남  -->		
	</tr>
	<tr>
		<td>　　</td>
		<td align="left" height="20px">
			${rep.rep_content }
		</td>
		<td>
			<c:if test="${rep.rep_id eq mdto.mem_id || mdto.mem_id eq 'admin'}">
				<a href="boardreplymodify?rep_no=${rep.rep_no }&bd_no=${boarddetail.bd_no }">수정</a>　
				<a href="boardreplydelete?rep_no=${rep.rep_no }&bd_no=${boarddetail.bd_no }">삭제</a>
			</c:if>
		</td>
	</tr>
	<tr>
		<td colspan="3"><hr></td>
	</tr>
</c:forEach>
	<tr>
		<td>
			<c:if test="${ mdto.mem_id != null }">
				<i class="fas fa-user w3-padding-16"> ${ mdto.mem_id }</i>
			</c:if>	
		</td>
		<td>
			<c:if test="${ mdto.mem_id != null }">		
				<form action="boardreplyinput" method="post">
					<input type="hidden" name="bd_no" id="bd_no" value="${ boarddetail.bd_no }"> 
					<input type="hidden" name="mem_id" id="mem_id" value="${ mdto.mem_id }">
						<textarea id="replyarea" name="rep_content"></textarea>
			</c:if>
			<c:if test="${ mdto.mem_id == null }">
				<textarea id="replyarea" readonly="readonly">
	
						댓글 작성은 로그인 후 가능합니다.
				</textarea>
			</c:if>
		</td>
		<td>
			<c:if test="${ mdto.mem_id != null }">
				<B><input id="replybutton" type="submit" value="등록"></B>
				</form>
			</c:if>
			<c:if test="${ mdto.mem_id == null }">
				<button id="replybutton" onclick="location.href='loginform'"><B>로그인</B></button>
			</c:if>
		</td>
	</tr>
	<tr>
		<td>　　</td>
	</tr>
	<tr>
		<td>　　</td>
	</tr>
	<tr>
		<td colspan="3">
			<c:choose>
				<c:when test="${move.lastno != 9999}">
					<button id="b2" onclick="location.href='boarddetail?bd_no=${move.lastno}'"><B>◀ 이전글</B></button>
				</c:when>
				<c:otherwise>
					<B>이전글이 없습니다</B>
				</c:otherwise>
			</c:choose>
			<button id="b2" onclick="location.href='board'"><B>목록</B></button>
			<c:choose>
				<c:when test="${move.nextno != 9999}">
					<button id="b2" onclick="location.href='boarddetail?bd_no=${move.nextno}'"><B>다음글 ▶</B></button>
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