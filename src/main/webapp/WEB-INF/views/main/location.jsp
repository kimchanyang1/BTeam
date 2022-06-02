<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1 style="text-align: center;">오시는길</h1>
<h3 style="text-align: center;">경기 수원시 팔달구 향교로 2 3층</h3>
<!-- * 카카오맵 - 지도퍼가기 -->
<!-- 1. 지도 노드 -->

<div id="daumRoughmapContainer1652112035452" class="root_daum_roughmap root_daum_roughmap_landing" style="margin-left: auto; margin-right: auto;"></div>

<!--
	2. 설치 스크립트
	* 지도 퍼가기 서비스를 2개 이상 넣을 경우, 설치 스크립트는 하나만 삽입합니다.
-->

<script charset="UTF-8" class="daum_roughmap_loader_script" src="https://ssl.daumcdn.net/dmaps/map_js_init/roughmapLoader.js"></script>

<!-- 3. 실행 스크립트 -->

<script charset="UTF-8">
	new daum.roughmap.Lander({
		"timestamp" : "1652112035452",
		"key" : "2a6ak",
		"mapWidth" : "640", 
		"mapHeight" : "360" 
	}).render();
</script>

</body>
</html>