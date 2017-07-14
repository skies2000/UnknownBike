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
	
	//req_list 검색
	
	public List<DocumentVo> list_find(DocumentVo vo) {
		List<DocumentVo> list = null;
		try {
			list = session.selectList("sungdb.list_find", vo);
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
	
	//srl 테이블 insert
	public ProductVo srlInput(ProductVo pvo) {
		
		try{
			int r = session.insert("sungdb.insert_srl", pvo);
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.commit();
		}
		
		return pvo;
	}
	//document 테이블 input
	public String document_input(DocumentVo dvo) {
		String msg = "";
		try{
			int r = session.insert("sungdb.insert_document", dvo);
			 msg = "성공";
		}catch (Exception e) {
			e.printStackTrace();
			msg = "실패";
		}finally {
			session.commit();
		}
		return msg;
	}
	//사원코드로 사원이름 찾기
	public List<EmployeeVo> findEmp(EmployeeVo evo) {
		List<EmployeeVo> list = null;
		try{
			list = session.selectList("sungdb.find_empl", evo);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	//상세보기 상단부분
	public DocumentVo req_view(DocumentVo dvo) {
		try{
			dvo = session.selectOne("sungdb.req_view", dvo);
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return dvo;
	}
	//상세보기 하단 제품리스트 
	public List<DocumentVo> req_view2(DocumentVo dvo) {
		List<DocumentVo> list = null;
		try{
			list = session.selectList("sungdb.req_view2", dvo);
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	public EmployeeVo findEname(EmployeeVo evo) {
		EmployeeVo vo = null;
		try{
			vo = session.selectOne("sungdb.find_name", evo);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return vo;
	}

	public List<VenderVo> vender(VenderVo vVo) {
		List<VenderVo> list = null;
		try{
			list = session.selectList("sungdb.vender", vVo);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}



	
	

	

	
	
}