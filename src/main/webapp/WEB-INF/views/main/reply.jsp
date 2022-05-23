<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$("#reply_btn").click(function(){
	if($("#rep_content").val().trim() == ""){
		alert("댓글을 입력하세요.");
		$("#rep_content").val("").focus();
	}else{
		$.ajax({
			url: "replyinput",
            type: "POST",
            data: {
            	bd_no : $("#bd_no").val(),
            	mem_id : $("#mem_id").val(),
                rep_content : $("#rep_content").val()
            },
            success: function () {
            	alert("댓글 등록 완료");
            	$("#rep_content").val("");
            	getReply();
            },
		})
	}
})
</script>
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
					<form>
						<input type="hidden" name="bd_no" id="bd_no" value="${ boarddetail.bd_no }"> 
						<input type="hidden" name="mem_id" id="mem_id" value="${ mdto.mem_id }">
						<textarea rows="5" cols="50" class="w3-input w3-border" placeholder="댓글 작성" name="rep_content" id="rep_content"></textarea>
						<input type="button" class="w3-button w3-border" id="reply_btn" value="댓글 등록">
					</form>
				</c:if>
			</div>

</body>
</html>