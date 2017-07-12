package kimHa;

import java.io.PrintWriter;
import java.util.Arrays;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.plaf.synth.SynthScrollBarUI;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@Controller
public class kimHaController {
	kimHaDao dao = null;

	public kimHaController() {
	}

	public kimHaController(kimHaDao dao) {
		this.dao = dao;
	}

	@RequestMapping(value = "main/pDoc.kimHa", method = { RequestMethod.GET, RequestMethod.POST })
	public Object pDoc() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("../laboratory/documentContentInput.html");

		return mv;

	}

	@RequestMapping(value = "main/appTwo.kimHa", method = { RequestMethod.GET, RequestMethod.POST })
	public Object appTwo() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("../laboratory/approveMan_two.html");

		return mv;
	}

	// MultipartRequest 절차를 하나의 메서드로 만들었다.

	@SuppressWarnings({ "finally", "deprecation" }) // MultipartiRequest생성 절차
													// 메소드로 구성
	public MultipartRequest getMul(HttpServletRequest req) {
		MultipartRequest mul = null;

		String uploadPath = req.getRealPath("images/materialimg");

		try {
			mul = new MultipartRequest(req, uploadPath, 1024 * 10000, "utf-8", new DefaultFileRenamePolicy());
		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			return mul;
		}

	}

	// 등록 (문서, 자재 등등)
	@RequestMapping(value = "/matInput.kimHa", method = { RequestMethod.GET, RequestMethod.POST })
	public void matInput(HttpServletRequest req, HttpSession session, HttpServletResponse resp) {
		ModelAndView mv = new ModelAndView();
		PrintWriter out = getOut(resp);
		MultipartRequest mul = getMul(req);
		String mimage = "";

		// 사진
		Enumeration<String> files = mul.getFileNames(); // 파일의 이름을 알아내기 위한 절차.
		if (files.hasMoreElements()) {
			String file = files.nextElement();
			mimage = mul.getFilesystemName(file); // file 안에 file 이름이 들어간다.
		}

		// 문서
		kimHaVo vo = new kimHaVo();
		String dname = mul.getParameter("dname");
		String dcont = mul.getParameter("dcont");
		String dwrite = (String) session.getAttribute("user");
		String[] appArr = mul.getParameterValues("appMember");
		String dsign = "";
		dsign = appArr[0];

		for (int i = 1; i < appArr.length; i++) {
			dsign += "," + appArr[i];
		}
		vo.setDname(dname);
		vo.setDcont(dcont);
		vo.setDwrite(dwrite);
		vo.setDsign(dsign);

		// 자재

		kimHaVo vo2 = new kimHaVo();
		String mname = mul.getParameter("mname");
		int mprice = Integer.parseInt(mul.getParameter("mprice"));
		String mdev = (String) session.getAttribute("user"); // 작성자
		int mcate = Integer.parseInt(mul.getParameter("mcate"));

		vo2.setMname(mname);
		vo2.setMprice(mprice);
		vo2.setMdev(mdev);
		vo2.setMcate(mcate);
		vo2.setMimage(mimage);

		int r = 0;
		r = dao.docInput(vo); // 문서
		r = dao.matInput(vo2); // 자재
		if (r > 0) {
			r = 1;
		} else {
			r = -1;
		}

		out.print(r);
	}

	// 위 등록에서 호출
	@SuppressWarnings("finally") // out.print 쓰기위한 절차 메소드로 구성
	public PrintWriter getOut(HttpServletResponse resp) {
		resp.setCharacterEncoding("utf-8");
		PrintWriter out = null;

		try {
			out = resp.getWriter();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			return out;
		}
	}

	// 상세보기
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/matList.kimHa", method = { RequestMethod.GET, RequestMethod.POST })
	public void matList(HttpServletResponse resp) {
		PrintWriter out = getOut(resp);
		List<kimHaVo> list = dao.matList();

		JSONArray json = new JSONArray();

		for (int i = 0; i < list.size(); i++) {
			JSONObject obj = new JSONObject();
			obj.put("mname", list.get(i).getMname());
			obj.put("mcode", list.get(i).getMcode());
			obj.put("mdate", list.get(i).getMdate());
			obj.put("mdev", list.get(i).getMdev());
			obj.put("mstate", list.get(i).getMstate());
			obj.put("mimage", list.get(i).getMimage());

			json.add(obj);

		}

		out.print(json);

	}

	// view
	@RequestMapping(value = "/matView.kimHa", method = { RequestMethod.GET, RequestMethod.POST })
	public Object matView(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		MultipartRequest mul = getMul(req);
		kimHaVo vo = new kimHaVo();
		vo.setMcode(Integer.parseInt(mul.getParameter("mcode")));
		vo = dao.matView(vo);
		mv.setViewName("/laboratory/materialsView.jsp");
		mv.addObject("vo", vo);
		return mv;
	}

}
