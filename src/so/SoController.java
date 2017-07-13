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
import org.springframework.web.servlet.ModelAndView;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


@Controller
public class SoController {
	SoDao dao = null;
	public SoController(){
		
	}

	
	public SoController(SoDao dao){
		this.dao = dao;
	}
	
	
	
	@RequestMapping(value="login/purhome.so", method={RequestMethod.GET, RequestMethod.POST })
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
	
	
	@RequestMapping(value="login/listcate.so", method={RequestMethod.GET, RequestMethod.POST })
	public Object listcate(SoVo vo){
		ModelAndView mv = new ModelAndView();		
		
		List<SoVo> list = dao.aMetarial(vo);
				
		mv.addObject("list",list);
		
		mv.setViewName("../main/index.jsp?inc=../purchase/purchase_home.jsp");
	
	    //index.jsp?inc=./board/purchase_home.jsp
		return mv;
	}
	
	@SuppressWarnings({ "deprecation", "finally" })
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
	@RequestMapping(value="login/purinput.so", method={RequestMethod.GET, RequestMethod.POST })
	public Object goPInput(HttpServletRequest req, HttpServletResponse resp){
		ModelAndView mv = new ModelAndView();
		//mv.addObject();
	
		mv.setViewName("../main/index.jsp?inc=../purchase/purchase_Input.jsp");
	
	    //index.jsp?inc=./board/purchase_home.jsp
		return mv;
	}
	
	//Purchase_ReportList
	@RequestMapping(value="login/purRList.so", method={RequestMethod.GET, RequestMethod.POST })
	public Object goPRList(HttpServletRequest req, HttpServletResponse resp){
		ModelAndView mv = new ModelAndView();
		//mv.addObject();
	
		mv.setViewName("../main/index.jsp?inc=../purchase/purchase_ReportList.jsp");
	
	    //index.jsp?inc=./board/purchase_home.jsp
		return mv;
	}
	
	//Purchase_ReportView
	@RequestMapping(value="login/purRView.so", method={RequestMethod.GET, RequestMethod.POST })
	public Object goRView(HttpServletRequest req, HttpServletResponse resp){
		ModelAndView mv = new ModelAndView();
		//mv.addObject();
	
		mv.setViewName("../main/index.jsp?inc=../purchase/purchase_ReportView.jsp");
	
	    //index.jsp?inc=./board/purchase_home.jsp
		return mv;
	}
	
	@RequestMapping(value="login/pursearch.so", method={RequestMethod.GET, RequestMethod.POST })
	public Object goSearch(SoVo vo){
		ModelAndView mv = new ModelAndView();	
		
		List<SoVo> list = dao.sMetarial(vo);
		mv.addObject("list",list);
		mv.setViewName("../main/index.jsp?inc=../purchase/purchase_home.jsp");	
	    //index.jsp?inc=./board/purchase_home.jsp
		return mv;
	}
	}