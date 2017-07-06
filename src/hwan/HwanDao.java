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
		System.out.println(11);
		for(int i=0;i< list.size();i++){
			System.out.println(11);
			System.out.println(list.get(i).getEcode());
			System.out.println(list.get(i).getEname());
		}
		return list;
		
	}
}
