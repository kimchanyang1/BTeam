<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="cdn.jsp"></jsp:include>
<title>분양/임시보호 게시글</title>
</head>
<body>

<input type="hidden" name="rh_no" value="${rd.rh_no }">
<input type="hidden" name="mem_no" value="${rd.mem_no }">

<div class="container form-horizontal">
<div class="text-center">
	<img src="${pageContext.request.contextPath}/image/${rd.rh_image }"> 
</div>
<br>
<div>
	<c:if test="${mem_no eq 0}">
		<div class="col-sm-offset-2 col-sm-2">승인여부</div>
		<div class="col-sm-offset-1">
			${rd.rh_gb1}
				<button class="btn btn-sm btn-primary active" onclick="location.href='rehomeok?rh_no=${rd.rh_no}&rh_gb1=승인'">승인</button>
				<button class="btn btn-sm btn-warning disabled" onclick="location.href='rehomeok?rh_no=${rd.rh_no}&rh_gb1=보류'">보류</button>
				<button class="btn btn-sm btn-danger disabled" onclick="location.href='rehomeok?rh_no=${rd.rh_no}&rh_gb1=거절'">거절</button>
				
		</div>
		<div class="col-sm-offset-2 col-sm-2">임시보호/분양</div>
		<div class="col-sm-offset-1">
			${rd.rh_gb2}
				<c:if test="${rd.rh_gb2 eq '임시보호'}">
					<button class="btn btn-sm btn-success disabled" onclick="location.href='rehomeimboform?rh_no=${rd.rh_no}'">임시보호 완료</button>
				</c:if>
				<c:if test="${rd.rh_gb2 != '분양완료'}">
					<button class="btn btn-sm btn-success active" onclick="location.href='rehomebun?rh_no=${rd.rh_no}'">분양 완료</button>
				</c:if>
		</div>	
	</c:if>
	<br>
	<div class="col-sm-offset-2 col-sm-2">제목</div>
	<div class="col-sm-offset-1">	
		[${rd.rh_gb2 }/${rd.rh_gb3 }]${rd.rh_title}
	</div>
	<div class="col-sm-offset-2 col-sm-2">게시글 작성날짜</div>
	<div class="col-sm-offset-1">	
		${rd.rh_writeday }
	</div>
	<div class="col-sm-offset-2 col-sm-2">게시글 조회수</div>
	<div class="col-sm-offset-1">	
		${rd.rh_readcount }
	</div>
	<br>
	<div class="col-sm-offset-2 col-sm-2">반려동물 이름</div>
	<div class="col-sm-offset-1">	
		${rd.rh_pname }
	</div>
	<div class="col-sm-offset-2 col-sm-2">반려동물 등록번호</div>
	<div class="col-sm-offset-1">	
		${rd.rh_pno }
	</div>
	<div class="col-sm-offset-2 col-sm-2">반려동물 발견장소</div>
	<div class="col-sm-offset-1">	
		${rd.rh_misplace }
	</div>
	<div class="col-sm-offset-2 col-sm-2">반려동물 발견날짜</div>
	<div class="col-sm-offset-1">	
		${rd.rh_misdate }
	</div>
	<br>
	<div class="col-sm-offset-2 col-sm-2">내용</div>
	<div class="col-sm-offset-1">	
		${rd.rh_content }
	</div>
	<br>
	<div class="col-sm-offset-2 col-sm-2">작성자</div>
	<div class="col-sm-offset-1">	
		${rd.mem_nickname }
	</div>
	<div class="col-sm-offset-2 col-sm-2">작성자 연락처</div>
	<div class="col-sm-offset-1">	
		${rd.mem_tel }
	</div>
	<br>
	<div class="text-center">
		<c:if test="${mem_nickname eq rd.mem_nickname || mem_id eq 'admin'}">
			<a href="rehomemodifyform?rh_no=${rd.rh_no }"><input type="button" class="btn btn-lg btn-primary active" value="수정"></a>
			<a href="rehomedelete?rh_no=${rd.rh_no }"><input type="button" class="btn btn-lg btn-primary disabled" value="삭제"></a>
			<c:if test="${rd.rh_gb2 eq '분양완료'}">
				<button onclick="location.href='epilogueinputform?ep_gb=분양완료&ep_originno=${rd.rh_no}'">후기글쓰기</button>
			</c:if>
		</c:if>
	</div>
</div>
</div>

</body>
</html>