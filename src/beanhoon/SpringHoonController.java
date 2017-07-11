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
	
	
	@RequestMapping(value="login/productHome.hoon", method={RequestMethod.GET, RequestMethod.POST})
	public Object product_home(){
		ModelAndView mv = new ModelAndView();
		// index.jsp?inc=./board/product_home.jsp
		mv.setViewName("product_home");
		
		return mv;
	}
	
	// 생산요청서 리스트를 조회 (request list)
	@RequestMapping(value="login/reqList.hoon", method={RequestMethod.GET, RequestMethod.POST})
	public Object product_reqList(PurListVo vo){
		ModelAndView mv = new ModelAndView();
		
		List<PurListVo> list = dao.list(vo);
		mv.addObject("list", list);
		mv.setViewName("product_request_list");
		
		return mv;
	}
	
	// 조회한 리스트에서 보고 싶은 요청서를 클릭했을 때 (request view)
	@RequestMapping(value="login/reqView.hoon", method={RequestMethod.GET, RequestMethod.POST})
	public Object product_reqView(PurListVo vo){
		ModelAndView mv = new ModelAndView();
		
		// 요청서 하나만 보기 때문에 list에 담지 않고 vo에 담는다
		PurListVo v = dao.view(vo);
		
		mv.addObject("vo", v);
		mv.setViewName("product_request_view");
		return mv;
	}
	
	// 요청서에서 설정이 필요한 작업 버튼을 눌렀을 때 (request set)
	@RequestMapping(value="login/reqSet.hoon", method={RequestMethod.GET, RequestMethod.POST})
	public Object product_reqSet(PurListVo vo){
		ModelAndView mv = new ModelAndView();

		// 설정 한 개만 보기 때문에 list에 담지 않고 vo에 담는다
		PurListVo v = dao.set(vo);
		
		mv.addObject("vo", v);
		mv.setViewName("product_request_set");
		return mv;
	}
	
	// 작업 설정 화면에서 저장된 데이터를 DB에 저장
	@RequestMapping(value="login/saveData.hoon", method={RequestMethod.GET, RequestMethod.POST})
	public Object product_saveD(PurListVo vo){
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("product_request_set_result");
		
		try {
			
			String msg = dao.saveData(vo);
			
			// 메세지를 오브젝트에 저장
			mv.addObject("msg", msg);
			
		} catch (Exception ex) {
			mv.setViewName("product_request_set");
			ex.printStackTrace();
		} finally {
			return mv;
		}
	}
	
	// 제품 재고 조회 (product list)
	@RequestMapping(value="login/listP.hoon", method={RequestMethod.GET, RequestMethod.POST})
	public Object product_listProduct(PurListVo vo){
		ModelAndView mv = new ModelAndView();
		
		List<PurListVo> list = dao.listPro(vo);
		mv.addObject("list", list);
		mv.setViewName("product_stock_product");
		
		return mv;
	}
	
	// 제품 이미지 조회 (material img)
	@RequestMapping(value="login/viewPimg.hoon", method={RequestMethod.GET, RequestMethod.POST})
	public Object product_productImg(PurListVo vo){
		ModelAndView mv = new ModelAndView();
		
		// 설정 한 개만 보기 때문에 list에 담지 않고 vo에 담는다
		PurListVo v = dao.viewP(vo);
				
		mv.addObject("vo", v);
		mv.setViewName("product_stock_p_view");
		return mv;
	}
	
	// 자재 재고 조회 (material list)
	@RequestMapping(value="login/listM.hoon", method={RequestMethod.GET, RequestMethod.POST})
	public Object product_listMaterial(PurListVo vo){
		ModelAndView mv = new ModelAndView();
		
		List<PurListVo> list = dao.listMte(vo);
		mv.addObject("list", list);
		mv.setViewName("product_stock_material");
		
		return mv;
	}
	
	// 자재 이미지 조회 (material img)
	@RequestMapping(value="login/viewMimg.hoon", method={RequestMethod.GET, RequestMethod.POST})
	public Object product_mateialImg(PurListVo vo){
		ModelAndView mv = new ModelAndView();
		
		// 설정 한 개만 보기 때문에 list에 담지 않고 vo에 담는다
		PurListVo v = dao.viewM(vo);
				
		mv.addObject("vo", v);
		mv.setViewName("product_stock_m_view");
		return mv;
	}
		
}
