package so;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.sun.org.apache.xerces.internal.util.Status;

import sung.DocumentVo;
import sung.EmployeeVo;
import sung.ProductVo;


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
	public Object listcate(HttpServletRequest req, HttpServletResponse res){
		res.setCharacterEncoding("utf-8");
		MultipartRequest mul = getMul(req);
		
		int mCate = Integer.parseInt(mul.getParameter("mCate"));
		List<SoVo> list = new ArrayList<SoVo>();
		
		SoVo vo = new SoVo();
		vo.setmCate(mCate);
		list = dao.aMetarial(vo);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("list",list);
		mv.setViewName("../main/index.jsp?inc=../purchase/purchase_home.jsp");
	
		return mv;
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
	
@RequestMapping(value="main/needcate.so", method={RequestMethod.GET, RequestMethod.POST })
	public Object needcate(HttpServletRequest req, HttpServletResponse res){
		SoVo vo = new SoVo(); 
		ModelAndView mv = new ModelAndView();		
		
		List<SoVo> list2 = dao.nMetarial(vo);
				
		mv.addObject("list",list2);
		
		mv.setViewName("../main/index.jsp?inc=../purchase/purchase_home.jsp");
	
	    //index.jsp?inc=./board/purchase_home.jsp
		return mv;
		
	}
	
//보고서 상세
@RequestMapping(value="main/purviewdetail.so", method={RequestMethod.GET, RequestMethod.POST })
public Object goPVD(HttpServletRequest req, HttpServletResponse resp){
	ModelAndView mv = new ModelAndView();
	//mv.addObject();

	mv.setViewName("../main/index.jsp?inc=../purchase/purchase_ReportView.jsp");

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
	public void goPRList(HttpServletRequest req, HttpServletResponse resp, HttpSession session){
		ModelAndView mv = new ModelAndView();
		PrintWriter out = getOut(resp);
		MultipartRequest mul = getMul(req);
		
		SoVo vo = new SoVo();
		
		String dName = mul.getParameter("pisub");//문서제목
		String dCate = mul.getParameter("input_pur");//문서종류
		String dDate = mul.getParameter("input_date");
		String pur = mul.getParameter("input_pur");
		String user = (String)session.getAttribute("user");
		int dWrite = Integer.parseInt(user);
		String appro1 = mul.getParameter("h_piappro1");
		String appro2 = mul.getParameter("h_piappro2");
		String signer = appro1 + "," + appro2;
		
		String mCode = mul.getParameter("mCode");
		String mName = mul.getParameter("mName");
		String mPo = mul.getParameter("mPo");
		String mEa = mul.getParameter("mEa");
		String mPrice = mul.getParameter("mPrice");


		System.out.println(dName);
		System.out.println(dCate);
		System.out.println(dDate);
		
		System.out.println(appro1);
		System.out.println(appro2);
		System.out.println(signer);
		
		
		/*if(code)*/
		String[] spl_code = mCode.split(",");
		String[] spl_name = mName.split(",");
		String[] spl_po = mPo.split(",");
		String[] spl_ea = mEa.split(",");
		String[] spl_price = mPrice.split(",");
		String[] status = signer.split(",");
		
		//구매리스트에 추가.. .. ... .. ...
		for(int i=0;i<spl_code.length;i++){
			SoVo v = new SoVo();
			v.setPlMCode(Integer.parseInt(spl_code[i]));
			v.setPlModel(spl_name[i]);
			v.setPlPur(spl_po[i]);
			v.setPlMEa(Integer.parseInt(spl_ea[i]));
			v.setPlPrice(Integer.parseInt(spl_price[i]));
			
			String msg1 = dao.purInput(v);
		}
		
		System.out.println("dName: " + dName);
		System.out.println("dCate: " + dCate);
		System.out.println("dDate: "+dDate);
		System.out.println("dWrite: " +dWrite);
		System.out.println("signer: " + signer);
		System.out.println("statusL : " + status.length);
		System.out.println("pur : " + pur);
		
		
		//document에 넣을 것
		SoVo svo = new SoVo();
		svo.setdName(dName);
		svo.setdDate(dDate);
		svo.setdWrite(dWrite);
		svo.setdSign(signer);
		svo.setdStatus(status.length);
		svo.setdCate(pur);
		
		String msg2 = dao.purDocumentInput(svo);
		
		
			JSONObject obj = new JSONObject();
			obj.put("msg", "1");

			out.print(obj);
		
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
	

	// PrintWriter를 쓰려고 정환오빠 controller에서 받아온거 
	@SuppressWarnings("finally")
	public PrintWriter getOut(HttpServletResponse resp){
		resp.setCharacterEncoding("utf-8");
		PrintWriter out = null;
		
		try{
			out = resp.getWriter();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			return out;
		}
	}
	
	//Purchase_ReportView
		@SuppressWarnings("unchecked")
		@RequestMapping(value="/purchase_req_input2.so", method={RequestMethod.GET, RequestMethod.POST })
		public void goInput2(HttpServletRequest req, HttpServletResponse resp, HttpSession session){
			PrintWriter out = getOut(resp);
			MultipartRequest Mul = getMul(req);
			SoVo vo = new SoVo();
			String mCode = Mul.getParameter("mCode");
			String mEa = Mul.getParameter("mEa");
			/*String user = Mul.getParameter("user");?????*/
		
			String str = "";
		
			vo = dao.materialSelectOne(mCode);
			JSONArray ja = new JSONArray();
			JSONObject jo = new JSONObject();
			jo.put("mCode", mCode);
			jo.put("mName", vo.getmName());
			jo.put("vName", vo.getvName());
			jo.put("mPrice", vo.getmPrice());
			jo.put("mEa", mEa);
			jo.put("eName",vo.geteName());//사원이름으로
			
			ja.add(jo);
			
			str+=Mul.getParameter("mEa");
			str+=vo.geteName();
			out.print(ja);
			
		    //index.jsp?inc=./board/purchase_home.jsp
			
		}
		//list뿌려주기(report_list)
		@RequestMapping(value="main/purlist.so", method={RequestMethod.GET, RequestMethod.POST })
		public Object gopurlist(HttpServletRequest req, HttpServletResponse resp){
			ModelAndView mv = new ModelAndView();
			//mv.addObject();
			SoVo vo = new SoVo();
			List<SoVo>list = dao.purlist(vo);
			
			mv.addObject("list",list);
			mv.setViewName("../main/index.jsp?inc=../purchase/purchase_ReportList.jsp");

		    //index.jsp?inc=./board/purchase_home.jsp
			return mv;
		}
		
		
		@RequestMapping(value="main/pfindStr.so", method={RequestMethod.GET, RequestMethod.POST })
		public Object pfindStr(SoVo vo){
			ModelAndView mv = new ModelAndView();
			//mv.addObject();
			vo.getFindStr();
			
			try{
				List<SoVo> list = dao.findStr(vo);
				mv.addObject("list",list);
				mv.setViewName("../main/index.jsp?inc=../purchase/purchase_ReportList.jsp");
			}catch(Exception ex){
				ex.printStackTrace();
				
			}
			
			return mv;
			
	}

/*-------------------------------------팝업창--------------------------------------*/
	
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
	
	@RequestMapping(value = "main/sign_popup.so", method = { RequestMethod.GET, RequestMethod.POST })
	public Object sign_popup() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("../main/index.jsp?inc=../purchase/purchase_sign_popup.jsp");
		
		return mv; 
	}
	@RequestMapping(value = "main/sign_popup_2.so", method = { RequestMethod.GET, RequestMethod.POST })
	public Object sign_popup2() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("../main/index.jsp?inc=../purchase/purchase_sign_popup2.jsp");
		
		return mv; 
	}
	//결재자 카테고리 선택시
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "main/sign_popup2.so", method = { RequestMethod.GET, RequestMethod.POST })
	public void sign_popup2(HttpServletRequest req, HttpServletResponse resp) {
		resp.setCharacterEncoding("UTF-8");
		SoVo vo = new SoVo();
		PrintWriter out = null;
		MultipartRequest mul = getMul(req);
		JSONArray jsonList = new  JSONArray();
		int ePosition = Integer.parseInt(mul.getParameter("em_cate"));
		vo.setePosition(ePosition);
		
		List<SoVo> list = dao.empSearch(vo);
		
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
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "main/sign_popup3.so", method = { RequestMethod.GET, RequestMethod.POST })
	public void sign_popup3(HttpServletRequest req, HttpServletResponse resp) {
		resp.setCharacterEncoding("UTF-8");
		SoVo vo = new SoVo();
		PrintWriter out = null;
		MultipartRequest mul = getMul(req);
		JSONArray jsonList = new  JSONArray();
		int eCode = Integer.parseInt(mul.getParameter("eCode"));
		vo.seteCode(eCode);
		
		List<SoVo> list = dao.empSearch2(vo);
		
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
