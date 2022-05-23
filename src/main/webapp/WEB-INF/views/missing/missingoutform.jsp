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

<h4><B><font color="#fdafab">실종신고 게시판</font></B></h4>
<h6><B>실종된 반려동물을 찾는 게시판입니다</B></h6>
<h6><B><font color="red">* 글쓰기는 로그인 후 가능합니다</font></B></h6>
<br><br>


<table border="0" align="center" width="700">
	<tr>
		<td align="left">　
			<c:if test="${logon eq true && mem_no != null}">
				<button onclick="location.href='missinginputform'"><B>글쓰기</B></button></a>
			</c:if>
		</td>
	</tr>
	<tr>
		<td colspan="6">　　</td></tr>
	<tr>
		<td colspan="6">　　</td></tr>
		
		<td>
		<c:if test="${fn:length(missingout) > 0}">
		<c:forEach var="mic" begin="0" end="${fn:length(missingout)-1}" step="1">		
		<div class="container">
			<div class="row">
			<div class="col-md-4">
				<div class="thumbnail">
				<p align="left"><B>제목</B>　${missingout[mic].mis_title } </p>
					<fmt:parseDate value="${missingout[mic].mis_writeday }" var="writedaydate" pattern="yyyy-MM-dd HH:mm:ss"/>
					<fmt:formatDate value="${writedaydate }" var="writedaystring" pattern="yyyy-MM-dd HH:mm"/>
				<p align="left"><B>일자</B>　${writedaystring } </p>
				<a href="missingdetail?mis_no=${missingout[mic].mis_no}">
			 		<img src="${pageContext.request.contextPath}/image/${missingout[mic].mis_image}" style="width: 200px; height: 200px;">	
				<div class="caption">
					<p><B>${missingout[mic].mem_nickname }</B></p>
				</div>
				</a>
				</div>
			</div>
		<c:if test="${e%3 eq 2}">
		</td>
	</tr>
		</c:if>
		
		</c:forEach>
		</c:if>
		
		 <tr>      
               <td colspan="5">             
               <c:if test="${paging.startPage != 1 }">
               <a href="missingpage?nowPage=${paging.startPage - 1}">&lt;</a>
               </c:if>
                   
               <c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="i">
               	<c:choose>
               		<c:when test="${paging.nowPage eq i}">
               			${i}
               		</c:when>
               		<c:otherwise>
               			<a href="missingpage?nowPage=${i}">${i}</a>
               		</c:otherwise>      		
               	</c:choose>        	
                </c:forEach>
                
               <c:if test="${paging.endPage != paging.lastPage}">
                  <a  href="missingpage?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
               </c:if>
               </td>
            </tr>
	</tbody>

</table>


</body>
</html>