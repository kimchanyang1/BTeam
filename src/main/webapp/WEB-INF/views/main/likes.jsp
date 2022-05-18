<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- 추천기능 -->
<div>
	<c:if test="${ mem_id == null }">
		추천은 로그인 후 사용 가능합니다.
			<i class="fa fa-heart" style="font-size:16px;color:red"></i> <!-- 아이콘이 안먹힌다...! -->
			<span class="likes_count"></span>	<!-- 추천 수 보이는 용도 -->	
	</c:if>
	<c:if test="${ mem_id != null }">
		<button class="w3-button w3-black w3-round" id="likes_update">
			<i class="fa fa-heart" style="font-size:16px;color:red"></i>
			&nbsp;<span class="likes_count"></span>
		</button> 
	</c:if>
</div>
		
</body>
</html>