package com.ezen.teamb;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.ui.Model;

import com.ezen.missing.MissingDTO;
import com.ezen.missing.MissingService;
import com.ezen.board.BoardDTO;
import com.ezen.board.BoardService;
import com.ezen.rehome.RehomeDTO;
import com.ezen.rehome.RehomeService;

@Controller
public class HomeController {
	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value = "/")
	public String home() {
		return "redirect:home";
	}
	
	@RequestMapping(value = "/home")
	public String home1(Model mo) {
		MissingService micdao = sqlSession.getMapper(MissingService.class);
		ArrayList<MissingDTO> missingout = micdao.missingout();
		mo.addAttribute("missingout", missingout);
		
		RehomeService rh = sqlSession.getMapper(RehomeService.class);
		ArrayList<RehomeDTO> rhlist = rh.rehomeoutput();
		mo.addAttribute("rdto", rhlist);
		
		BoardService bs = sqlSession.getMapper(BoardService.class);
		ArrayList<BoardDTO> boardlist = bs.boardmainout();
		mo.addAttribute("boardlist", boardlist);
		
		return "home";
	}
	
	@RequestMapping(value="/policyprivate")
	public String policyprivate()
	{
		return "policyprivate";
	}
	
	@RequestMapping(value="/policyservice")
	public String policyservice()
	{		
		return "policyservice";
	}
	
	@RequestMapping(value="/location")
	public String location()
	{		
		return "location";
	}
	
	
}
