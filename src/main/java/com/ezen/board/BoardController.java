package com.ezen.board;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ezen.member.MemberDTO;
import com.ezen.member.MemberService;
import com.ezen.missing.MissingController;
import com.ezen.notice.NoticeController;

import oracle.net.aso.i;

public class BoardController {

	
	// 자유게시판
	public String boardoutform(SqlSession sqlSession, Model md) {

		BoardService bs = sqlSession.getMapper(BoardService.class);
		ArrayList<BoardDTO> boardlist = bs.boardout();
		md.addAttribute("boardlist", boardlist);
			
		return "boardoutform";
	}
		

	// 글쓰기
	public String boardinputformgo(SqlSession sqlSession, HttpServletRequest request, Model md) {

		HttpSession hs = request.getSession();
		MemberDTO login = (MemberDTO) hs.getAttribute("login");
		
		int mem_no = login.getMem_no();
		String mem_nickname = login.getMem_nickname();
		
		md.addAttribute("mem_no", mem_no);
		md.addAttribute("mem_nickname", mem_nickname);
		
		return "boardinputform";
	}
	
	// input
	public String boardinput(SqlSession sqlSession, MultipartHttpServletRequest multi) {
		
		MultipartFile mf = multi.getFile("bd_image");
		
		String bd_title=multi.getParameter("bd_title");
		String bd_content=multi.getParameter("bd_content");					
		String bd_image=mf.getOriginalFilename();
		
		int mem_no=Integer.parseInt(multi.getParameter("mem_no"));
		String mem_nickname=multi.getParameter("mem_nickname");
		
		BoardService bs = sqlSession.getMapper(BoardService.class);
		bs.boardinput(bd_title, mem_no, mem_nickname, bd_content, bd_image);
		
		return "redirect: board";
	}


	// 디테일
	public String boarddetailform(SqlSession sqlSession, HttpServletRequest request, Model md) {

		HttpSession hs = request.getSession();
		MemberDTO login = (MemberDTO) hs.getAttribute("login");

		if (login != null) {
			
			int mem_no = login.getMem_no();
			String mem_id = login.getMem_id();
			String mem_nickname = login.getMem_nickname();
	    	   
			md.addAttribute("mem_no", mem_no);
			md.addAttribute("mem_id", mem_id);
			md.addAttribute("mem_nickname", mem_nickname);
		}
		
		int bd_no=Integer.parseInt(request.getParameter("bd_no"));
		
		BoardService bs = sqlSession.getMapper(BoardService.class);
		boardreadcount(bd_no, sqlSession);
		ArrayList<BoardDTO> boardlist = bs.boarddetail(bd_no);
		md.addAttribute("boarddetail", boardlist);
		
		return "boarddetailform";
	}
	
	// 조회수 증가
	public void boardreadcount(int bd_no, SqlSession sqlSession) {
		
		BoardService bs = sqlSession.getMapper(BoardService.class);
		bs.boardreadcount(bd_no);
	}


	// 수정
	public String boardmodifyselect(SqlSession sqlSession, HttpServletRequest request, Model md) {
		
		int bd_no=Integer.parseInt(request.getParameter("bd_no"));
		int mem_no=Integer.parseInt(request.getParameter("mem_no"));
		String mem_nickname=request.getParameter("mem_nickname");
		
		BoardService bs = sqlSession.getMapper(BoardService.class);
		ArrayList<BoardDTO> boardlist = bs.boardmodifyselect(bd_no);
		md.addAttribute("boardmodify", boardlist);
		md.addAttribute("mem_no", mem_no);
		md.addAttribute("mem_nickname", mem_nickname);
		
		return "boardmodifyform";
	}
	
	public String boardmodify(SqlSession sqlSession, MultipartHttpServletRequest multi) {
		
		MultipartFile mf = multi.getFile("bd_image");
		
		int bd_no=Integer.parseInt(multi.getParameter("bd_no"));
		String bd_title=multi.getParameter("bd_title");
		String bd_content=multi.getParameter("bd_content");
		String bd_image=mf.getOriginalFilename();
		
		int mem_no=Integer.parseInt(multi.getParameter("mem_no"));
		String mem_nickname=multi.getParameter("mem_nickname");
		
		BoardService bs = sqlSession.getMapper(BoardService.class);
		bs.boardmodify(bd_title, mem_no, mem_nickname, bd_content, bd_image, bd_no);
		
		return "redirect: board";
	}


	// 삭제
	public String boarddelete(SqlSession sqlSession, HttpServletRequest request, Model md) {
		
		int bd_no=Integer.parseInt(request.getParameter("bd_no"));
		
		BoardService bs = sqlSession.getMapper(BoardService.class);
		bs.boarddelete(bd_no);
		
		return "redirect: board";
	}
	
	
	// 검색
	public String boardsearch(SqlSession sqlSession, HttpServletRequest request, Model md) {
		
		String selectname = request.getParameter("selectname");
		String searchname = request.getParameter("searchname");
		
		BoardService bs = sqlSession.getMapper(BoardService.class);
		ArrayList<BoardDTO> boardlist = null;
		
		if(selectname.equals("bd_title"))
		{
			boardlist = bs.searchtitle(searchname);
		}
		else
		{
			boardlist = bs.searchnickname(searchname);
		}
		
		md.addAttribute("boardlist", boardlist);
		
		return "boardoutform";
	}

}