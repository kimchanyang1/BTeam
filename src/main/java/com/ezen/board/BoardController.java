package com.ezen.board;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.ezen.likes.LikesService;
import com.ezen.reply.ReplyController;
import com.ezen.reply.ReplyService;
import com.ezen.teamb.FileUploadController;
import com.ezen.teamb.MovePageVO;
import com.ezen.teamb.PagingDTO;

@Controller
public class BoardController {
	
	@Autowired
	private SqlSession sqlSession;

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


	// 占쏙옙占쏙옙占쏙옙
	public String boarddetailform(SqlSession sqlSession, HttpServletRequest request, Model md, ReplyController rep) {
		
		int bd_no=Integer.parseInt(request.getParameter("bd_no"));
		
		BoardService bs = sqlSession.getMapper(BoardService.class);
		boardreadcount(bd_no, sqlSession);
		BoardDTO boardlist = bs.boarddetail(bd_no);
		MovePageVO move = bs.boardMovePage(bd_no);
		md.addAttribute("boarddetail", boardlist);
		md.addAttribute("move", move);
		
		rep.replyout("board", bd_no, md, sqlSession);
		
		return "boarddetailform";
	}
	
	// 占쏙옙회占쏙옙 占쏙옙占쏙옙
	public void boardreadcount(int bd_no, SqlSession sqlSession) {
		
		BoardService bs = sqlSession.getMapper(BoardService.class);
		bs.boardreadcount(bd_no);
	}

	// 占쏙옙占쏙옙
	public String boardmodifyselect(SqlSession sqlSession, HttpServletRequest request, Model md) {
		
		int bd_no=Integer.parseInt(request.getParameter("bd_no"));
		
		BoardService bs = sqlSession.getMapper(BoardService.class);
		ArrayList<BoardDTO> boardlist = bs.boardmodifyselect(bd_no);
		md.addAttribute("boardmodify", boardlist);
		
		return "boardmodifyform";
	}
	
	public ModelAndView boardmodify(SqlSession sqlSession, MultipartHttpServletRequest multi) {
		
		MultipartFile mf = multi.getFile("bd_image");
		
		int bd_no=Integer.parseInt(multi.getParameter("bd_no"));
		String bd_title=multi.getParameter("bd_title");
		String bd_content=multi.getParameter("bd_content");
		String bd_image=mf.getOriginalFilename();
		
		
		ModelAndView mav = new ModelAndView();
		BoardService bs = sqlSession.getMapper(BoardService.class);
				
		if(bd_image == "")
		{
			BoardDTO bdto = bs.boarddetail(bd_no);
			bd_image= bdto.getBd_image();
		}
		else
		{
			
			FileUploadController fuc = new FileUploadController();
			try {
				mav = fuc.upload(multi);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		
		mav.setViewName("redirect: board");
		
		int mem_no=Integer.parseInt(multi.getParameter("mem_no"));
		String mem_nickname=multi.getParameter("mem_nickname");
		
		bs.boardmodify(bd_title, mem_no, mem_nickname, bd_content, bd_image, bd_no);
		
		return mav;
	}


	// 占쏙옙占쏙옙
	public String boarddelete(SqlSession sqlSession, HttpServletRequest request, Model md) {
		
		int bd_no=Integer.parseInt(request.getParameter("bd_no"));
		
		BoardService bs = sqlSession.getMapper(BoardService.class);
		bs.boarddelete(bd_no);
		
		return "redirect: board";
	}
	
	
	// 占싯삼옙
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
		LikesService ls = sqlSession.getMapper(LikesService.class);
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
			int bd_likes = ls.likes_count(bd_no);
			boardDTO.setBd_likes(bd_likes);
		}
		model.addAttribute("page", page);
		model.addAttribute("boardlist", list);
		
		return "boardoutform";
	}

	//占쏙옙占� 占쏙옙占쏙옙
	public String boardreplydelete(HttpServletRequest request, Model mo,SqlSession sqlSession)
	{
		int rep_no = Integer.parseInt(request.getParameter("rep_no"));
		
		ReplyService res = sqlSession.getMapper(ReplyService.class);
		res.boardreplydelete(rep_no);
		
		int bd_no = Integer.parseInt(request.getParameter("bd_no"));
		mo.addAttribute("bd_no", bd_no);
		
		return "redirect: boarddetail";
	}

}