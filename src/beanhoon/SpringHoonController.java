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
	
	// 생산 메인 화면으로 이동
	@RequestMapping(value="main/productHome.hoon", method={RequestMethod.GET, RequestMethod.POST})
	public Object product_home(PurListVo vo){
		ModelAndView mv = new ModelAndView();
		
		// 메인에 뿌려줄 데이터 1 (생산 오더 관리)
		List<PurListVo> list1 = dao.main1(vo);
		mv.addObject("list1", list1);
		
		// 메인에 뿌려줄 데이터 2 (생산 요청서 조회)
		List<PurListVo> list2 = dao.main2(vo);
		mv.addObject("list2", list2);
		
		// 메인에 뿌려줄 데이터 3 (제품 재고)
		List<PurListVo> list3 = dao.main3(vo);
		mv.addObject("list3", list3);
		
		// 메인에 뿌려줄 데이터 4 (자재 재고)
		List<PurListVo> list4 = dao.main4(vo);
		mv.addObject("list4", list4);
				
		mv.setViewName("product_home");
		return mv;
	}
	
	// 생산 오더 관리 화면으로 이동
	@RequestMapping(value="main/reqOdd.hoon", method={RequestMethod.GET, RequestMethod.POST})
	public Object product_odd(PurListVo vo){
		ModelAndView mv = new ModelAndView();
		
		List<PurListVo> list = dao.odd(vo);
		
		mv.addObject("list", list);
		mv.setViewName("product_order");
		return mv;
	}
	
	// 생산 요청서 리스트를 조회 (request list)
	@RequestMapping(value="main/reqList.hoon", method={RequestMethod.GET, RequestMethod.POST})
	public Object product_reqList(PurListVo vo){
		ModelAndView mv = new ModelAndView();
		
		List<PurListVo> list = dao.list(vo);
		
		mv.addObject("list", list);
		mv.setViewName("product_request_list");
		return mv;
	}
	
	// 조회한 리스트에서 보고 싶은 요청서를 클릭했을 때 (request view)
	@RequestMapping(value="main/reqView.hoon", method={RequestMethod.GET, RequestMethod.POST})
	public Object product_reqView(PurListVo vo){
		ModelAndView mv = new ModelAndView();
		
		// 요청서 상단은 요청서 하나만 보기 때문에 list에 담지 않고 vo에 담는다
		PurListVo v = dao.view(vo);
		
		// 작성자와 결재자들 따로 담아서 sign 메소드 실행
		String eName = dao.sign(v.getdWrite()+"");
		String eName1 = dao.sign(v.getdSign1());
		String eName2 = dao.sign(v.getdSign2());
		
		v.seteName(eName);
		v.seteName1(eName1);
		v.seteName2(eName2);
		
		mv.addObject("vo", v);
		
		// 요청서 하단은 여러 작업 정보를 담아와야 하기 때문에 list에 담는다
		List<PurListVo> list = dao.work(vo);
		mv.addObject("list", list); 
		
		mv.setViewName("product_request_view");
		return mv;
	}
	
	// 요청서 리스트 검색
	@RequestMapping(value="main/search.hoon", method={RequestMethod.GET, RequestMethod.POST})
	public Object product_search(PurListVo vo){
		ModelAndView mv = new ModelAndView();
		
		List<PurListVo> list = dao.search(vo);
		mv.addObject("list", list);
		mv.setViewName("product_request_list");
		
		return mv;
	}
	
	// 요청서에서 설정이 필요한 작업 버튼을 눌렀을 때 (request set)
	@RequestMapping(value="main/reqSet.hoon", method={RequestMethod.GET, RequestMethod.POST})
	public Object product_reqSet(PurListVo vo){
		ModelAndView mv = new ModelAndView();

		// 설정 한 개만 보기 때문에 list에 담지 않고 vo에 담는다
		PurListVo v = dao.set(vo);
		
		mv.addObject("vo", v);
		mv.setViewName("product_request_set");
		return mv;
	}
	
	// 작업 설정 화면에서 저장된 데이터를 DB에 저장
	@RequestMapping(value="main/saveData.hoon", method={RequestMethod.GET, RequestMethod.POST})
	public Object product_saveD(PurListVo vo){
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("product_request_set_result");
		
		try {
			// 메세지를 오브젝트에 저장
			String msg = dao.saveData(vo);
			mv.addObject("msg", msg);
			
			// 작업 상태를 따로 담는다
			int srlStatus = dao.updateData(vo);
			vo.setSrlStatus(srlStatus);
			mv.addObject("vo", vo);
			
		} catch (Exception ex) {
			mv.setViewName("product_request_set");
			ex.printStackTrace();
		} finally {
			return mv;
		}
	}
	
	// 제품 재고 조회 (product list)
	@RequestMapping(value="main/listP.hoon", method={RequestMethod.GET, RequestMethod.POST})
	public Object product_listProduct(PurListVo vo){
		ModelAndView mv = new ModelAndView();
		
		List<PurListVo> list = dao.listPro(vo);
		mv.addObject("list", list);
		mv.setViewName("product_stock_product");
		
		return mv;
	}
	
	// 제품 이미지 조회 (material img)
	@RequestMapping(value="main/viewPimg.hoon", method={RequestMethod.GET, RequestMethod.POST})
	public Object product_productImg(PurListVo vo){
		ModelAndView mv = new ModelAndView();
		
		// 설정 한 개만 보기 때문에 list에 담지 않고 vo에 담는다
		PurListVo v = dao.viewP(vo);
				
		mv.addObject("vo", v);
		mv.setViewName("product_stock_p_view");
		return mv;
	}
	
	// 제품 검색 (product search)
	@RequestMapping(value="main/searchP.hoon", method={RequestMethod.GET, RequestMethod.POST})
	public Object product_searchPro(PurListVo vo){
		ModelAndView mv = new ModelAndView();
		
		List<PurListVo> list = dao.searchPro(vo);
		mv.addObject("list", list);
		mv.setViewName("product_stock_product");
		
		return mv;
	}
	
	// 자재 재고 조회 (material list)
	@RequestMapping(value="main/listM.hoon", method={RequestMethod.GET, RequestMethod.POST})
	public Object product_listMaterial(PurListVo vo){
		ModelAndView mv = new ModelAndView();
		
		List<PurListVo> list = dao.listMte(vo);
		mv.addObject("list", list);
		mv.setViewName("product_stock_material");
		
		return mv;
	}
	
	// 자재 이미지 조회 (material img)
	@RequestMapping(value="main/viewMimg.hoon", method={RequestMethod.GET, RequestMethod.POST})
	public Object product_mateialImg(PurListVo vo){
		ModelAndView mv = new ModelAndView();
		
		// 설정 한 개만 보기 때문에 list에 담지 않고 vo에 담는다
		PurListVo v = dao.viewM(vo);
				
		mv.addObject("vo", v);
		mv.setViewName("product_stock_m_view");
		return mv;
	}

	// 자재 검색 (material search)
	@RequestMapping(value="main/searchM.hoon", method={RequestMethod.GET, RequestMethod.POST})
	public Object product_searchMte(PurListVo vo){
		ModelAndView mv = new ModelAndView();

		List<PurListVo> list = dao.searchMte(vo);
		mv.addObject("list", list);
		mv.setViewName("product_stock_material");
		
		return mv;
	}
	
	
}
