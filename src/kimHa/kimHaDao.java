package kimHa;

import java.util.List;
import java.util.concurrent.ExecutionException;

import org.apache.ibatis.session.SqlSession;

import myba.UnknownFactory;

public class kimHaDao {
	SqlSession session;

	public kimHaDao() {
		this.session = UnknownFactory.getFactory().openSession();
	}

	public List<kimHaVo> appList() {
		List<kimHaVo> list = null;

		return list;
	}

	// 삭제

	public int matDelete(kimHaVo vo) {
		int r = -1;
		int r1 = -1;
		int r2 = -1;

		try {
			r = session.delete("kimHadb.kimDel", vo);
			r1 = session.delete("kimHadb.kimDeldoc", vo);
			r2= session.delete("kimHadb.kimDeldl", vo);

		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		}
		
		if(r == -1 || r1 == -1 || r2 == -1){
			r = -1;
		}
		
		session.commit();
		session.commit();
		session.commit();
		return r;
	}

	// 문서
	public int docInput(kimHaVo vo) {
		int r = 0;
		try {
			r = session.insert("kimHadb.docInput", vo); // kimHaDB.xml

		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		}
		session.commit();
		return r;
	}

	public int matInput(kimHaVo vo) {
		int r = 0;
		try {
			r = session.insert("kimHadb.matInput", vo);
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		}
		session.commit();
		return r;
	}

	// 연구소 리스트 테이블
	public int labInput() {
		int r = 0;
		try {
			r = session.insert("kimHadb.labInput");
		} catch (Exception e) {
			e.printStackTrace();
			r = -1;
			session.rollback();
		}
		session.commit();
		return r;
	}

	// Details
	public List<kimHaVo> matList(kimHaVo vo) {
		List<kimHaVo> list = null;
		// kimHa.DB.xml ??namespace !!! . id媛?(kimHaDB.xml??select id)
		list = session.selectList("kimHadb.matList", vo);
		return list;
	}
	// 상세페이지에서 전체 리스트 검색. 출력.

	public List<kimHaVo> matAllSearch(kimHaVo vo) {
		List<kimHaVo> list = null;
		// kimHa.DB.xml ??namespace !!! . id媛?(kimHaDB.xml??select id)
		list = session.selectList("kimHadb.matAllsearch", vo);
		return list;
	}

	// View

	public kimHaVo matView(kimHaVo vo) {
		kimHaVo v = null;
		v = session.selectOne("kimHadb.matView", vo);
		return v;
	}

	public kimHaVo appOne(kimHaVo vo) {
		kimHaVo v = null;
		v = session.selectOne("kimHadb.appOne", vo);
		return v;
	}
}
