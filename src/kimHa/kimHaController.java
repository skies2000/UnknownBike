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
	
	@RequestMapping(value="main/test.kimHa", method={RequestMethod.GET, RequestMethod.POST})
	public Object testKimha(){
		ModelAndView mv = new ModelAndView();
		System.out.println("dd");
		return mv;
				
	}
}
