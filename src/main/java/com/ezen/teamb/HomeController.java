package com.ezen.teamb;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.ezen.missing.MissingController;
import com.ezen.missing.MissingDTO;
import com.ezen.missing.MissingService;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ezen.board.BoardController;
import com.ezen.board.BoardDTO;
import com.ezen.board.BoardService;
import com.ezen.epilogue.EpilogueController;
import com.ezen.likes.LikesController;
import com.ezen.member.MemberController;

import com.ezen.notice.NoticeController;
import com.ezen.rehome.RehomeController;
import com.ezen.rehome.RehomeDTO;
import com.ezen.rehome.RehomeService;
import com.ezen.reply.ReplyController;

@Controller
public class HomeController {
	
	@Autowired
	private SqlSession sqlSession;
	
	private NoticeController nc = new NoticeController();
	private MissingController mic = new MissingController();
	private RehomeController rc = new RehomeController();
	private MemberController mc = new MemberController();
	private EpilogueController ep = new EpilogueController();
	private BoardController bc = new BoardController();
	private LikesController lc = new LikesController();
	private ReplyController rep = new ReplyController();
	
	@RequestMapping(value = "/")
	public String home() {
		return "redirect: home";
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
		for (BoardDTO boardDTO : boardlist) {
			int bd_no = boardDTO.getBd_no();
			int bd_likes = lc.likescount(bd_no, sqlSession);
			boardDTO.setBd_likes(bd_likes);
		}
		
		mo.addAttribute("boardlist", boardlist);
		
		return "home";
	}
	
	@RequestMapping(value = "/noticeoutform")
	public String noticepage(
			Model model, 
			@RequestParam(value = "nowPage", required = false)String nowPage
			) {
		return nc.noticepage(sqlSession, model, nowPage);
	}
	
	
	@RequestMapping(value = "/noticeinputform")
	public String noticeinputform(HttpServletRequest request, Model model) {
		return nc.noticeinputform(request, model);
	}
	
	@RequestMapping(method = RequestMethod.POST, value = "/noticeinput")
	public String noticeinput(HttpServletRequest request) {
		return nc.noticeinput(request, sqlSession);
	}
	
	//占쏙옙占쏙옙 占쌘쇽옙占쏙옙占쏙옙占쏙옙
	@RequestMapping(value = "/noticedetail")
	public String noticedetail(HttpServletRequest request, Model model) {
		return nc.noticedetail(request, sqlSession, model);
	}
	
	//占쏙옙占쏙옙 占쏙옙占쏙옙
	@RequestMapping(value = "/noticemodifyform")
	public String noticemodifyform(HttpServletRequest request, Model model) {
		return nc.noticemodifyform(request, sqlSession, model);
	}
	
	//占쏙옙占쏙옙 占쏙옙占쏙옙
	@RequestMapping(value = "/noticemodify")
	public String noticemodify(HttpServletRequest request, Model model) {
		return nc.noticemodify(request, sqlSession, model);
	}
	
	//占쏙옙占쏙옙 占쏙옙占쏙옙
	@RequestMapping(value = "/noticedelete")
	public String noticedelete(HttpServletRequest request, Model model) {
		return nc.noticedelete(request, sqlSession, model);
	}
	
	@RequestMapping(value = "/missinginputform")
	public String missing() {
		return mic.missinginputform();
	}
	
	@RequestMapping(value = "/missinginput")
	public ModelAndView missinginput(MultipartHttpServletRequest request) {
		return mic.missinginput(request, sqlSession);
	}
	
	
	@RequestMapping(value = "/missingdetail")
	public String missingdetail(HttpServletRequest request,Model mo) {
		return mic.missingdetail(request, mo ,sqlSession, rep);
	}
	
	@RequestMapping(value = "/missingdelete")
	public String missingdelete(HttpServletRequest request) {
		return mic.missingdelete(request,sqlSession);
	}
	
	@RequestMapping(value = "/missingmodifyform")
	public String missingmodifyform(HttpServletRequest request, Model mo) {
		return mic.missingmodifyform(request, mo, sqlSession);
	}
	
	@RequestMapping(value = "/missingmodifyinput")
	public ModelAndView missingmodifyinput(MultipartHttpServletRequest request) {
		return mic.missingmodifyinput(request,sqlSession);
	}
	
	
	// 귀가 완료
	@RequestMapping(value = "/missingend")
	public String missingEndPage(
			Model model, 
			@RequestParam(value = "nowPage", required = false)String nowPage
			) {
		return mic.missingEndPage(sqlSession, model, nowPage);
	}
	

	@RequestMapping(value = "/missingoutform")
	public String missingpage(Model mo, PagingDTO dto,@RequestParam(value="nowPage", required=false)String nowPage) {
		return mic.missingpage(dto, mo, sqlSession, nowPage);
	}

	
	@RequestMapping(value = "/rehoming")
	public String rehoming(HttpServletRequest request) {
		return mic.rehoming(request,sqlSession);
	}
	

	
	@RequestMapping(value = "/rehomeinputform")
	public String rhinputform() {
		return rc.rhinputform();
	}
	
	@RequestMapping(value = "/rehomeinput")
	public ModelAndView rhinput(MultipartHttpServletRequest multi) {
		return rc.rhinput(multi, sqlSession);
	}
	
	// REHOME
	@RequestMapping(value = "/rehomeend")
	public String rehomeEndPage(
			Model model, 
			@RequestParam(value = "nowPage", required = false)String nowPage
			) {
		return rc.rehomeEndPage(sqlSession, model, nowPage);
	}
	
	@RequestMapping(value = "/rehomedetail")
	public String rhdetail(HttpServletRequest request, Model mo) {
		return rc.rhdetail(sqlSession, request, mo);
	}
	
	@RequestMapping(value = "/rehomedelete")
	public String rhdelete(HttpServletRequest request, Model mo) {
		return rc.rhdelete(sqlSession, request);
	}
	
	@RequestMapping(value = "/rehomemodifyform")
	public String rhmodifyform(HttpServletRequest request, Model mo) {
		return rc.rhmodifyform(sqlSession, request, mo);
	}
	
	@RequestMapping(value = "/rehomemodify")
	public ModelAndView rhmodify(MultipartHttpServletRequest multi) {
		return rc.rhmodify(sqlSession, multi);
	}
	
	@RequestMapping(value = "/rehomesearch")
	public String rhsearch(HttpServletRequest request, Model mo) {
		return rc.rhsearch(sqlSession, request, mo);
	}
	
	@RequestMapping(value = "/rehomeadmin")
	public String rehomeadmin(Model mo) {
		return rc.rehomeadmin(sqlSession, mo);
	}
	
	@RequestMapping(value = "/rehomeadminsearch")
	public String rehomeadminsearch(HttpServletRequest request, Model mo) {
		return rc.rehomeadminsearch(sqlSession, request, mo);
	}
	
	@RequestMapping(value = "/rehomeok")
	public String rehomeok(HttpServletRequest request) {
		return rc.rehomeok(sqlSession, request);
	}
	
	@RequestMapping(value = "/rehomeimboform")
	public String rehomeimboform(HttpServletRequest request, Model mo) {
		return rc.rehomeimboform(request, mo);
	}
	
	@RequestMapping(value = "/rehomeimbo", method = RequestMethod.POST)
	public String rehomeimbo(HttpServletRequest request) {
		return rc.rehomeimbo(sqlSession, request);
	}
	
	@RequestMapping(value = "/rehomebun")
	public String rehomebun(HttpServletRequest request) {
		return rc.rehomebun(sqlSession, request);
	}
	
	// REHOME
	@RequestMapping(value = "/rehomeoutform")
	public String rehomegpage(Model mo, PagingDTO dto,@RequestParam(value="nowPage", required=false)String nowPage) {
		return rc.rehomepage(dto, mo, sqlSession, nowPage);
	}
	
	@RequestMapping(value = "/rehomeadminpage")
	public String rehomeadminpage(Model mo, PagingDTO dto,@RequestParam(value="nowPage", required=false)String nowPage) {
		return rc.rehomeadminpage(dto, mo, sqlSession, nowPage);
	}
	
	@RequestMapping(value = "/signupform1")
	public String signupform1() {
		return mc.signupform1();
	}
	
	@RequestMapping(value = "/signupform2")
	public String signupform2() {
		return mc.signupform2();
	}
	
	@RequestMapping(value = "/IdCheckForm", method = RequestMethod.GET)
	public @ResponseBody int IdCheckForm(@RequestParam("mem_id") String mem_id, HttpServletResponse response) {
		return mc.IdCheckForm(mem_id, sqlSession, response);
	}
	
	@RequestMapping(value = "/signpolicy")
	public String Signpolicy() {
		return mc.signpolicy();
	}
	
	@RequestMapping(value = "/signupform")
	public String Signupform() {
		return mc.Signupform();
	}
	
	@RequestMapping(value = "/signup", method = RequestMethod.POST)
	public String Signup(HttpServletRequest request) {
		return mc.Signup(request, sqlSession);
	}
	
	@RequestMapping(value = "/loginform")
	public String Loginform() {
		return mc.Loginform();
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String Login(HttpServletRequest request, Model model, HttpServletResponse response) {
		return mc.Login(request, model, sqlSession, response);
	}
	
	@RequestMapping(value = "/logout")
	public String logout(HttpServletRequest request) {
		return mc.Logout(request);
	}
	
	@RequestMapping(value = "/memberdetail")
	public String memberdetail(HttpServletRequest request, Model model) {
		return mc.memberdetail(request, model, sqlSession);
	}
	
	@RequestMapping(value = "/memberwritelist")
	public String memberwritelist(HttpServletRequest request, Model model) {
		return mc.memberwritelist(request, model, sqlSession);
	}
	
	@RequestMapping(value = "/membermissingwrite")
	public String membermissingwrite(HttpServletRequest request, Model model) {
		return mc.membermissingwrite(request, model, sqlSession);
	}
	
	@RequestMapping(value = "/memberrehomewrite")
	public String memberrehomewrite(HttpServletRequest request, Model model) {
		return mc.memberrehomewrite(request, model, sqlSession);
	}
	
	@RequestMapping(value = "/memberepiloguewrite")
	public String memberepiloguewrite(HttpServletRequest request, Model model) {
		return mc.memberepiloguewrite(request, model, sqlSession);
	}
	
	@RequestMapping(value = "/memberboardwrite")
	public String memberboardwrite(HttpServletRequest request, Model model) {
		return mc.memberboardwrite(request, model, sqlSession);
	}
	
	@RequestMapping(value = "/memberdelete")
	public String memberdelete(HttpServletRequest request) {
		return mc.memberdelete(request, sqlSession);
	}
	
	@RequestMapping(value = "/membermodifyform")
	public String membermodifyform(HttpServletRequest request, Model model) {
		return mc.membermodifyform(request, model, sqlSession);
	}
	
	@RequestMapping(value = "/membermodify", method = RequestMethod.POST)
	public String membermodify(HttpServletRequest request, Model model) {
		return mc.membermodify(request, sqlSession, model);
	}
	
	@RequestMapping(value = "/ADmemberPage")
	public String ADmemberPage(
			Model model, 
			@RequestParam(value = "nowPage", required = false)String nowPage
			) {
		return mc.ADmemberPage(sqlSession, model, nowPage);
	}
	
	@RequestMapping(value = "/ADmemberdetail")
	public String ADmemberdetail(HttpServletRequest request, Model model) {
		return mc.ADmemberdetail(request, model, sqlSession);
	}
	
	@RequestMapping(value = "/ADmembersearch")
	public String ADmembersearch(HttpServletRequest request, Model model) {
		return mc.ADmembersearch(sqlSession, request, model);
	}
	
	
	
	//EPILOGUE	
	@RequestMapping(value = "/epilogue")
	public String epiloguepage(Model mo, PagingDTO dto,@RequestParam(value="nowPage", required=false)String nowPage) {
		return ep.epiloguepage(dto, mo, sqlSession, nowPage);
	}
	
	
	// 글쓰기
	@RequestMapping(value = "/epilogueinputform")
	public String ee1(HttpServletRequest request, Model md)	{
					
		return ep.epilogueinputformgo(sqlSession, request, md);
	}
		
	@RequestMapping(value = "/epilogueinput")
	public ModelAndView ee2(MultipartHttpServletRequest multi) {
			
		return ep.epilogueinput(sqlSession, multi);
	}
	
	
	// 디테일
	@RequestMapping(value = "/epiloguedetail")
	public String ee3(HttpServletRequest request, Model md) {
		
		return ep.epiloguedetailform(sqlSession, request, md);
	}
	
	
	// 수정
	@RequestMapping(value = "/epiloguemodifyselect")
	public String ee4(HttpServletRequest request, Model md) {
		
		return ep.epiloguemodifyselect(sqlSession, request, md);
	}
	
	@RequestMapping(value = "/epiloguemodify")
	public ModelAndView ee5(MultipartHttpServletRequest multi) {
		
		return ep.epiloguemodify(sqlSession, multi);
	}
	
	
	// 삭제
	@RequestMapping(value = "/epiloguedelete")
	public String ee6(HttpServletRequest request, Model md) {
		
		return ep.epiloguedelete(sqlSession, request, md);
	}
	
	
	// 검색
	@RequestMapping(value = "/epiloguesearch")
	public String ee7(HttpServletRequest request, Model md) {
			
		return ep.epiloguesearch(sqlSession, request, md);
	}
	
	
	
	
	// BOARD
	@RequestMapping(value = "/board")
	public String boardpage(
			Model model, 
			@RequestParam(value = "nowPage", required = false)String nowPage
			) {
		return bc.boardpage(sqlSession, model, nowPage);
	}
	
	
	// 글쓰기
	@RequestMapping(value = "/boardinputform")
	public String bb1(HttpServletRequest request, Model md)	{
				
		return bc.boardinputformgo(sqlSession, request, md);
	}
	
	@RequestMapping(value = "/boardinput")
	public ModelAndView bb2(MultipartHttpServletRequest multi) {
		
		return bc.boardinput(sqlSession, multi);
	}
	
	
	// 디테일
	@RequestMapping(value = "/boarddetail")
	public String bb3(HttpServletRequest request, Model md) {
		
		return bc.boarddetailform(sqlSession, request, md, rep);
	}
	
	
	// 검색
	@RequestMapping(value = "/boardmodifyselect")
	public String bb4(HttpServletRequest request, Model md) {
		
		return bc.boardmodifyselect(sqlSession, request, md);
	}
	
	@RequestMapping(value = "/boardmodify")
	public ModelAndView bb5(MultipartHttpServletRequest multi) {
		
		return bc.boardmodify(sqlSession, multi);
	}
	
	
	// 占쏙옙占쏙옙
	@RequestMapping(value = "/boarddelete")
	public String bb6(HttpServletRequest request, Model md) {
		
		return bc.boarddelete(sqlSession, request, md);
	}
	
	
	// 占싯삼옙
	@RequestMapping(value = "/boardsearch")
	public String bb7(HttpServletRequest request, Model md) {
		
		return bc.boardsearch(sqlSession, request, md);
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
	
	@RequestMapping(value="/likesupdate")
	public @ResponseBody void likesupdate(@RequestParam("likes_boardno") int likes_boardno, @RequestParam("likes_id") String likes_id) {
		lc.likesupdate(likes_boardno, likes_id, sqlSession);
	}
	
	@RequestMapping(value="/likescount")
	public @ResponseBody int likescount(@RequestParam("likes_boardno") int likes_boardno)
	{
		return lc.likescount(likes_boardno, sqlSession);
	}
	
	
	@RequestMapping(value = "/boardreplydelete")
	public String boardreplydelete(HttpServletRequest request, Model mo) {
		return bc.boardreplydelete(request, mo, sqlSession);
	}
	
	@RequestMapping(value = "/replycount")
	public @ResponseBody int replyCount(@RequestParam("reply_boardno") int reply_boardno) {
		return rep.replyCount(sqlSession, reply_boardno);
	}
	
	@RequestMapping(value = "/replyinput")
	public String replyinput(HttpServletRequest request, Model mo) {
		return rep.replyinput(request, mo, sqlSession);
	}
	
}
