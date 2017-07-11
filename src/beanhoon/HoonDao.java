package beanhoon;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;

import myba.UnknownFactory;

public class HoonDao {
	SqlSession session;
	
	public HoonDao(UnknownFactory factory){
		this.session=factory.getFactory().openSession();
	}
	
	// Request List
	public List<PurListVo> list(PurListVo vo) {
		List<PurListVo> list = null;
		
		try {
			list = session.selectList("hoondb.pur_list", vo);
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			return list;
		}
	}
	
	// Request View
	public PurListVo view(PurListVo vo) {
		PurListVo v = null;
		
		try {
			v = session.selectOne("hoondb.pur_view", vo);
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			return v;
		}
	}
	
	// Request Set
	public PurListVo set(PurListVo vo) {
		PurListVo v = null;
		
		try {
			v = session.selectOne("hoondb.pur_set", vo);
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			return v;
		}
	}
	
	// Save Data
	public String saveData(PurListVo vo) {
		String msg = "";
		
		try {
			int r = session.insert("hoondb.save_data", vo);
			System.out.println("3");
			if (r>0) {
				msg = "작업 설정이 정상적으로 저장되었습니다";
			} else {
				msg = "저장 중 오류가 발생했습니다";
			}
		} catch (Exception ex) {
			ex.printStackTrace();
			session.rollback();
		} finally {
			session.commit();
			return msg;
		}
	}
	
	// Product List
	public List<PurListVo> listPro(PurListVo vo) {
		List<PurListVo> list = null;
		
		try {
			list = session.selectList("hoondb.list_p", vo);
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			return list;
		}
	}
	
	// Product List
	public PurListVo viewP(PurListVo vo) {
		PurListVo v = null;
		
		try {
			v = session.selectOne("hoondb.view_img_p", vo);
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			return v;
		}
	}
	
	// Material List
	public List<PurListVo> listMte(PurListVo vo) {
		List<PurListVo> list = null;
		
		try {
			list = session.selectList("hoondb.list_m", vo);
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			return list;
		}
	}
	
	// Material List
	public PurListVo viewM(PurListVo vo) {
		PurListVo v = null;
		
		try {
			v = session.selectOne("hoondb.view_img_m", vo);
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			return v;
		}
	}
}