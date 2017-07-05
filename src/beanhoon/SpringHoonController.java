package beanhoon;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SpringHoonController {
	HoonDao dao;


	public SpringHoonController(HoonDao dao) {
		this.dao = dao;
	}
	
	
	@RequestMapping(value="main/productHome.hoon", method={RequestMethod.GET, RequestMethod.POST})
	public Object product_home(){
		ModelAndView mv = new ModelAndView();
		// index.jsp?inc=./board/product_home.jsp
		mv.setViewName("product_home");
		
		return mv;
	}
	
	@RequestMapping(value="main/reqList.hoon", method={RequestMethod.GET, RequestMethod.POST})
	public Object product_reqList(PurListVo vo){
		ModelAndView mv = new ModelAndView();
		
		List<PurListVo> list = dao.list(vo);
		System.out.println(list.get(0).getdName());
		mv.addObject("list", list);
		mv.setViewName("product_request_list");
		
		return mv;
	}
}
