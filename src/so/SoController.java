package so;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import sung.EmployeeVo;
import sung.ProductVo;


@Controller
public class SoController {
	SoDao dao = null;
	public SoController(){
		
	}

	
	public SoController(SoDao dao){
		this.dao = dao;
	}
	
	
	
	@RequestMapping(value="main/purhome.so", method={RequestMethod.GET, RequestMethod.POST })
	public Object goHome(HttpServletRequest req, HttpServletResponse resp){
		ModelAndView mv = new ModelAndView();
		//mv.addObject();
		SoVo vo = new SoVo(); 
		List<SoVo> list1 = dao.fMetarial(vo);
		
		mv.addObject("list",list1);
		mv.setViewName("../main/index.jsp?inc=../purchase/purchase_home.jsp");
	
	    //index.jsp?inc=./board/purchase_home.jsp
		return mv;
	}
	
	
	@RequestMapping(value="main/listcate.so", method={RequestMethod.GET, RequestMethod.POST })
	public Object listcate(SoVo vo){
		ModelAndView mv = new ModelAndView();		
		List<SoVo> list = dao.aMetarial(vo);
				
		mv.addObject("list",list);
		
		mv.setViewName("../main/index.jsp?inc=../purchase/purchase_home.jsp");
	
	    //index.jsp?inc=./board/purchase_home.jsp
		return mv;
	}
	
	
	
	
	//Purchase_Input
	@RequestMapping(value="main/purinput.so", method={RequestMethod.GET, RequestMethod.POST })
	public Object goPInput(@RequestParam(value="checkmaterial") String[] checkmaterial){
		ModelAndView mv = new ModelAndView();
		//mv.addObject();
		SoVo vo = new SoVo();
		List<SoVo>list = dao.checkmaterial(checkmaterial);
		List<SoVo>list1 = dao.fMetarial(vo);
				
		mv.addObject("list",list);
		mv.addObject("list1",list1);
		
		System.out.println(checkmaterial[0]);
		mv.setViewName("../main/index.jsp?inc=../purchase/purchase_Input.jsp");
	
	    //index.jsp?inc=./board/purchase_home.jsp
		return mv;
	}
	
	//Purchase_ReportList
	@RequestMapping(value="main/purRList.so", method={RequestMethod.GET, RequestMethod.POST })
	public Object goPRList(HttpServletRequest req, HttpServletResponse resp){
		ModelAndView mv = new ModelAndView();
		//mv.addObject();
	
		mv.setViewName("../main/index.jsp?inc=../purchase/purchase_ReportList.jsp");
	
	    //index.jsp?inc=./board/purchase_home.jsp
		return mv;
	}
	
	//Purchase_ReportView
	@RequestMapping(value="main/purRView.so", method={RequestMethod.GET, RequestMethod.POST })
	public Object goRView(HttpServletRequest req, HttpServletResponse resp){
		ModelAndView mv = new ModelAndView();
		//mv.addObject();
	
		mv.setViewName("../main/index.jsp?inc=../purchase/purchase_ReportView.jsp");
	
	    //index.jsp?inc=./board/purchase_home.jsp
		return mv;
	}
	
	// PrintWriter를 쓰려고 정환오빠 controller에서 받아온거 
	@SuppressWarnings("finally")
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
	
	//Purchase_ReportView
		@SuppressWarnings("unchecked")
		@RequestMapping(value="/purchase_req_input2.so", method={RequestMethod.GET, RequestMethod.POST })
		public void goInput2(HttpServletRequest req, HttpServletResponse resp, HttpSession session){
			PrintWriter out = getOut(resp);
			MultipartRequest Mul = getMul(req);
			SoVo vo = new SoVo();
			String mCode = Mul.getParameter("mCode");
			String mEa = Mul.getParameter("mEa");
			/*String user = Mul.getParameter("user");?????*/
		
			String str = "";
		
			vo = dao.materialSelectOne(mCode);
			JSONArray ja = new JSONArray();
			JSONObject jo = new JSONObject();
			jo.put("mCode", mCode);
			jo.put("mName", vo.getmName());
			jo.put("mPo", vo.getmPo());
			jo.put("mPrice", vo.getmPrice());
			jo.put("mEa", mEa);
			jo.put("user", (String)session.getAttribute("user"));//사원이름으로
			
			ja.add(jo);
			
			str+=Mul.getParameter("mEa");
			str+=vo.getmName();
			out.print(ja);
			
		    //index.jsp?inc=./board/purchase_home.jsp
			
		}
	
	
	
	
	
/*-------------------------------------팝업창--------------------------------------*/
	
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
	
	
	
	/*결재자 창 띄우기*/
	
	@RequestMapping(value = "main/sign_popup.so", method = { RequestMethod.GET, RequestMethod.POST })
	public Object sign_popup() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("../main/index.jsp?inc=../purchase/purchase_sign_popup.jsp");
		
		return mv; 
	}
	@RequestMapping(value = "main/sign_popup_2.so", method = { RequestMethod.GET, RequestMethod.POST })
	public Object sign_popup2() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("../main/index.jsp?inc=../purchase/purchase_sign_popup2.jsp");
		
		return mv; 
	}
	//결재자 카테고리 선택시
	@RequestMapping(value = "main/sign_popup2.so", method = { RequestMethod.GET, RequestMethod.POST })
	public void sign_popup2(HttpServletRequest req, HttpServletResponse resp) {
		resp.setCharacterEncoding("UTF-8");
		SoVo vo = new SoVo();
		PrintWriter out = null;
		MultipartRequest mul = getMul(req);
		JSONArray jsonList = new  JSONArray();
		int ePosition = Integer.parseInt(mul.getParameter("em_cate"));
		vo.setePosition(ePosition);
		
		List<SoVo> list = dao.empSearch(vo);
		
		try{
			out = resp.getWriter();
		}catch (Exception e) {
			e.printStackTrace();
		}
		

		for(int i = 0; i<list.size(); i++){
			JSONObject obj = new JSONObject();
			obj.put("eCode", list.get(i).geteCode());
			obj.put("eDepart", list.get(i).geteDepart());
			obj.put("eName", list.get(i).geteName());
			obj.put("ePosition", list.get(i).getePosition());
			
			jsonList.add(i, obj);
		}
		out.print(jsonList);
		
	}	
	@RequestMapping(value = "main/sign_popup3.so", method = { RequestMethod.GET, RequestMethod.POST })
	public void sign_popup3(HttpServletRequest req, HttpServletResponse resp) {
		resp.setCharacterEncoding("UTF-8");
		SoVo vo = new SoVo();
		PrintWriter out = null;
		MultipartRequest mul = getMul(req);
		JSONArray jsonList = new  JSONArray();
		int eCode = Integer.parseInt(mul.getParameter("eCode"));
		vo.seteCode(eCode);
		
		List<SoVo> list = dao.empSearch2(vo);
		
		try{
			out = resp.getWriter();
		}catch (Exception e) {
			e.printStackTrace();
		}
	
		JSONObject obj = new JSONObject();
		obj.put("eCode", list.get(0).geteCode());
		obj.put("eDepart", list.get(0).geteDepart());
		obj.put("eName", list.get(0).geteName());
		obj.put("ePosition", list.get(0).getePosition());
			
		jsonList.add(obj);
		out.print(jsonList);
		
		/*req.setAttribute("eCode", list.get(0).geteCode());
		req.setAttribute("eDepart", list.get(0).geteDepart());
		req.setAttribute("eName", list.get(0).geteName());
		req.setAttribute("ePosition", list.get(0).getePosition());*/
		
	}	
	
	
	
	
	
	
}