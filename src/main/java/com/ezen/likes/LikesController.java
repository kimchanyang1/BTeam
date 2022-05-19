package com.ezen.likes;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

public class LikesController {

	@RequestMapping(method = RequestMethod.POST, value = "/likesupdate")
	public String likesupdate(HttpServletRequest request, SqlSession sqlSession)
	{
		int likes_boardno = Integer.parseInt(request.getParameter("likes_boardno"));
		String likes_id = request.getParameter("likes_id");
		
		Map<String, Object> map = new HashMap<>();
		map.put("likes_boardno", likes_boardno);
		map.put("likes_id", likes_id);
		
		int result = 0;
		
		LikesService ls = sqlSession.getMapper(LikesService.class);
		result = ls.likes_check(map); //동일 게시글에 대한 이전 추천 여부 확인
		
		if(result == 0){ // 추천하지 않았다면 추천 추가
			ls.likes_update(map);
		}else{ // 추천을 하였다면 추천 삭제
			ls.likes_delete(map);
		}
		
		return "";
	}
	
	@RequestMapping(value = "/likescount")
	public String likescount(HttpServletRequest request, SqlSession sqlSession, Model mo)
	{
		int likes_boardno = Integer.parseInt(request.getParameter("likes_boardno"));
		
		int count = 0;
		
		LikesService ls = sqlSession.getMapper(LikesService.class);
		count = ls.likes_count(likes_boardno); //게시글 총 추천 수
		
		mo.addAttribute("count", count);
		
		return "likes";
	}
	
}
