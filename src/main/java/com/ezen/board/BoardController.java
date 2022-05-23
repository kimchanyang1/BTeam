package com.ezen.board;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.ezen.likes.LikesController;
import com.ezen.member.MemberDTO;
import com.ezen.teamb.FileUploadController;
import com.ezen.teamb.PagingDTO;

public class BoardController {

	
	// 글쓰기
	public String boardinputformgo(SqlSession sqlSession, HttpServletRequest request, Model md) {

		HttpSession hs = request.getSession();
		
		int mem_no = (int) hs.getAttribute("mem_no");
		String mem_nickname = (String) hs.getAttribute("mem_nickname");
		
		md.addAttribute("mem_no", mem_no);
		md.addAttribute("mem_nickname", mem_nickname);
		
		return "boardinputform";
	}
	
	// input
	public ModelAndView boardinput(SqlSession sqlSession, MultipartHttpServletRequest multi) {
		
		MultipartFile mf = multi.getFile("bd_image");
		
		String bd_title=multi.getParameter("bd_title");
		String bd_content=multi.getParameter("bd_content");					
		String bd_image=mf.getOriginalFilename();
		
		ModelAndView mav = new ModelAndView();
		FileUploadController fuc = new FileUploadController();
		try {
			mav = fuc.upload(multi);
		} catch (Exception e) {
			e.printStackTrace();
		}
		mav.setViewName("redirect: board");
		
		int mem_no=Integer.parseInt(multi.getParameter("mem_no"));
		String mem_nickname=multi.getParameter("mem_nickname");
		
		BoardService bs = sqlSession.getMapper(BoardService.class);
		bs.boardinput(bd_title, mem_no, mem_nickname, bd_content, bd_image);
		
		return mav;
	}


	// 디테일
	public String boarddetailform(SqlSession sqlSession, HttpServletRequest request, Model md) {

		HttpSession hs = request.getSession();
		if (hs.getAttribute("mem_no")!=null) {
			int mem_no = (int) hs.getAttribute("mem_no");
			String mem_id = (String) hs.getAttribute("mem_id");
			String mem_nickname = (String) hs.getAttribute("mem_nickname");
			MemberDTO mdto = new MemberDTO();
			mdto.setMem_no(mem_no);
			mdto.setMem_id(mem_id);
			mdto.setMem_nickname(mem_nickname);
			
			md.addAttribute("mdto", mdto);
		}
		
		int bd_no=Integer.parseInt(request.getParameter("bd_no"));
		
		BoardService bs = sqlSession.getMapper(BoardService.class);
		boardreadcount(bd_no, sqlSession);
		BoardDTO boardlist = bs.boarddetail(bd_no);
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


	public String boardpage(SqlSession sqlSession, Model model, String nowPage) {
		BoardService bs = sqlSession.getMapper(BoardService.class);
		LikesController lc = new LikesController();
		int total = bs.boardtotalcount();
		int cntPage = 5;
		int cntPerPage = 15;
		if (nowPage == null) {
			nowPage="1";
		}
		PagingDTO page = new PagingDTO(total, Integer.parseInt(nowPage), cntPerPage, cntPage);
		ArrayList<BoardDTO> list = bs.boardpage(page);
		for (BoardDTO boardDTO : list) {
			int bd_no = boardDTO.getBd_no();
			int bd_likes = lc.likescount(bd_no, sqlSession);
			boardDTO.setBd_likes(bd_likes);
		}
		model.addAttribute("page", page);
		model.addAttribute("boardlist", list);
		return "boardpage";
	}

}