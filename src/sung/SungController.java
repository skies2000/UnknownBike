package sung;

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
import org.springframework.web.servlet.ModelAndView;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


@Controller
public class SungController {

	SungDao dao = null;

	public SungController() {

	}

	public SungController(SungDao dao) {
		this.dao = dao;
	}

	@RequestMapping(value = "login/salesHome.sung", method = { RequestMethod.GET, RequestMethod.POST })
	public Object goHome() {
		ModelAndView mv = new ModelAndView(); //setattribute + 디스패쳐

		// mv.addObject("vo", vo);
		  mv.setViewName("sales_home");

		return mv;
	}
	
	/*-----------------req--------------------------------*/
	
	@RequestMapping(value = "login/sales_req_list.sung", method = { RequestMethod.GET, RequestMethod.POST })
	public Object goReq_list(DocumentVo vo) {
		ModelAndView mv = new ModelAndView(); 
		try{
			List<DocumentVo> docuList = dao.docu_reqList(vo);
			mv.addObject("docuList", docuList);
			mv.setViewName("sales_market_req_list");
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return mv;
	}
	
	@RequestMapping(value = "login/sales_req_input.sung", method = { RequestMethod.GET, RequestMethod.POST })
	public Object goReq_input(ProductVo vo, HttpSession session) {
		ModelAndView mv = new ModelAndView(); 
		//세션 아이디값 가져오기
		String userId = (String)session.getAttribute("user");
		
		EmployeeVo evo = new EmployeeVo();
		evo.seteCode(Integer.parseInt(userId));
		
		try{
			EmployeeVo eList = dao.loadUser(evo);
			List<ProductVo> proList = dao.proList(vo);
			
			mv.addObject("proList", proList);
			mv.addObject("eList", eList);
			mv.setViewName("sales_market_req_input");
		}catch (Exception ex) {
			ex.printStackTrace();
		}
		

		return mv;
	}
	//select box값 리턴
	@RequestMapping(value = "login/sales_req_input2.sung", method = { RequestMethod.GET, RequestMethod.POST })
	public void goReq_input2(HttpServletRequest req, HttpServletResponse resp) {
		ProductVo vo = new ProductVo();
		PrintWriter out = null;
		MultipartRequest mul = getMul(req);
		int pCate = Integer.parseInt(mul.getParameter("pCate"));
		vo.setpCate(pCate);
		List<ProductVo> proList = dao.proList2(vo);
		StringBuffer sb = new StringBuffer();
		sb.append("[");
		try{
			out = resp.getWriter();
			for(int i=0; i<proList.size(); i++){
				sb.append("{'pName':'"+proList.get(i).getpName()+"'},");
			}
			sb.append("]");
			String str = sb.toString();
			str = str.replaceAll("'", "\"");
			str = str.replaceAll(",]", "]");
			//없으면 안나옴
			out.print(str);
		}catch (Exception ex) {
			ex.printStackTrace();
		}

	}
	
	//생산 요청내역 db저장
	@RequestMapping(value = "login/sales_req_input3.sung", method = { RequestMethod.GET, RequestMethod.POST })
	public void req_input_db(HttpServletRequest req, HttpServletResponse resp) {
		ProductVo vo = new ProductVo();
		PrintWriter out = null;
		MultipartRequest mul = getMul(req);
		
		String[] cate = mul.getParameterValues("list_cate");
		String[] code = mul.getParameterValues("list_code");
		String[] ea = mul.getParameterValues("list_ea");
		String[] term = mul.getParameterValues("calender");
		/*System.out.println(Arrays.toString(term));*/
		
		for(int i=0; i<cate.length; i++){
			vo.setpCate(Integer.parseInt(cate[i]));
			vo.setCodeName(code[i]);
			vo.setpEa(Integer.parseInt(ea[i]));
			vo.setTerm(term[i]);
		}
		
		List<DocumentVo> dList;
		List<ProductVo> pList;
		
		

	}
	
	//input page에서 생산요청할 제품 뿌려줄것
	@RequestMapping(value = "login/salse_req_input_add.sung", method = { RequestMethod.GET, RequestMethod.POST })
	public void salse_req_input_add(HttpServletRequest req, HttpServletResponse resp) {
		JSONObject jsonObj = new JSONObject();
		JSONArray jsonList = null;
		ProductVo vo = new ProductVo();
		PrintWriter out = null;
		MultipartRequest mul = getMul(req);
		
		int pCate = Integer.parseInt(mul.getParameter("pCate"));
		String pName = mul.getParameter("pName");   
		int pEa = Integer.parseInt(mul.getParameter("pEa"));
		String codeName = mul.getParameter("codeName");
		
		vo.setpCate(pCate);
		vo.setpName(pName);
		vo.setpEa(pEa);
		vo.setCodeName(codeName);
		
		try{
			out = resp.getWriter();
		}catch (Exception ex) {
			ex.printStackTrace();
		}
		if(jsonList == null){
			jsonList = new JSONArray();
			
			jsonObj.put("pCate", vo.getpCate());
			jsonObj.put("pName", vo.getpName());
			jsonObj.put("pEa", vo.getpEa());
			jsonObj.put("codeName", vo.getCodeName());
			
			jsonList.add(jsonObj);
		}else {
			jsonObj.put("pCate", vo.getpCate());
			jsonObj.put("pName", vo.getpName());
			jsonObj.put("pEa", vo.getpEa());
			jsonObj.put("codeName", vo.getCodeName());
			
			jsonList.add(jsonObj);
		}
		
		out.print(jsonList);
	}
	
	
	
	@RequestMapping(value = "login/sales_req_view.sung", method = { RequestMethod.GET, RequestMethod.POST })
	public Object goReq_view() {
		ModelAndView mv = new ModelAndView(); 

		  mv.setViewName("sales_market_req_view");

		return mv;
	}
	
	
	
/*----------------sale-------------------------------*/
	
	
	@RequestMapping(value = "login/sales_sale_input.sung", method = { RequestMethod.GET, RequestMethod.POST })
	public Object goSale_input() {
		ModelAndView mv = new ModelAndView(); 

		  mv.setViewName("sales_market_sale_input");

		return mv;
	}
	
	@RequestMapping(value = "login/sales_sale_list.sung", method = { RequestMethod.GET, RequestMethod.POST })
	public Object goSale_list() {
		ModelAndView mv = new ModelAndView(); 

		  mv.setViewName("sales_market_sale_list");

		return mv;
	}
	
	@RequestMapping(value = "login/sales_sale_view.sung", method = { RequestMethod.GET, RequestMethod.POST })
	public Object goSale_view() {
		ModelAndView mv = new ModelAndView(); 

		  mv.setViewName("sales_market_sale_view");

		return mv;
	}
	
/*	-------------------profit----------------------*/
	
	@RequestMapping(value = "login/sales_profit_view.sung", method = { RequestMethod.GET, RequestMethod.POST })
	public Object goPro_view() {
		ModelAndView mv = new ModelAndView(); 

		  mv.setViewName("sales_profit_view");

		return mv;
	}
	
	@RequestMapping(value = "login/sales_profit_list.sung", method = { RequestMethod.GET, RequestMethod.POST })
	public Object goPro_list() {
		ModelAndView mv = new ModelAndView(); 

		  mv.setViewName("sales_profit_list");

		return mv;
	}
	
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
	
	@RequestMapping(value = "login/sign_popup.sung", method = { RequestMethod.GET, RequestMethod.POST })
	public Object sign_popup() {
		ModelAndView mv = new ModelAndView();
		System.out.println("팝업");
		
		return mv; 
	}
	
	
	
	
	
}
