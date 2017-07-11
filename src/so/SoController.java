package so;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


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
	
}