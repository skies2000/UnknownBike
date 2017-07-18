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
		
		
		public int proDel(String pcode){
			int r = -1;
			int a=0,b=0,c=0,d=0;
			 
			try{
			a = session.delete("hwandb.proProDel",pcode);
			b = session.delete("hwandb.proDlistDel",pcode);
			c = session.delete("hwandb.proMlistDel",pcode);
			d = session.delete("hwandb.proDocDel",pcode);
			if(a>0 && b>0 && c>0 && d>0){
				r=1;
				}
			}catch(Exception e){
				e.printStackTrace();
				r=-1;
				session.rollback();
			}
			session.commit();
			return r;
			
		}
	
}
