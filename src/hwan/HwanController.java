package hwan;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.sun.xml.internal.bind.v2.runtime.unmarshaller.XsiNilLoader.Array;

@Controller
public class HwanController {
	HwanDao dao = null;
	public HwanController(){
		
	}

	
	public HwanController(HwanDao dao){
		
		this.dao = dao;
		
		
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/login.hwan", method={RequestMethod.GET, RequestMethod.POST })
	public void login(HttpServletRequest req, HttpServletResponse resp){
		PrintWriter out = getOut(resp);
		List<HwanVo> list = dao.loginList();
		JSONArray ja = new JSONArray();
		try{
			
			for(int i=0; i<list.size();i++){
				JSONObject jo = new JSONObject();
				jo.put("ecode", list.get(i).getEcode());
				jo.put("epwd", list.get(i).getEpwd());
				ja.add(jo);
			}
			out.print(ja);
		}catch(Exception e){ 
			e.printStackTrace();
		}
	}

	
	@RequestMapping(value = "main/mainIndex.hwan", method = {RequestMethod.GET, RequestMethod.POST})
	public Object mainIndex( HttpServletRequest req){
		ModelAndView mv = new ModelAndView();
		MultipartRequest mul = getMul(req);
		HttpSession session =  req.getSession();
		mv.setViewName("index.jsp");
		session.setAttribute("user", mul.getParameter("userid"));
		return mv;
		
	}
	
	
	@RequestMapping(value = "product_home.hwan", method={RequestMethod.GET, RequestMethod.POST})
	public Object product_home(){
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("../main/index.jsp?inc=../product/product_index.jsp");
		return mv;
	}
	
	
	
	@SuppressWarnings({ "finally", "deprecation" })//MultipartiRequest생성 절차 메소드로 구성
	public MultipartRequest getMul(HttpServletRequest req){
		MultipartRequest mul= null;
		
		
		String uploadPath = req.getRealPath("images/").replace('\\', '/');
		
		try{
			mul = new MultipartRequest(req,uploadPath, 1024*10000,"utf-8",new DefaultFileRenamePolicy());
		}catch(Exception e){
			e.printStackTrace();
			
		}finally {
			return mul;
		} 
		
	}
	@RequestMapping(value = "main/pDoc.hwan", method = {RequestMethod.GET, RequestMethod.POST})
	public Object pDoc(){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("../laboratory/documentContentInput.html");
		return mv;
	}
	
	@RequestMapping(value = "main/appOne.hwan", method = {RequestMethod.GET, RequestMethod.POST})
	public Object appOne(){
		ModelAndView mv = new ModelAndView();
		List<HwanVo> list = null;
		list =  dao.appList(); 
		mv.setViewName("../laboratory/approveMan_one.jsp");
		mv.addObject("obj",list);
		return mv;
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/appTwo.hwan", method = {RequestMethod.GET, RequestMethod.POST})
	public void appTwo(HttpServletResponse resp){
		PrintWriter out = getOut(resp);
	
		
		List<HwanVo> list = null;
		list = dao.appList();
		JSONArray jarr = new JSONArray();
		
		
		for(int i=0; i<list.size();i++){
			
			JSONObject json = new JSONObject();
			json.put("ecode", list.get(i).getEcode());
			json.put("ename", list.get(i).getEname());
			json.put("eimage", list.get(i).getEimage());
			
			jarr.add(json);
			
		}
			out.print(jarr);
	}
	
	
	//제품 등록~~~~~~~~~~~~~~~!!!!!!!!!!!!!!!!
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/proInput.hwan", method = {RequestMethod.GET, RequestMethod.POST})
	public void proInput(HttpServletRequest req, HttpServletResponse resp, HttpSession session){
		MultipartRequest mul = getMul(req);
		PrintWriter out = getOut(resp);
		HwanVo vo =  new HwanVo();
		String[] pManArr = null;
		String pManStr = "";
		String[] mlmCode = null; //자재리스트 자재 코드
		String[] mlmea = null;   //자재리스트 자재 수량
		String[] mpriceArr = null;
		int totalpCost = 0;
		mlmCode = mul.getParameterValues("mlmcode");
		mlmea = mul.getParameterValues("mlmea");
		mpriceArr = mul.getParameterValues("mprice");
		
		
		
		//자재리스트에서 선택된 자재를 통해 제품 가격 계산
		for(int i=0; i<mpriceArr.length;i++){
			totalpCost += (Integer.parseInt(mlmea[i])) * (Integer.parseInt(mpriceArr[i]));
		}
		
		System.out.println("pprice : "+totalpCost);
		
		Enumeration<String> files = mul.getFileNames();
		if(files.hasMoreElements()){
			String file = files.nextElement();
			System.out.println("image name : "+mul.getFilesystemName(file));
			vo.setPimage(mul.getFilesystemName(file));
		}
		
		
		
		System.out.println("mlistCode : "+Arrays.toString(mlmCode));
		System.out.println("mlistEa: "+Arrays.toString(mlmea));
		
		 
		
		 
		vo.setPcost(totalpCost);
		vo.setPprice(totalpCost*10);
		vo.setDcont(mul.getParameter("dcont"));
		vo.setDname(mul.getParameter("dname"));
		vo.setPname(mul.getParameter("pname"));
		vo.setPdev((String)session.getAttribute("user"));
		vo.setdWrite(vo.getPdev());
		vo.setPcate(Integer.parseInt(mul.getParameter("pcate")));
		pManArr = mul.getParameterValues("appMember");
		pManStr = pManArr[0];
		
		for(int i=1; i<pManArr.length; i++){
			pManStr+=","+pManArr[i];
		}
		vo.setdSign(pManStr);
		vo.setdStatus(pManArr.length);
		
		
		
		System.out.println("pdev : "+vo.getPdev());
		
		System.out.println("arr : "+Arrays.toString(pManArr));
		System.out.println("arr-len: "+pManArr.length);
		System.out.println("str-split : "+pManStr);
		
		System.out.println("pcate : "+vo.getPcate());
		
	
		
		int r = 0;
		boolean rFlag = true;
		String msg = "";
		r = dao.proInput(vo);
		for(int i=0; i<mlmCode.length;i++){
			System.out.println();
			HwanVo mLlitVo = new HwanVo();
			System.out.println("mlmcode : "+Integer.parseInt(mlmCode[i]));
			System.out.println("mlmea : "+Integer.parseInt(mlmea[i]));
			
			mLlitVo.setMlmcode(Integer.parseInt(mlmCode[i]));
			mLlitVo.setMlmea(Integer.parseInt(mlmea[i]));
			if(dao.mListInput(mLlitVo)<=0) rFlag = false; 
		}
		if(r>0 && rFlag){
			r = 1;
		}else{
			r = -1;
		}
		out.print(r);
	}
	
	@RequestMapping(value="/loginCheck.hwan",method={RequestMethod.GET})
	public void loginCheck(HttpSession session, HttpServletResponse resp){
		PrintWriter out = getOut(resp);
		
		out.print(session.getAttribute("user"));
		
	}
	@RequestMapping(value="/login/logout.hwan",method={RequestMethod.GET})
	public Object logOut(HttpSession session){
		
		if(session.getAttribute("user") != null)
			session.invalidate();
		return "login.jsp";
	}
	
	
	
	
	//자재 리스트 팝업창이 열리면서 뿌려질 자재 리스트 
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/pro_mat_List.hwan",method={RequestMethod.GET})
	public void pro_mat_List(HttpServletResponse resp){
			PrintWriter out = getOut(resp);
			List<HwanVo>list = dao.proInputMatList();
			JSONArray jArr = new JSONArray();
			
			for(int i=0; i<list.size();i++){
				JSONObject jObj = new JSONObject();
				jObj.put("mcode", list.get(i).getMcode());
				jObj.put("mname", list.get(i).getMname());
				jObj.put("mimage", list.get(i).getMimage());
				jObj.put("mprice", list.get(i).getMprice());
				 
				jArr.add(jObj);
			}
			out.print(jArr);
	}
	
	
	
	@SuppressWarnings("finally")//out.print 쓰기위한 절차 메소드로 구성
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
	
	
	
	
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/pdList.hwan",method={RequestMethod.GET,RequestMethod.POST })
	public void pdList(HttpServletResponse resp, HttpServletRequest req){
		MultipartRequest mul = getMul(req);
		PrintWriter out = getOut(resp);
		HwanVo vo = new HwanVo();
		List<HwanVo> list = null;
		
		int sShearch = Integer.parseInt(mul.getParameter("sShearch"));
		String findStr = mul.getParameter("findStr");
		vo.setFindStr(findStr);
		if(sShearch == 0){ //전체 검색
			 list = dao.proListAllSearch(vo);
		}else if(sShearch == 1){ //제품명으로 검색
			 list = dao.proList(vo);
		}
		
		
		System.out.println(vo.getFindStr());
		System.out.println(findStr);
		System.out.println("list Size : "+list.size());
		JSONArray jarr = new JSONArray();
		for(int i=0;i<list.size();i++){
			
			JSONObject jobj = new JSONObject();
			
			jobj.put("pname", list.get(i).getPname());
			jobj.put("pstatus", list.get(i).getPstatus());
			jobj.put("pcode", list.get(i).getPcode());
			jobj.put("pdev", list.get(i).getPdev());
			jobj.put("pdate", list.get(i).getPdate());
			jobj.put("pimage", list.get(i).getPimage());
			
			jarr.add(jobj);
		}
		out.print(jarr);
	}
	
	/*view 제품리스트 들이 출력 되는 화면에서 해당 제품 이미지를 클릭하면 나오는 제품 상세 정보를 화면에 뿌려줄 제품 정보*/ 
	@RequestMapping(value="/proView.hwan",method = {RequestMethod.POST})
	public Object proView(HttpServletRequest req){
		ModelAndView mv = new ModelAndView();
		MultipartRequest mul = getMul(req);
		HwanVo vo = new HwanVo();
		HwanVo appVo = new HwanVo();
		String dsign = "";
		vo.setPcode(Integer.parseInt(mul.getParameter("pcode")));
		System.out.println(Integer.parseInt(mul.getParameter("pcode")));
		vo = dao.proView(vo);
		dsign = vo.getdSign();
		String [] strArr = dsign.split(",");
		
		
		//사원 코드를 이용해서 사원 정보를 얻어 온다.
		appVo.setEcode(strArr[0]);
		appVo = dao.appOne(appVo);
		
		
		//얻어온 사원 정보(이름)을 vo에 담는다 vo는 view페이지에서 사용될 클래스
		vo.setAppOne(appVo.getEname());
		
		
		
		//-------------------------------------------//
		//두번 째 사원 코드를 이용해서 사원 정보를 얻어 온다.
		appVo.setEcode(strArr[1]);
		appVo = dao.appOne(appVo);
		
		
		//얻어온  두번째 사원 정보(이름)을 vo에 담는다 vo는 view페이지에서 사용될 클래스
		vo.setAppTwo(appVo.getEname());
		 int pstatus = vo.getPstatus();
		 String psName = "";
		 int pcate = vo.getPcate();
		 String pcaName = "";
		 
		 if(pstatus == 0){
			 psName = "결재중";
		 }else{
			 psName = "승인완료";
		 }
		 
		 switch(pcate){
		 case 1:
			 pcaName = "외발자전거";
			 break;
		 case 2:
			 pcaName = "두발자전거";
			 break;
		 case 3:
			 pcaName = "세발자전거";
			 break;
		 case 4:
			 pcaName = "네발자전거";
			 break;
		 case 5:
			 pcaName = "하이브리드 자전거";
			 break;
		 }
		
		
		vo.setPstatusName(psName);
		vo.setPcateName(pcaName);
		System.out.println("pcateNamw : "+vo.getPcateName());
		System.out.println("pstatusName : "+vo.getPstatusName());
		mv.setViewName("/laboratory/productView.jsp");
		mv.addObject("vo",vo);
		
		return mv;
	}
	
	@RequestMapping(value="/mList.hwan", method={RequestMethod.POST})
	public Object mList(HwanVo vo){
		ModelAndView mv = new ModelAndView();
		List<HwanVo>list = null;
		
		System.out.println(vo.getMlpcode());
		list = dao.proViewMatList(vo.getMlpcode());
		
		mv.setViewName("laboratory/materialsList.jsp");
		mv.addObject("list",list);
		
		
		return mv;
		
		
	}
	//////////////////////////////////////////마이 페이지//////////////////////////////////
	
	
	//비밀번호 체크
	@RequestMapping(value="/myPagePwdCheck.hwan", method={RequestMethod.POST})
	public void myPagePwdCheck(HttpSession session, HttpServletResponse resp, HttpServletRequest req){
		PrintWriter out = getOut(resp);
		MultipartRequest mul = getMul(req);
		String userid = (String)session.getAttribute("user");
		String inputpwd = mul.getParameter("pwd");
		String userpwd = dao.myPagePwdCheck(userid);
	
		
		System.out.println("id : "+userid);
		System.out.println("input pwd : "+inputpwd);
		System.out.println("user pwd : "+userpwd);
		
		if(inputpwd.equals(userpwd)){
			out.print(1);
		}else{
			out.print(-1);
		}
		
	}
	
	
	//문서 리스트
	@RequestMapping(value="main/myPageDocList.hwan", method={RequestMethod.POST,RequestMethod.GET})
	public Object myPageDocList(HttpSession session, HttpServletResponse resp, HttpServletRequest req){
		ModelAndView mv = new ModelAndView();
		List<HwanVo>list = null;
		List<HwanVo> realList = new ArrayList<HwanVo>();
		String userid = (String)session.getAttribute("user");
		
		list = dao.myPagedocList();
		System.out.println("list size : "+list.size());
		//문서 카테고리 이름 지정
		for(HwanVo vo : list){
			String tempDC = vo.getDcate();
			int tempDS = vo.getdStatus();
			String tdcName = "";
			String tdsName = "";
			String singerArr[];
			if(tempDC.equals("spl")){
				tdcName="판매품의서";
			}else if(tempDC.equals("srl")){
				tdcName="생산요청서";
			}else if(tempDC.equals("dl")){
				tdcName="자재/제품 등록";
			}else if(tempDC.equals("fl")){
				tdcName="생산리스트";
			}else if(tempDC.equals("pl") || tempDC.equals("pur")){
				tdcName="구매리스트";
			}
			
			if(tempDS==0){
				tdsName = "완료";
			}else if(tempDS==-1){
				tdsName = "거절";
			}else{
				tdsName = "결재중";
			}
			
			
			vo.setDcateName(tdcName);
			vo.setDstatudName(tdsName);
			//결재자 스플릿 해서 로그인한 아이디와 매칭되는 경우에만 리스트에 저장 
			singerArr = vo.getdSign().split(",");
			for(String singnerStr : singerArr){//스플릿한 길이만큼 반복(결재자 2명이면 2번반복)
				if(singnerStr.equals(userid )){
					realList.add(vo);
					break;
				}
			}
		}
		mv.addObject("list",realList);
		mv.setViewName("index.jsp?inc=../myPage/documentList.jsp");
		return mv;
	
	}

	//문서뷰
	@RequestMapping(value="main/myPageDocView.hwan",method={RequestMethod.GET})
	public Object myPageDocView(HwanVo vo, HttpSession session){
		ModelAndView mv = new ModelAndView();
		HwanVo rVo = null;
		rVo = dao.myPagedoView(vo);
		String appArr[] = rVo.getdSign().split(",");
		String appOne = dao.appOne(appArr[0]).getEname();
		String appTwo = dao.appOne(appArr[1]).getEname();
		String userCode = (String)session.getAttribute("user");
		String userId = dao.appOne(userCode).getEname();

		String tempDC = rVo.getDcate();
		String tdcName = "";
		
		rVo.setUserid(userId);
		rVo.setAppOne(appOne);
		rVo.setAppTwo(appTwo);
		

		System.out.println("sessionId : "+userId);
		
		if(tempDC.equals("spl")){
			tdcName="판매품의서";
		}else if(tempDC.equals("srl")){
			tdcName="생산요청서";
		}else if(tempDC.equals("dl")){
			tdcName="자재/제품 등록";
		}else if(tempDC.equals("fl")){
			tdcName="생산리스트";
		}else if(tempDC.equals("pl") || tempDC.equals("pur")){
			tdcName="구매리스트";
		}
		rVo.setDcateName(tdcName);
		
		
		System.out.println("ename : "+rVo.getEname());
		
		mv.setViewName("index.jsp?inc=../myPage/documentView.jsp");
		mv.addObject("obj",rVo);
		return mv;
		
	}
	
	@RequestMapping(value="main/myPageDocApp.hwan",method={RequestMethod.GET})
	public Object myPageDocApp(HwanVo vo){
		
		System.out.println("docAppResult : "+dao.myPageDocApp(vo));
		return "myPageDocList.hwan";
	}
	@RequestMapping(value="main/myPageDocDeny.hwan",method={RequestMethod.GET})
	public Object myPageDocDeny(HwanVo vo){
		
		System.out.println("docDenyResult : "+dao.myPageDocDeny(vo));
		
		return "myPageDocList.hwan";
	}
	///////////////////////////////////////마이페이지 끝/////////////////////////////////////////////
	@RequestMapping(value="/productDel.hwan",method={RequestMethod.GET})
	public Object productDel(HwanVo vo){
		
		
		dao.proDel(vo.getPcode()+"");
		
		return "laboratory/productDetails.html";
	}
	
	
}
