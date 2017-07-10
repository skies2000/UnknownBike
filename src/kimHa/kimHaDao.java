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
		try{
			session.insert("kimHadb.docInput",vo); //kimHaDB.xml
			
		}catch(Exception e) {
			session.rollback();
		}
		session.commit();
		return 0;
	}
}
