package com.ezen.likes;

import java.util.Map;

public interface LikesService {
	
	public int likes_check(Map<String, Object> map);
	public void likes_update(Map<String, Object> map);
	public void likes_delete(Map<String, Object> map);
	public int likes_count(int likes_boardno);
}
