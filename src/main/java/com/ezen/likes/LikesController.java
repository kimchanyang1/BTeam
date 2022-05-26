package com.ezen.likes;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class LikesController {
	
	@Autowired
	private SqlSession sqlSession;

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
	}

	@RequestMapping(value="/likescount")
	@ResponseBody
	public int likescount(@RequestParam("likes_boardno") int likes_boardno)
	{
		LikesService ls = sqlSession.getMapper(LikesService.class);
		int count = ls.likes_count(likes_boardno);
		return count;
	}

}
