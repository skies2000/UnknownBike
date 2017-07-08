package hwan;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@Controller
public class HwanController {
	HwanDao dao = null;
	public HwanController(){
		
	}

	
	public HwanController(HwanDao dao){
		this.dao = dao;
	}
	
	@RequestMapping(value="/login.hwan", method={RequestMethod.GET, RequestMethod.POST })
	public void login(HttpServletRequest req, HttpServletResponse resp){
		resp.setCharacterEncoding("utf-8");
		PrintWriter out = null;
		List<HwanVo> list = dao.loginList();
		StringBuffer sb = new StringBuffer();
		sb.append("[");
		try{
			out = resp.getWriter();
			
			for(int i=0; i<list.size();i++){
				sb.append("{'ecode':'"+list.get(i).ecode+"','epwd':'"+list.get(i).epwd+"'},");
			}
			sb.append("]");
			String str = sb.toString();
			str = str.replaceAll("'", "\"");
			str = str.replaceAll(",]", "]");
			out.print(str);
		}catch(Exception e){ 
			e.printStackTrace();
		}
	}
	@SuppressWarnings("finally")
	@RequestMapping(value="ajaxTest.hwan", method={RequestMethod.POST,RequestMethod.GET})
	public Object ajaxTest(HttpServletRequest req){
		ModelAndView mv = new ModelAndView();
		MultipartRequest mul= null;
		try{
			mul = getMul(req);
		mv.setViewName("testResult.jsp");
		System.out.println("ajaxTest.hwan �떎�뻾");
		System.out.println(mul.getParameter("text1"));
		System.out.println(mul.getParameter("text2"));
		System.out.println(mul.getParameter("text3"));
		System.out.println(mul.getParameter("text4"));
		mv.addObject("msg1",mul.getParameter("text1"));
		mv.addObject("msg2",mul.getParameter("text2"));
		mv.addObject("msg3",mul.getParameter("text3"));
		mv.addObject("msg4",mul.getParameter("text4"));
		}finally{ 
			
			return mv;
		}
	}
	
	@RequestMapping(value = "main/mainIndex.hwan", method = {RequestMethod.GET, RequestMethod.POST})
	public Object mainIndex( HttpServletRequest req){
		ModelAndView mv = new ModelAndView();
		MultipartRequest mul = getMul(req);
		HttpSession session =  req.getSession();
		mv.setViewName("index.jsp");
		session.setAttribute("user", mul.getParameter("userid"));
		return mv;
		
	}
	
	
	@RequestMapping(value = "product_home.hwan", method={RequestMethod.GET, RequestMethod.POST})
	public Object product_home(){
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("../main/index.jsp?inc=../product/product_index.jsp");
		return mv;
	}
	
	
	
	@SuppressWarnings({ "finally", "deprecation" })
	public MultipartRequest getMul(HttpServletRequest req){
		MultipartRequest mul= null;
		
		
		String uploadPath = req.getRealPath("images");
		
		
		try{
			mul = new MultipartRequest(req,uploadPath, 1024*10000,"utf-8",new DefaultFileRenamePolicy());
		}catch(Exception e){
			e.printStackTrace();
			
		}finally {
			return mul;
		}
		
	}
	@RequestMapping(value = "main/pDoc.hwan", method = {RequestMethod.GET, RequestMethod.POST})
	public Object pDoc(){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("../laboratory/documentContentInput.html");
		return mv;
	}
	
	@RequestMapping(value = "main/appOne.hwan", method = {RequestMethod.GET, RequestMethod.POST})
	public Object appOne(){
		ModelAndView mv = new ModelAndView();
		List<HwanVo> list = null;
		list =  dao.appList(); 
		mv.setViewName("../laboratory/approveMan_one.jsp");
		mv.addObject("obj",list);
		return mv;
	}
	
	@RequestMapping(value = "/appTwo.hwan", method = {RequestMethod.GET, RequestMethod.POST})
	public void appTwo(HttpServletResponse resp){
		PrintWriter out = null;
		resp.setCharacterEncoding("utf-8");
		try {
			 out = resp.getWriter();
			 
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		List<HwanVo> list = null;
		list = dao.appList();
		StringBuffer sb = new StringBuffer();
		sb.append("[");
		for(int i=0; i<list.size();i++){
			sb.append("{'ecode':'"+list.get(i).getEcode()+"','ename':'"+list.get(i).getEname()+"',"+
					"'eimage':'"+list.get(i).getEimage()+"'"+
					"},");
		}
		sb.append("]");
			
		String str = sb.toString();
		str = str.replaceAll("'", "\"");
		str = str.replaceAll(",]", "]");
			out.print(str);
	}
	
	@RequestMapping(value = "main/proInput.hwan", method = {RequestMethod.GET, RequestMethod.POST})
	public Object proInput(HwanVo vo){
		ModelAndView mv = new ModelAndView();
		int r = 0;
		String msg = "";
		r = dao.proInput(vo);
		if(r>0){
			msg = "정상적으로 등록되어습니다.";
		}else{
			msg = "다시 입력해 주세요.";
		}
		System.out.println(msg);
		return mv;
	}
	
	@RequestMapping(value="/loginCheck.hwan",method={RequestMethod.GET})
	public void loginCheck(HttpSession session, HttpServletResponse resp){
		PrintWriter out = null;
		resp.setCharacterEncoding("utf-8");
		String loginId = "";
		try {
			 out = resp.getWriter();
			 
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		out.print(session.getAttribute("user"));
		
	}
	@RequestMapping(value="/login/logout.hwan",method={RequestMethod.GET})
	public Object logOut(HttpSession session){
		
		if(session.getAttribute("user") != null)
			session.invalidate();
		return "login.jsp";
	}
	
	
	
	
}