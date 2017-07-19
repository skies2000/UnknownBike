package beanhoon;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;

import myba.UnknownFactory;


public class HoonDao {
	SqlSession session;
	
	public HoonDao(UnknownFactory factory){
		this.session=factory.getFactory().openSession();
	}
	
	// Main List 1
	public List<PurListVo> main1(PurListVo vo) {
		List<PurListVo> list = null;
		try {
			list = session.selectList("hoondb.m1", vo);
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			return list;
		}
	}
	
	// Main List 2
	public List<PurListVo> main2(PurListVo vo) {
		List<PurListVo> list = null;
		
		try {
			list = session.selectList("hoondb.m2", vo);
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			return list;
		}
	}
	
	// Main List 3
	public List<PurListVo> main3(PurListVo vo) {
		List<PurListVo> list = null;
			
		try {
			list = session.selectList("hoondb.m3", vo);
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			return list;
		}
	}
	
	// Main List 4
	public List<PurListVo> main4(PurListVo vo) {
		List<PurListVo> list = null;
			
		try {
			list = session.selectList("hoondb.m4", vo);
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			return list;
		}
	}
	
	// odder List
	public List<PurListVo> odd(PurListVo vo) {
		List<PurListVo> list = null;
		
		try {
			list = session.selectList("hoondb.odd_list", vo);
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			return list;
		}
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
	
	// Request Search
	public List<PurListVo> search(PurListVo vo) {
		List<PurListVo> list = null;
			
		try {
			list = session.selectList("hoondb.search", vo);
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			return list;
		}
	}
	
	// Request Sign
	public String sign(String str) {
		String v = null;
		
		try {
			v = session.selectOne("hoondb.pur_sign", str);
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			return v;
		}
	}
	
	// Request Work
	public List<PurListVo> work(PurListVo vo) {
		List<PurListVo> list = null;
		
		try {
			list = session.selectList("hoondb.pur_work", vo);
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			return list;
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
	
	// Update Data
	public int updateData(PurListVo vo) {
		int v = 0;
		
		try {
			v = session.update("hoondb.update_status", vo);
		} catch (Exception ex) {
			ex.printStackTrace();
			session.rollback();
		} finally {
			session.commit();
			return v;
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
	
	// Material Search
	public List<PurListVo> searchPro(PurListVo vo) {
		List<PurListVo> list = null;
			
		try {
			list = session.selectList("hoondb.search_p", vo);
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			return list;
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
	
	// Material Search
	public List<PurListVo> searchMte(PurListVo vo) {
		List<PurListVo> list = null;
		
		try {
			list = session.selectList("hoondb.search_m", vo);
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			return list;
		}
	}
	
	// eff
	@SuppressWarnings("finally")
	public List<PurListVo> effsearchP(PurListVo vo) {
		List<PurListVo> list = null;
		
		try {
			list = session.selectList("hoondb.effsearchP", vo);
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			return list;
		}
	}
	
	// 코드로 제품정보 가져오기
	public PurListVo proinfo(PurListVo vo) {
		PurListVo v = null;
		
		try {
			v = session.selectOne("hoondb.proinfo", vo);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return v;
	}
	
	// 분기 별 총 생산량을 구한다
	public PurListVo q1(PurListVo vo) {
		PurListVo v = null;
		
		try {
			v = session.selectOne("hoondb.qwert1", vo);
			System.out.println(v.getQnsrl1());
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return v;
	}
	public PurListVo q2(PurListVo vo) {
		PurListVo v = null;
		
		try {
			v = session.selectOne("hoondb.qwert2", vo);
			System.out.println(v.getQnsrl2());
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return v;
	}
	public PurListVo q3(PurListVo vo) {
		PurListVo v = null;
		
		try {
			v = session.selectOne("hoondb.qwert3", vo);
			System.out.println(v.getQnsrl3());
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return v;
	}
	public PurListVo q4(PurListVo vo) {
		PurListVo v = null;
		
		try {
			v = session.selectOne("hoondb.qwert4", vo);
			System.out.println(v.getQnsrl4());
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return v;
	}
		
}