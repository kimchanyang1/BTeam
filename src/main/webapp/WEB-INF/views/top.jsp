<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">

</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<header style="text-align: center;">
	<h1>?????????</h1>
</header>
<nav class="navbar navbar-inverse">
	<div class="container-fluid">
		<div class="navbar-header">
		<a class="navbar-brand" href="home"><span class="glyphicon glyphicon-home"></span></a>
		</div>
		<ul class="nav navbar-nav">
			<li class="active">
				<a href="notice">공지</a>
        	</li>
			<li class="active">
				<a href="missing">실종신고</a>
        	</li>
			<li class="active">
				<a href="rehome">분양/임시보호</a>
        	</li>
			<li class="active">
				<a class="dropdown-toggle" data-toggle="dropdown" href="#">
					실종/분양 후기<span class="caret"></span>
				</a>
				<ul class="dropdown-menu">
					<li><a href="missingend">귀가 완료</a></li>
					<li><a href="rehomeend">분양 완료</a></li>
					<li><a href="epilogue">후기</a></li>
				</ul>
        	</li>
        	<li class="active">
				<a href="board">자유게시판</a>
        	</li>
		</ul>
		<ul class="nav navbar-nav navbar-right">
			<li><a href="memberinput"><span class="glyphicon glyphicon-user"></span> 회원가입</a></li>
		
			<li><a href="logingo"><span class="glyphicon glyphicon-log-in"></span> 로그인</a></li>
		
		
		
		</ul>
	</div>
</nav>
</body>
</html>