package so;
import java.util.ArrayList;
import java.util.List;
import myba.UnknownFactory;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.type.IntegerTypeHandler;

public class SoDao {
	SqlSession session;
	public SoDao(UnknownFactory uf) {
		 this.session = uf.getFactory().openSession();
	}
	
	public List<SoVo> fMetarial(SoVo vo){
		List<SoVo> list1 = session.selectList("sodb.material_flist", vo);
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
}
	
