package sung;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.parsing.EmptyReaderEventListener;

import myba.UnknownFactory;

public class SungDao {
	SqlSession session;
	
	public SungDao(UnknownFactory factory){
		this.session=factory.getFactory().openSession();
	}

	public List<DocumentVo> docu_reqList(DocumentVo vo) {
		List<DocumentVo> list = null;
		try {
			list = session.selectList("sungdb.req_select", vo);
		}catch(Exception ex){
			ex.printStackTrace();
		}
		
		return list;
	}


	public List<ProductVo> proList(ProductVo vo) {
		List<ProductVo> list = null;
		
		try{
			list = session.selectList("sungdb.pro_list", vo);
		}catch (Exception ex) {
			ex.printStackTrace();
		}
		
		return list;
	}
	
	//select box값 return 받기 위해
	public List<ProductVo> proList2(ProductVo vo) {
		List<ProductVo> list = null;
		try{
			list = session.selectList("sungdb.pro_list2", vo);
		}catch (Exception ex) {
			ex.printStackTrace();
		}
		return list;
	}
	
	

	public List<ProductVo> salse_req_input_add(ProductVo vo) {
		return null;
	}

	public EmployeeVo loadUser(EmployeeVo evo) {
		EmployeeVo list = null;
		try{
			list = session.selectOne("sungdb.loadUser", evo);
		}catch (Exception ex) {
			ex.printStackTrace();
		}
		
		return list;
	}
	//popup창에서 카테고리선택->이름 출력
	public List<EmployeeVo> empSearch(EmployeeVo vo) {
		List<EmployeeVo> list = null;
		try{
			list = session.selectList("sungdb.searchEmp", vo);
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	//popup창에서 이름선택->사원정보 띄우기
	public List<EmployeeVo> empSearch2(EmployeeVo vo) {
		List<EmployeeVo> list = null;
		try{
			list = session.selectList("sungdb.searchEmp2", vo);
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	

	
	
}