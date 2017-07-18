package hwan;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import myba.UnknownFactory;


	
public class HwanDao {
	SqlSession session;
	HwanPageVo pVo = null;
	
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
		int c = 0;
		try{
			
			a = session.insert("hwandb.docInput",vo);
			b =	session.insert("hwandb.proInput",vo);
			c = session.insert("hwandb.labListInput");
			if(a>0 && b >0 && c>0){
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
	
	public List<HwanVo> proInputMatList(){
		List<HwanVo> list = null;
		list = session.selectList("hwandb.proInputMatList");
		return list;
	}
	
	
	//제품명으로 검색
	public List<HwanVo> proList(HwanVo vo){
		List<HwanVo> list = null;
		list = session.selectList("hwandb.proList",vo);
		return list;
	}
	
	//전체 검색
	public List<HwanVo> proListAllSearch(HwanVo vo){
		List<HwanVo> list = null;
		
		pageCompute(vo,5,5);
		
		
		list = session.selectList("hwandb.proListAllSearch",vo);
		return list;
	}
	
	public HwanVo proView(HwanVo vo){
		HwanVo rvo = null;
		rvo = session.selectOne("hwandb.proView",vo);
		
		return rvo;
	}
	
	//사원코드에 해당하는 정보 셀렉트
	public HwanVo appOne(HwanVo vo){
		HwanVo rvo = null;
		rvo = session.selectOne("hwandb.appOne",vo);
		return rvo;
	}
	public HwanVo appOne(String ecode){
		HwanVo rvo = null;
		rvo = session.selectOne("hwandb.appOneStr",ecode);
		return rvo;
	}
	
	//자재리스트 등록
	public int mListInput(HwanVo vo){
		int r = 0;
		try{
			r = session.insert("hwandb.mListInput",vo);
		}catch (Exception e) {
			r=-1;
			e.printStackTrace();
			session.rollback();
		}
		session.commit();
		return r;
	}
	
	public void pageCompute(HwanVo v, int listSize, int blockSize){
		  pVo = new HwanPageVo(listSize,blockSize);
		  
		  int totList = 0; //리스트 전체 개수
		  int totPage = 0; // 전체 페이지수
		  int totBlock = 0;	//전체 블럭수
		  
		  int nowBlock = 1; // 현재 블럭
		  int startNo = 0; //리스트 목록의 시작위치
		  int endNo = 0; //리스트 목록의 마지막 위치
		  
		  int startPage = 0; // 한블럭에 표시할 시작 페이지 번호
		  int endPage = 0; // 한블럭에 표시할 마지막 페이지 번호
		  
		   
		  int nowPage =  v.getNowPage(); // 현재 페이지
		  
		  
		  String findStr = v.getFindStr();
		  
		  int a = session.selectOne("hwandb.productCnt");
		  System.out.println("productCnt : "+a);
		 
			  
			  
			  totPage = (int)Math.ceil(totList/(pVo.getListSize()*1.0));
			  totBlock = (int)Math.ceil(totPage/(pVo.getBlockSize()*1.0));
			  nowBlock = (int)Math.ceil(nowPage/(pVo.getBlockSize()*1.0));
			  
			  endPage = nowBlock * pVo.getBlockSize();
			  startPage = endPage - pVo.getBlockSize()+1;
			  endNo = nowPage * pVo.getListSize(); 
			  startNo = endNo - pVo.getListSize()+1;
			  
			  if(endPage > totPage) endPage = totPage;
			  if(endNo > totList) endNo = totList;
			  
			  pVo.setTotList(totList);
			  pVo.setTotBlock(totBlock);
			  pVo.setEndNo(endNo);
			  pVo.setEndPage(endPage);
			  pVo.setNowBlock(nowBlock);
			  pVo.setStartNo(startNo);
			  pVo.setStartPage(startPage);
			  pVo.setTotPage(totPage);
			  pVo.setNowPage(nowPage);
			  
				  
	  }
	
	public List<HwanVo> proViewMatList(int mlpcode){
		List<HwanVo> list = null;
		System.out.println("mlpcode : "+mlpcode);
		
		list = session.selectList("hwandb.proViewMatList",mlpcode);
		
		return list;
		
	}
	
	
	
		/////////////////////////////////////////마이페이지////////////////////////////
		public String myPagePwdCheck(String ecode){
			String epwd = "";
			epwd = session.selectOne("hwandb.myPagePwdCheck",ecode);
			return epwd;
		}
		
		public List<HwanVo> myPagedocList(){
			List<HwanVo> list = null;
			session.commit();
			list = session.selectList("hwandb.myPagedocList");
			return list;
			
		}
		
		public HwanVo myPagedoView(HwanVo vo){
			HwanVo rVo = null;
			rVo = session.selectOne("hwandb.myPagedoView",vo);
			return rVo;
		}
		public int myPageDocApp(HwanVo vo){
			int r = 0;
			try{
				r = session.update("hwandb.myPageDocApp",vo);
			}catch(Exception e){
				e.printStackTrace();
				session.rollback();
			}
			session.commit();
			return r;
		}
		
		public int myPageDocDeny(HwanVo vo){
			int r = 0;
			try{
				r = session.update("hwandb.myPageDocDeny",vo);
			}catch(Exception e){
				e.printStackTrace();
				session.rollback();
			}
			session.commit();
			return r;
		}
		
		//////////////////////////////////마이페이지 끝////////////////////////////////////
	
}
