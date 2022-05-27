package com.ezen.likes;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ezen.board.BoardController;


@Controller
public class LikesController {
	
	@Autowired
	private SqlSession sqlSession;
	
	private BoardController bc = new BoardController();

	@RequestMapping(value = "/likesupdate")
	@ResponseBody
	public void likesupdate(@RequestParam("likes_boardno") int likes_boardno, @RequestParam("likes_id") String likes_id)
	{
		LikesService ls = sqlSession.getMapper(LikesService.class);
		Map<String, Object> map = new HashMap<>();
		map.put("likes_boardno", likes_boardno);
		map.put("likes_id", likes_id);
		
		int result = 0;
		result = ls.likes_check(map); //���� �Խñۿ� ���� ���� ��õ ���� Ȯ��
		
		if(result == 0){ // ��õ���� �ʾҴٸ� ��õ �߰�
			ls.likes_update(map);
		}else{ // ��õ�� �Ͽ��ٸ� ��õ ����
			ls.likes_delete(map);
		}
		int bd_likes = likescount(likes_boardno, sqlSession);
		map.put("bd_likes", bd_likes);
		bc.likesUpdate(sqlSession, map);
	}

	@RequestMapping(value="/likescount")
	@ResponseBody
	public int likescountform(@RequestParam("likes_boardno") int likes_boardno)
	{
		return likescount(likes_boardno, sqlSession);
	}
	

	public int likescount(int likes_boardno, SqlSession sqlSession)
	{
		LikesService ls = sqlSession.getMapper(LikesService.class);
		int count = ls.likes_count(likes_boardno);
		return count;
	}

}
