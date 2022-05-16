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

<input type="hidden" name="rh_no" value="${rd.rh_no }">
<input type="hidden" name="mem_no" value="${rd.mem_no }">

<table>
	<tr>
		<td>
			<img src="${pageContext.request.contextPath}/image/${rd.rh_image }"> 
		</td>
		<td>
			<table>
				<c:if test="${mem_no eq 0}">
					<tr>
						<th>승인여부</th>
						<td>
							${rd.rh_gb1}
							<button onclick="location.href='rehomeok?rh_no=${rd.rh_no}&rh_gb1=승인'">승인</button>
							<button onclick="location.href='rehomeok?rh_no=${rd.rh_no}&rh_gb1=보류'">보류</button>
							<button onclick="location.href='rehomeok?rh_no=${rd.rh_no}&rh_gb1=거절'">거절</button>
						</td>
					</tr>
				</c:if>
					<tr>
						<th>구분</th>
						<td>
							${rd.rh_gb2}
							<c:if test="${mem_no eq 0}">
								<c:if test="${rd.rh_gb2 eq '임보'}">
									<button onclick="location.href='rehomeimboform?rh_no=${rd.rh_no}'">임시보호 완료</button>
								</c:if>
								<c:if test="${rd.rh_gb2 != '분양완료'}">
									<button onclick="location.href='rehomebun?rh_no=${rd.rh_no}'">분양 완료</button>
								</c:if>
							</c:if>
						</td>
					</tr>
				<tr><th>제목</th><td>	[${rd.rh_gb2 }/${rd.rh_gb3 }]${rd.rh_title}</td></tr>
				<tr><th>반려동물 이름</th><td>${rd.rh_pname }</td></tr>
				<tr><th>반려동물 등록번호</th><td>${rd.rh_pno }</td></tr>
				<tr><th>반려동물 발견장소</th><td>${rd.rh_misplace }</td></tr>
				<tr><th>반려동물 발견날짜</th><td>${rd.rh_misdate }</td></tr>
				<tr><th>임시보호자</th><td>${rd.mem_nickname }</td></tr>
				<tr><th>임시보호자 번호</th><td>${rd.mem_tel }</td></tr>
				<tr><th>게시글 작성날짜</th><td>${rd.rh_writeday }</td></tr>
				<tr><th>조회 수</th><td>${rd.rh_readcount }</td></tr>
				<tr><th>내용</th><td>${rd.rh_content }</td></tr>
			</table>
		</td>
	</tr>
	<tr>
		<td>
			<c:if test="${mem_nickname eq rd.mem_nickname || mem_id eq 'admin'}">
				<a href="rehomemodifyform?rh_no=${rd.rh_no }"><input type="button" value="수정"></a>
				<a href="rehomedelete?rh_no=${rd.rh_no }"><input type="button" value="삭제"></a>
				<c:if test="${rd.rh_gb2 eq '분양완료'}">
					<button onclick="location.href='epilogueinputform?ep_gb=분양완료&ep_originno=${rd.rh_no}'">후기글쓰기</button>
				</c:if>
			</c:if>
		</td>
	</tr>
</table>

</body>
</html>