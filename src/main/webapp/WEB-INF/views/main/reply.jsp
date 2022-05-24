<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- https://blog.naver.com/PostView.naver?blogId=heartflow89&logNo=221047411199&parentCategoryNo=&categoryNo=96&viewDate=&isShowPopularPosts=false&from=postView -->

<div class="w3-border w3-padding">댓글</div>
			<div class="w3-border w3-padding">
				<c:if test="${ mdto.mem_id == null }">
					<textarea rows="5" cols="50" class="w3-input w3-border newLogin" readonly>로그인 후 댓글 달기</textarea>
				</c:if>
				<c:if test="${ mdto.mem_id != null }">
					<i class="fas fa-user w3-padding-16"></i> ${ mdto.mem_id }
					<form action="replyinput" method="post">
						<input type="hidden" name="bd_no" id="bd_no" value="${ boarddetail.bd_no }"> 
						<input type="hidden" name="mem_id" id="mem_id" value="${ mdto.mem_id }">
						<textarea rows="5" cols="50" class="w3-input w3-border" placeholder="댓글 작성" name="rep_content" id="rep_content"></textarea>
						<input type="submit" class="w3-button w3-border" id="reply_btn" value="댓글 등록">
					</form>
				</c:if>
			</div>

<table>
	<c:forEach items="${replist }" var="rep">
		<tr>
			<td>
				${rep.rep_id }
			</td>
			<td>
				${rep.rep_content }
			</td>
		</tr>
	</c:forEach>
</table>
</body>
</html>