package com.ezen.likes;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.web.bind.annotation.RequestMapping;


public class LikesController {

	@RequestMapping(value = "/likesupdate")
	public void likesupdate(int likes_boardno, String likes_id, SqlSession sqlSession)
	{
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
	}
	
	public int likescount(int likes_boardno, SqlSession sqlSession)
	{
		int count = 0;
		
		LikesService ls = sqlSession.getMapper(LikesService.class);
		count = ls.likes_count(likes_boardno); //게시글 총 추천 수
		
		return count;
	}

}
