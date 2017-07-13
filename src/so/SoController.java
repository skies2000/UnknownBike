package so;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
	

	
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/detailinfo.so", method={RequestMethod.POST })
	public void detailinfo(HttpServletRequest req, HttpServletResponse res){
		MultipartRequest mul = getMul(req);
		PrintWriter out = null;
		res.setCharacterEncoding("utf-8");
		
		try {
			 out = res.getWriter();
			 
		} catch (IOException e) {
			
		}
		
		Integer.parseInt(mul.getParameter("mCode"));
		SoVo detailpur = new SoVo();
		detailpur.setmCode(Integer.parseInt(mul.getParameter("mCode")));
		SoVo ddpur = dao.dMetarial(detailpur);
		
		JSONArray hjh = new JSONArray();
		JSONObject jjh = new JSONObject();
		jjh.put("mCode", ddpur.getmCode());
		jjh.put("mName", ddpur.getmName());
		jjh.put("mImage", ddpur.getmImage());
		jjh.put("nEa", ddpur.getmEa());
		hjh.add(jjh);
		out.print(hjh);
	
	}
	
@RequestMapping(value="login/needcate.so", method={RequestMethod.GET, RequestMethod.POST })
	public Object needcate(){
		SoVo vo = new SoVo(); 
		ModelAndView mv = new ModelAndView();		
		
		List<SoVo> list2 = dao.nMetarial(vo);
				
		mv.addObject("list",list2);
		
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
	@SuppressWarnings("unchecked")
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
	@SuppressWarnings("unchecked")
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
