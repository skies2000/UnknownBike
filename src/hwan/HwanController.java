package hwan;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.sun.xml.internal.bind.v2.runtime.unmarshaller.XsiNilLoader.Array;

@Controller
public class HwanController {
	HwanDao dao = null;
	public HwanController(){
		
	}

	
	public HwanController(HwanDao dao){
		
		this.dao = dao;
		
		
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/login.hwan", method={RequestMethod.GET, RequestMethod.POST })
	public void login(HttpServletRequest req, HttpServletResponse resp){
		PrintWriter out = getOut(resp);
		List<HwanVo> list = dao.loginList();
		JSONArray ja = new JSONArray();
		try{
			
			for(int i=0; i<list.size();i++){
				JSONObject jo = new JSONObject();
				jo.put("ecode", list.get(i).getEcode());
				jo.put("epwd", list.get(i).getEpwd());
				ja.add(jo);
			}
			out.print(ja);
		}catch(Exception e){ 
			e.printStackTrace();
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
	
	
	
	@SuppressWarnings({ "finally", "deprecation" })//MultipartiRequest생성 절차 메소드로 구성
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
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/appTwo.hwan", method = {RequestMethod.GET, RequestMethod.POST})
	public void appTwo(HttpServletResponse resp){
		PrintWriter out = getOut(resp);
	
		
		List<HwanVo> list = null;
		list = dao.appList();
		JSONArray jarr = new JSONArray();
		
		
		for(int i=0; i<list.size();i++){
			
			JSONObject json = new JSONObject();
			json.put("ecode", list.get(i).getEcode());
			json.put("ename", list.get(i).getEname());
			json.put("eimage", list.get(i).getEimage());
			
			jarr.add(json);
			
		}
			out.print(jarr);
	}
	
	@RequestMapping(value = "/proInput.hwan", method = {RequestMethod.GET, RequestMethod.POST})
	public void proInput(HttpServletRequest req, HttpServletResponse resp, HttpSession session){
		MultipartRequest mul = getMul(req);
		PrintWriter out = getOut(resp);
		HwanVo vo =  new HwanVo();
		String[] pManArr = null;
		String pManStr = "";
		
		
		vo.setDname(mul.getParameter("dname"));
		vo.setPname(mul.getParameter("pname"));
		vo.setPdev((String)session.getAttribute("user"));
		vo.setdWrite(vo.getPdev());
		vo.setPcate(Integer.parseInt(mul.getParameter("pcate")));
		pManArr = mul.getParameterValues("appMember");
		pManStr = pManArr[0];
		
		for(int i=1; i<pManArr.length; i++){
			pManStr+=","+pManArr[i];
		}
		vo.setdSign(pManStr);
		vo.setdStatus(pManArr.length);
		
		
		
		System.out.println("pdev : "+vo.getPdev());
		
		System.out.println("arr : "+Arrays.toString(pManArr));
		System.out.println("arr-len: "+pManArr.length);
		System.out.println("str-split : "+pManStr);
		
		System.out.println("pcate : "+vo.getPcate());
		
	
		
		int r = 0;
		String msg = "";
		r = dao.proInput(vo);
		if(r>0){
			r = 1;
		}else{
			r = -1;
		}
		out.print(-1);
	}
	
	@RequestMapping(value="/loginCheck.hwan",method={RequestMethod.GET})
	public void loginCheck(HttpSession session, HttpServletResponse resp){
		PrintWriter out = getOut(resp);
		
		out.print(session.getAttribute("user"));
		
	}
	@RequestMapping(value="/login/logout.hwan",method={RequestMethod.GET})
	public Object logOut(HttpSession session){
		
		if(session.getAttribute("user") != null)
			session.invalidate();
		return "login.jsp";
	}
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/pro_mat_List.hwan",method={RequestMethod.GET})
	public void pro_mat_List(HttpServletResponse resp){
			PrintWriter out = getOut(resp);
			List<HwanVo>list = dao.proInputMatList();
			JSONArray jArr = new JSONArray();
			
			for(int i=0; i<list.size();i++){
				JSONObject jObj = new JSONObject();
				jObj.put("mcode", list.get(i).getMcode());
				jObj.put("mname", list.get(i).getMname());
				jObj.put("mimage", list.get(i).getMimage());
				
				jArr.add(jObj);
			}
			out.print(jArr);
	}
	
	
	
	@SuppressWarnings("finally")//out.print 쓰기위한 절차 메소드로 구성
	public PrintWriter getOut(HttpServletResponse resp){
		resp.setCharacterEncoding("utf-8");
		PrintWriter out = null;
		
		try{
			out = resp.getWriter();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			return out;
		}
	}
	
	
}