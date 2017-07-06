package kimHa;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class kimHaController {
	kimHaDao dao = null;

	public kimHaController() {}
	
	public kimHaController(kimHaDao dao) {
		this.dao = dao;
	}
	
	@RequestMapping(value="main/pDoc.kimHa", method={RequestMethod.GET, RequestMethod.POST})
	public Object pDoc(){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("../laboratory/documentContentInput.html");
		
		
		return mv;
				
	}
	
	@RequestMapping(value="main/appOne.kimHa",method={RequestMethod.GET,RequestMethod.POST})
	public Object appOne(){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("../laboratory/approveMan_one.html");
		
		return mv;
	}
	
	@RequestMapping(value="main/appTwo.kimHa",method={RequestMethod.GET,RequestMethod.POST})
	public Object appTwo(){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("../laboratory/approveMan_two.html");
		
		return mv;
	}
}
