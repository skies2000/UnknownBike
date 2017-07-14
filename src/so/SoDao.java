package so;
import java.util.ArrayList;
import java.util.List;
import myba.UnknownFactory;
import sung.EmployeeVo;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.type.IntegerTypeHandler;

public class SoDao {
	SqlSession session;
	public SoDao(UnknownFactory uf) {
		 this.session = uf.getFactory().openSession();
	}
	
	public List<SoVo> fMetarial(SoVo vo){
		List<SoVo> list1 = session.selectList("sodb.material_flist", vo);//session.어떤종류의 쿼리를 부를건지
		return list1;
	}
	
	public List<SoVo> aMetarial(SoVo vo){
		List<SoVo> list = session.selectList("sodb.material_list", vo);
		return list;
	}

	public List<SoVo>checkmaterial(String[] checkmaterial){
		
		List<SoVo>list = new ArrayList<SoVo>();
		
		for(String x : checkmaterial){
			int xx = Integer.parseInt(x);
			
			SoVo vo = new SoVo();
			vo.setmCode(xx);
			
			SoVo v = session.selectOne("sodb.check_mlist", vo);
			list.add(v);
		}
		
		
		return list;
		
	}
	
	
	//popup창에서 카테고리선택->이름 출력
	public List<SoVo> empSearch(SoVo vo) {
		List<SoVo> list = null;
		try{
			list = session.selectList("sodb.searchEmp", vo);
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	//popup창에서 이름선택->사원정보 띄우기
	public List<SoVo> empSearch2(SoVo vo) {
		List<SoVo> list = null;
		try{
			list = session.selectList("sodb.searchEmp2", vo);
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	public SoVo materialSelectOne(String mCode) {
		SoVo list = null;
		try{
			list = session.selectOne("sodb.materialSelectOne", mCode);
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
}
	
