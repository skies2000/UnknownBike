package sung;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
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

	@RequestMapping(value = "main/salesHome.sung", method = { RequestMethod.GET, RequestMethod.POST })
	public Object goHome() {
		ModelAndView mv = new ModelAndView(); //setattribute + 디스패쳐

		// mv.addObject("vo", vo);
		  mv.setViewName("sales_home");

		return mv;
	}
	
	/*-----------------req--------------------------------*/
	
	@RequestMapping(value = "main/sales_req_list.sung", method = { RequestMethod.GET, RequestMethod.POST })
	public Object goReq_list(DocumentVo vo) {
		ModelAndView mv = new ModelAndView(); 
		vo.setdCate("srl");
		try{
			List<DocumentVo> docuList = dao.docu_reqList(vo);
			
			mv.addObject("docuList", docuList);
			mv.setViewName("sales_market_req_list");
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return mv;
	}
	
	//list 검색
	
	@RequestMapping(value = "main/search_list.sung", method = { RequestMethod.GET, RequestMethod.POST })
	public Object search_list(DocumentVo vo) {
		ModelAndView mv = new ModelAndView(); 
		
		System.out.println(vo.getFindStr());
		vo.setdCate("srl");
		try{
			List<DocumentVo> docuList = dao.list_find(vo);
			for(int i=0; i<docuList.size(); i++){
				System.out.println(docuList.get(i).getpName());
				
			}
			mv.addObject("docuList", docuList);
			mv.setViewName("sales_market_req_list");
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return mv;
	}
	
	@RequestMapping(value = "main/sales_req_input.sung", method = { RequestMethod.GET, RequestMethod.POST })
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
	@RequestMapping(value = "main/sales_req_input2.sung", method = { RequestMethod.GET, RequestMethod.POST })
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
				sb.append("{'pName':'"+proList.get(i).getpName()+"',");
				sb.append("'pCode':'"+proList.get(i).getpCode()+"'},");
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
	@RequestMapping(value = "main/sales_req_input3.sung", method = { RequestMethod.GET, RequestMethod.POST })
	public void req_input_db(HttpServletRequest req, HttpServletResponse resp, HttpSession session) {
		PrintWriter out = null;
		MultipartRequest mul = getMul(req);
		
		//세션 아이디값 가져오기
		String userId = (String)session.getAttribute("user");
		
		String code = mul.getParameter("list_code");
		String calender = mul.getParameter("list_term");
		String ea = mul.getParameter("list_ea");
		String appro1 = mul.getParameter("appr_eCode1");
		String appro2 = mul.getParameter("appr_eCode2");
		String srl = mul.getParameter("input_srl");
		String date = mul.getParameter("input_date");
		int writer = Integer.parseInt(userId);
		String subject = "생산요청서";
		String content = "아래와 같이 생산을 요청합니다.";
		String signer = appro1 + "," + appro2;
		
		/*if(code)*/
		String[] spl_code = code.split(",");
		String[] spl_ea = ea.split(",");
		String[] spl_calender = calender.split(",");
		String[] status = signer.split(",");
		//srl에 넣을것
		for(int i=0; i<spl_calender.length; i++){
			ProductVo pvo = new ProductVo();
			
				pvo.setCodeName(spl_code[i]);
				pvo.setpEa(Integer.parseInt(spl_ea[i]));
				pvo.setTerm(spl_calender[i]);
			
				pvo = dao.srlInput(pvo);
		}
		
		//document에 넣을 것
		DocumentVo dvo = new DocumentVo();
		dvo.setdName(subject);
		dvo.setdCont(content);
		dvo.setdDate(date);
		dvo.setdWrite(writer);
		dvo.setdSign(signer);
		dvo.setdStatus(status.length);
		dvo.setdCate(srl);
		
		String msg = dao.document_input(dvo);
	}
	
	//input page에서 생산요청할 제품 뿌려줄것
	@RequestMapping(value = "main/salse_req_input_add.sung", method = { RequestMethod.GET, RequestMethod.POST })
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
	
	@RequestMapping(value = "main/salse_req_input_reset.sung", method = { RequestMethod.GET, RequestMethod.POST })
	public void salse_req_input_reset(HttpServletRequest req, HttpServletResponse resp) {
		PrintWriter out = null;
		MultipartRequest mul = getMul(req);
		
		String eName = mul.getParameter("eName");
		
		req.setAttribute("eName", eName);
		out.print(eName);
		
	}
	
	
	
	@RequestMapping(value = "main/sales_req_view.sung", method = { RequestMethod.GET, RequestMethod.POST })
	public Object goReq_view(DocumentVo dvo) {
		ModelAndView mv = new ModelAndView(); 
		try{
			//상세보기 상단
			dvo.setdCate("srl");
			DocumentVo vo = dao.req_view(dvo);
			mv.addObject("vo", vo);
			
			//상세보기 하단 요청제품리스트
			List<DocumentVo> list = dao.req_view2(dvo);
			mv.addObject("list", list);
			
			//사원코드로 사원이름불러오기
			EmployeeVo evo = new EmployeeVo();
			int wirte = vo.getdWrite();
			evo.seteCode(wirte);
			EmployeeVo writer = new EmployeeVo();
			writer = dao.findEname(evo);
			mv.addObject("writer", writer); //작성자
			
			String sign = vo.getdSign();
			String[] appro = sign.split(",");
			int appro1 = Integer.parseInt(appro[0]);
			int appro2 = Integer.parseInt(appro[1]);
			
			EmployeeVo app1 = new EmployeeVo();
			evo.seteCode(appro1);
			app1 = dao.findEname(evo);
			mv.addObject("app1", app1); //결재자1
			
			EmployeeVo app2 = new EmployeeVo();
			evo.seteCode(appro2);
			app2 = dao.findEname(evo);
			mv.addObject("app2", app2); //결재자2
			
			
			mv.setViewName("sales_market_req_view");
		}catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	
	
	
/*----------------sale-------------------------------*/
	
	
	@RequestMapping(value = "main/sales_sale_input.sung", method = { RequestMethod.GET, RequestMethod.POST })
	public Object goSale_input(ProductVo vo, HttpSession session) {
		ModelAndView mv = new ModelAndView(); 
		//세션 아이디값 가져오기
		String userId = (String)session.getAttribute("user");
				
		EmployeeVo evo = new EmployeeVo();
		evo.seteCode(Integer.parseInt(userId));
		VenderVo vVo = new VenderVo();
		
		try{
			List<VenderVo> list = dao.vender(vVo);
			EmployeeVo eList = dao.loadUser(evo);
			List<ProductVo> proList = dao.proList(vo);
			
			mv.addObject("list", list);
			mv.addObject("proList", proList);
			mv.addObject("eList", eList);
			mv.setViewName("sales_market_sale_input");
		}catch (Exception ex) {
			ex.printStackTrace();
		}
		
		
		mv.setViewName("sales_market_sale_input");

		return mv;
	}
	
	@RequestMapping(value = "main/sales_sale_input2.sung", method = { RequestMethod.GET, RequestMethod.POST })
	public void sale_input2(HttpServletRequest req, HttpServletResponse resp) {
		ProductVo vo = new ProductVo();
		JSONArray jList = new JSONArray();
		PrintWriter out = null;
		MultipartRequest mul = getMul(req);
		int pCate = Integer.parseInt(mul.getParameter("pCate"));
		vo.setpCate(pCate);
		List<ProductVo> proList = dao.proList2(vo);
		for(int i=0; i<proList.size(); i++){
			JSONObject obj = new JSONObject();
			obj.put("pName", proList.get(i).getpName());
			obj.put("pCode", proList.get(i).getpCode());
			jList.add(obj);
		}
		try{
			out = resp.getWriter();
		}catch (Exception e) {
			e.printStackTrace();
		}
		out.print(jList);
		
	}
	
	@RequestMapping(value = "main/sales_sale_list.sung", method = { RequestMethod.GET, RequestMethod.POST })
	public Object goSale_list() {
		ModelAndView mv = new ModelAndView(); 

		  mv.setViewName("sales_market_sale_list");

		return mv;
	}
	
	@RequestMapping(value = "main/sales_sale_view.sung", method = { RequestMethod.GET, RequestMethod.POST })
	public Object goSale_view() {
		ModelAndView mv = new ModelAndView(); 

		  mv.setViewName("sales_market_sale_view");

		return mv;
	}
	
/*	-------------------profit----------------------*/
	
	@RequestMapping(value = "main/sales_profit_view.sung", method = { RequestMethod.GET, RequestMethod.POST })
	public Object goPro_view() {
		ModelAndView mv = new ModelAndView(); 

		  mv.setViewName("sales_profit_view");

		return mv;
	}
	
	@RequestMapping(value = "main/sales_profit_list.sung", method = { RequestMethod.GET, RequestMethod.POST })
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
	/*-------------------------------------팝업창--------------------------------------*/
	
	
	/*결재자 창 띄우기*/
	
	@RequestMapping(value = "main/sign_popup.sung", method = { RequestMethod.GET, RequestMethod.POST })
	public Object sign_popup() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("sales_sign_popup");
		
		return mv; 
	}
	@RequestMapping(value = "main/sign_popup_2.sung", method = { RequestMethod.GET, RequestMethod.POST })
	public Object sign_popup2() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("sales_sign_popup2");
		
		return mv; 
	}
	//결재자 카테고리 선택시
	@RequestMapping(value = "main/sign_popup2.sung", method = { RequestMethod.GET, RequestMethod.POST })
	public void sign_popup2(HttpServletRequest req, HttpServletResponse resp) {
		resp.setCharacterEncoding("UTF-8");
		EmployeeVo vo = new EmployeeVo();
		PrintWriter out = null;
		MultipartRequest mul = getMul(req);
		JSONArray jsonList = new  JSONArray();
		int ePosition = Integer.parseInt(mul.getParameter("em_cate"));
		vo.setePosition(ePosition);
		
		List<EmployeeVo> list = dao.empSearch(vo);
		
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
	@RequestMapping(value = "main/sign_popup3.sung", method = { RequestMethod.GET, RequestMethod.POST })
	public void sign_popup3(HttpServletRequest req, HttpServletResponse resp) {
		resp.setCharacterEncoding("UTF-8");
		EmployeeVo vo = new EmployeeVo();
		PrintWriter out = null;
		MultipartRequest mul = getMul(req);
		JSONArray jsonList = new  JSONArray();
		int eCode = Integer.parseInt(mul.getParameter("eCode"));
		vo.seteCode(eCode);
		
		List<EmployeeVo> list = dao.empSearch2(vo);
		
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
