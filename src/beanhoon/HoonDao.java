package beanhoon;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import myba.UnknownFactory;

public class HoonDao {
	SqlSession session;
	
	public HoonDao(UnknownFactory factory){
		this.session=factory.getFactory().openSession();
	}
	
	// �����û�� ����Ʈ �ҷ�����
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
}





