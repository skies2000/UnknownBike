package hwan;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import myba.UnknownFactory;


public class HwanDao {
	SqlSession session;
	
	public HwanDao(){
		this.session = UnknownFactory.getFactory().openSession();
	}
	
	public List<HwanVo> loginList(){
		List<HwanVo> list = null;
		list = session.selectList("hwandb.loginList");
		
		return list;
	}
	public List<HwanVo> appList(){
		List<HwanVo> list = null;
		list = session.selectList("hwandb.appList");
		
		return list;
		
	}
	
	public int proInput(HwanVo vo){
		int r = 0;
		int a = 0;
		int b = 0;
		try{
			
			a = session.insert("hwandb.docInput",vo);
			b =	session.insert("hwandb.proInput",vo);
			if(a>0 && b >0){
				r = 1;	
			}
			
		}catch(Exception e){
			e.printStackTrace();
			r = -1;
			session.rollback();
		}
			
		
		session.commit();
		return r;
	}
}
