package beanhoon;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.apache.catalina.servlet4preview.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.util.SystemPropertyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.sun.scenario.animation.shared.PulseReceiver;

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
	
	// 자재 검색 (material search)
	@RequestMapping(value="main/eff.hoon", method={RequestMethod.GET, RequestMethod.POST})
	public Object eff_print(HttpServletRequest req){
		ModelAndView mv = new ModelAndView();
		
		String workStartDate = req.getParameter("workStartDate");
		String workEndDate = req.getParameter("workEndDate");
		int pCode = Integer.parseInt(req.getParameter("pCode"));
		
		PurListVo vo = new PurListVo();
		
		vo.setWorkStartDate(workStartDate);
		vo.setWorkEndDate(workEndDate);
		vo.setpCode(pCode);
		
		List<PurListVo> list1 = dao.effsearchP(vo);
		
		PurListVo voa = dao.proinfo(vo);
		
		int tot = 0;	//제품 총샌산 수량
		int tot1 = 0;	//라인별 생산 수량
		int tot2 = 0;
		int tot3 = 0;
		int tot4 = 0;
		int tot5 = 0;
		
		int cnt1 = 0;	//라인별 카운트
		int cnt2 = 0;
		int cnt3 = 0;
		int cnt4 = 0;
		int cnt5 = 0;
		
		int dys1 = 0;
		int dys2 = 0;
		int dys3 = 0;
		int dys4 = 0;
		int dys5 = 0;
		
		double totaltime1 = 0;
		double totaltime2 = 0;
		double totaltime3 = 0;
		double totaltime4 = 0;
		double totaltime5 = 0;
		
		PurListVo vo1 = new PurListVo();
		PurListVo vo2 = new PurListVo();
		PurListVo vo3 = new PurListVo();
		PurListVo vo4 = new PurListVo();
		PurListVo vo5 = new PurListVo();
		
		for(PurListVo tt : list1) {
			tot += tt.getFlpEa();
			
			if(tt.getWorkLine().equals("1Line")) {
				cnt1 ++;
				tot1 += tt.getFlpEa();
				dys1 += tt.getDys();
				
				double xx = (double)tt.getWorkTime() * (double)tt.getWorkPeople();
				double yy = (double)tt.getFlpEa() * (double)voa.getpManhour();
				
				totaltime1 += (yy/xx) * 100.0;
				
			}
			if(tt.getWorkLine().equals("2Line")) {
				cnt2 ++;
				tot2 += tt.getFlpEa();
				dys2 += tt.getDys();
				
				double xx = (double)tt.getWorkTime() * (double)tt.getWorkPeople();
				double yy = (double)tt.getFlpEa() * (double)voa.getpManhour();
				
				totaltime2 += (yy/xx) * 100.0;
				
			}
			if(tt.getWorkLine().equals("3Line")) {
				cnt3 ++;
				tot3 += tt.getFlpEa();
				dys3 += tt.getDys();
				
				double xx = (double)tt.getWorkTime() * (double)tt.getWorkPeople();
				double yy = (double)tt.getFlpEa() * (double)voa.getpManhour();
				
				totaltime3 += (yy/xx) * 100.0;
			}
			if(tt.getWorkLine().equals("4Line")) {
				cnt4 ++;
				tot4 += tt.getFlpEa();
				dys4 += tt.getDys();

				double xx = (double)tt.getWorkTime() * (double)tt.getWorkPeople();
				double yy = (double)tt.getFlpEa() * (double)voa.getpManhour();
				
				totaltime4 += (yy/xx) * 100.0;
				
			}
			if(tt.getWorkLine().equals("5Line")) {
				cnt5 ++;
				tot5 += tt.getFlpEa();
				dys5 += tt.getDys();

				double xx = (double)tt.getWorkTime() * (double)tt.getWorkPeople();
				double yy = (double)tt.getFlpEa() * (double)voa.getpManhour();
				
				totaltime5 += (yy/xx) * 100.0;
				
			}
		}
		
		try{
			
			voa.setTotalEa(tot);
			if(cnt1>0){
				vo1.setTotalEa(tot1);
				vo1.setDys((int) (tot1/100)*dys1);
				vo1.setTotaleff((int) totaltime1 / cnt1);
			} else {
				vo1.setTotalEa(0);
				vo1.setDys(0);
				vo1.setTotaleff(0);
			}
			
			if(cnt2>0){
				vo2.setTotalEa(tot2);
				vo2.setDys((int) (tot2/100)*dys2);
				vo2.setTotaleff((int) totaltime2 / cnt2);
			} else {
				vo2.setTotalEa(0);
				vo2.setDys(0);
				vo2.setTotaleff(0);
			}
			
			if(cnt3>0) {
				vo3.setTotalEa(tot3);
				vo3.setDys((int) (tot3/100)*dys3);
				vo3.setTotaleff((int) totaltime3 / cnt3);
			} else {
				vo3.setTotalEa(0);
				vo3.setDys(0);
				vo3.setTotaleff(0);
			}
			
			if(cnt4>0) {
				vo4.setTotalEa(tot4);
				vo4.setDys((int) (tot4/100)*dys4);
				vo4.setTotaleff((int) totaltime4 / cnt4);
			} else {
				vo4.setTotalEa(0);
				vo4.setDys(0);
				vo4.setTotaleff(0);
			}
			
			if (cnt5 >0) {
				vo5.setTotalEa(tot5);
				vo5.setDys((int) (tot5/100)*dys5);
				vo5.setTotaleff((int) totaltime5 / cnt5);
			} else {
				vo5.setTotalEa(0);
				vo5.setDys(0);
				vo5.setTotaleff(0);
			}
			
		} catch(Exception e){
			e.printStackTrace();
		}
		
		PurListVo t1 = dao.chartlist1(vo);
		PurListVo t2 = dao.chartlist2(vo);
		PurListVo t3 = dao.chartlist3(vo);
		PurListVo t4 = dao.chartlist4(vo);
		
		mv.addObject("voa", voa);
		mv.addObject("vo1", vo1);
		mv.addObject("vo2", vo2);
		mv.addObject("vo3", vo3);
		mv.addObject("vo4", vo4);
		mv.addObject("vo5", vo5);
		
		mv.addObject("t1", t1);
		mv.addObject("t2", t2);
		mv.addObject("t3", t3);
		mv.addObject("t4", t4);
		
		mv.setViewName("product_eff");
		
		return mv;
	}
}
