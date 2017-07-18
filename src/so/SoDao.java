package so;
import java.util.ArrayList;
import java.util.List;
import sung.EmployeeVo;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.type.IntegerTypeHandler;

import myba.UnknownFactory;


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
	
	public List<SoVo> nMetarial(SoVo vo){
		List<SoVo> list2 = session.selectList("sodb.material_nlist", vo);
		return list2;
	}
	
	public List<SoVo> sMetarial(SoVo vo){
		List<SoVo> list2 = session.selectList("sodb.material_slist", vo);
		return list2;
	}
	
	public SoVo dMetarial(SoVo vo){
		SoVo list = session.selectOne("sodb.material_dlist", vo);
		return list;
	}

	public List<SoVo>checkmaterial(String[] checkmaterial){
		
		List<SoVo>list = new ArrayList<SoVo>();
		
		for(String x : checkmaterial){
			int xx = Integer.parseInt(x);
			
			SoVo vo = new SoVo();
			vo.setmCode(xx);
			System.out.println(xx);
			SoVo v = session.selectOne("sodb.check_mlist", vo);
			list.add(v);
		}
		
		
		return list;
		
	}
	
	//input..작성완료
	public List<SoVo> insertDB(SoVo vo){
		List<SoVo> list2 = session.selectList("sodb.material_slist", vo);
	return list2;
	
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

	public String purInput(SoVo v) {
		String msg = "";
		try{
			int r = session.insert("sodb.PurInput",v);
			msg = "성공1";
			
		}catch(Exception ex){
			ex.printStackTrace();
			msg = "실패1";
		}finally{
			session.commit();
			
		}
		System.out.println(msg);
		return msg;
		
	}
	
	public String purDocumentInput(SoVo v) {
		
		
		String msg = "";

		try{
			int r = session.insert("sodb.insert_document",v);
			 msg = "성공2";
		}catch(Exception ex){
			msg = "실패2";
			ex.printStackTrace();
		}finally{
			session.commit();
		}
		return msg;
	}
	

	public List<SoVo> purlist(SoVo vo){
		List<SoVo> list = session.selectList("sodb.purlist", vo);//session.어떤종류의 쿼리를 부를건지
		return list;
	}
	
	//phome 검색
	public List<SoVo> phomefindStr(SoVo vo){
		List<SoVo> list = session.selectList("sodb.phomefindStr", vo);//session.어떤종류의 쿼리를 부를건지
		return list;
	}
	
	//plist 검색
	public List<SoVo> findStr(SoVo vo){
		List<SoVo> list = session.selectList("sodb.findStr", vo);//session.어떤종류의 쿼리를 부를건지
		return list;
	}
	
	//판매요청서 상세 하단
	   public List<SoVo> sale_view2(SoVo dvo) {
	      List<SoVo> list = null;
	      try{
	         list = session.selectList("sodb.sale_view2", dvo);
	      }catch (Exception e) {
	         e.printStackTrace();
	      }
	      return list;
	   }

	   //판매요청서 상세 상단
	   public SoVo sale_view(SoVo dvo) {
		   SoVo vo = new SoVo();
	      try{
	         vo = session.selectOne("sodb.pur_view", dvo);
	      }catch (Exception e) {
	         e.printStackTrace();
	      }
	      
	      return vo;
	   }
	   
	   public SoVo findEname(SoVo evo) {
		   SoVo vo = null;
		      try{
		    	  vo = session.selectOne("sodb.find_name", evo);
		      }catch (Exception e) {
		         e.printStackTrace();
		      }
		      return vo;
		   }
	   

}