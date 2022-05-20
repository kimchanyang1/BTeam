<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
</head>
<body>

<!-- 추천기능 -->
<!-- https://blog.naver.com/PostView.nhn?blogId=heartflow89&logNo=221042458016&parentCategoryNo=&categoryNo=96&viewDate=&isShowPopularPosts=false&from=postView -->
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

<script type="text/javascript">
$(function(){
	// 추천버튼 클릭시(추천 추가 또는 추천 제거)
	$("#likes_update").click(function(){
		$.ajax({
			url: "/", //경로... 어케 잡지?
            type: "POST",
            data: {
            	likes_boardno: ${b.bd_no},
            	likes_id: ${mem_id}
            },
            success: function () {
		        likesCount();
            }
		})
	})
	
	// 게시글 추천수
    function likesCount() {
		$.ajax({
			url: "/", //경로... 근데 백을 제가 다르게 짜놔서 경로 잡아도 안될듯
            type: "POST",
            data: {
            	likes_boardno: ${b.bd_no}
            },
            success: function (count) {
            	$(".likes_count").html(count); //span 으로 가서 추천 수 보여줌
            },
		})
    }
    likesCount(); // 처음 시작했을 때 실행되도록 해당 함수 호출
});
</script>
	
</body>
</html>