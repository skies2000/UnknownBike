package kimHa;

import java.util.Arrays;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

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
	
	
	@RequestMapping(value="main/appTwo.kimHa",method={RequestMethod.GET,RequestMethod.POST})
	public Object appTwo(){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("../laboratory/approveMan_two.html");
		
		return mv;
	}
	
	
	//MultipartRequest 절차를 하나의 메서드로 만들었다.
	
	@SuppressWarnings({ "finally", "deprecation" })//MultipartiRequest생성 절차 메소드로 구성
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
	
	//등록 눌렀을 때 
	@RequestMapping(value="/matInput.kimHa",method={RequestMethod.GET,RequestMethod.POST})
	public void matInput(HttpServletRequest req, HttpSession session){
		ModelAndView mv = new ModelAndView();
		
		MultipartRequest mul = getMul(req);
		kimHaVo vo = new kimHaVo();
		String dname = mul.getParameter("dname");
		String dcont = mul.getParameter("dcont");
		String dwrite = (String)session.getAttribute("user");
		String[] appArr = mul.getParameterValues("appMember");
		String dsign = "";
		dsign = appArr[0];
		
		for(int i=1; i<appArr.length; i++){
			dsign += "," + appArr[i];
		}
		vo.setDname(dname);
		vo.setDcont(dcont);
		vo.setDwrite(dwrite);
		vo.setDsign(dsign);
		
		int r = dao.docInput(vo);
		
		System.out.println(mul.getParameter("dname"));
		System.out.println(mul.getParameter("dcont"));
		System.out.println(mul.getParameter("mname"));
		System.out.println(mul.getParameter("mcate"));
		System.out.println(Arrays.toString(appArr));

	}
	

	
}
