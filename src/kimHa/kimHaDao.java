package kimHa;

import java.util.List;

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
	
	public int docInput(kimHaVo vo){
		int r = 0;
		try{
			r = session.insert("kimHadb.docInput",vo); //kimHaDB.xml
			
		}catch(Exception e) {
			e.printStackTrace();
			session.rollback();
		}
		session.commit();
		return r;
	}
	
	public int matInput(kimHaVo vo){
		int r = 0;
		try{
			r = session.insert("kimHadb.matInput",vo);
		}catch(Exception e){
			e.printStackTrace();
			session.rollback();
		}
		session.commit();
		return r;
	}
	
	//Details
	public List<kimHaVo> matList(){
		List<kimHaVo> list = null;
		//kimHa.DB.xml 의 namespace !!! . id값!(kimHaDB.xml의 select id)
		list = session.selectList("kimHadb.matList");
		return list;
	}
	
	//View
	
	public kimHaVo matView(kimHaVo vo){
		kimHaVo v = null;
		v = session.selectOne("kimHadb.matView",vo);
		return v;
	}
}
