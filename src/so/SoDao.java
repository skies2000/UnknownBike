package so;
import java.util.List;
import myba.UnknownFactory;
import org.apache.ibatis.session.SqlSession;

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

}
