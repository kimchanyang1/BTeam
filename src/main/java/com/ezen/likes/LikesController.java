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
		result = ls.likes_check(map); //���� �Խñۿ� ���� ���� ��õ ���� Ȯ��
		
		if(result == 0){ // ��õ���� �ʾҴٸ� ��õ �߰�
			ls.likes_update(map);
		}else{ // ��õ�� �Ͽ��ٸ� ��õ ����
			ls.likes_delete(map);
		}
	}
	
	public int likescount(int likes_boardno, SqlSession sqlSession)
	{
		int count = 0;
		
		LikesService ls = sqlSession.getMapper(LikesService.class);
		count = ls.likes_count(likes_boardno); //�Խñ� �� ��õ ��
		
		return count;
	}

}
