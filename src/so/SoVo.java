package so;

import java.util.Date;

public class SoVo {
	//자재테이블
	int mCode;
	String mName;
	int mEa;
	int mPrice;
	int mDev;
	int mCate;
	int mState;
	Date mDate;
	String mImage;
	int mPo;

	
	String findStr;
	
	//문서요청서
	int dCode;
	String dName;
	String dCont;//내용
	Date dDate;
	int dWrite;
	int dSignA;
	int dStatus;
	String dCate;
	
	
	//employees
	
	private int eCode;
	private String eName;
	private int eDepart;
	private int ePosition;
	
	//구매_리스트(PList)
	int plDcode;//문서번호
	int plMCode;//자재코드
	int plMEa;//수량
	int plPrice;//단가
	String plModel;//모델명
	String plPur;//구매처
	String plPerson;//구매담당자
	Date plDate;//날짜
	int plStatus;//상태
	int plnow;//구매상태
	
	
	public int getmCode() {
		return mCode;
	}




	public void setmCode(int mCode) {
		this.mCode = mCode;
	}




	public String getmName() {
		return mName;
	}




	public void setmName(String mName) {
		this.mName = mName;
	}




	public int getmEa() {
		return mEa;
	}




	public void setmEa(int mEa) {
		this.mEa = mEa;
	}




	public int getmPrice() {
		return mPrice;
	}




	public void setmPrice(int mPrice) {
		this.mPrice = mPrice;
	}




	public int getmDev() {
		return mDev;
	}




	public void setmDev(int mDev) {
		this.mDev = mDev;
	}




	public int getmCate() {
		return mCate;
	}




	public void setmCate(int mCate) {
		this.mCate = mCate;
	}




	public int getmState() {
		return mState;
	}




	public void setmState(int mState) {
		this.mState = mState;
	}




	public Date getmDate() {
		return mDate;
	}




	public void setmDate(Date mDate) {
		this.mDate = mDate;
	}




	public String getmImage() {
		return mImage;
	}




	public void setmImage(String mImage) {
		this.mImage = mImage;
	}




	public int getmPo() {
		return mPo;
	}




	public void setmPo(int mPo) {
		this.mPo = mPo;
	}




	public int getdCode() {
		return dCode;
	}




	public void setdCode(int dCode) {
		this.dCode = dCode;
	}




	public String getdName() {
		return dName;
	}




	public void setdName(String dName) {
		this.dName = dName;
	}




	public String getdCont() {
		return dCont;
	}




	public void setdCont(String dCont) {
		this.dCont = dCont;
	}




	public Date getdDate() {
		return dDate;
	}




	public void setdDate(Date dDate) {
		this.dDate = dDate;
	}




	public int getdWrite() {
		return dWrite;
	}




	public void setdWrite(int dWrite) {
		this.dWrite = dWrite;
	}




	public int getdSignA() {
		return dSignA;
	}




	public void setdSignA(int dSignA) {
		this.dSignA = dSignA;
	}




	public int getdStatus() {
		return dStatus;
	}




	public void setdStatus(int dStatus) {
		this.dStatus = dStatus;
	}




	public String getdCate() {
		return dCate;
	}




	public void setdCate(String dCate) {
		this.dCate = dCate;
	}




	public SoVo() {
	 
	 
	 
	 
	 
	}




	public String getFindStr() {
		return findStr;
	}




	public void setFindStr(String findStr) {
		this.findStr = findStr;
	}




	public int geteCode() {
		return eCode;
	}




	public void seteCode(int eCode) {
		this.eCode = eCode;
	}




	public String geteName() {
		return eName;
	}




	public void seteName(String eName) {
		this.eName = eName;
	}




	public int geteDepart() {
		return eDepart;
	}




	public void seteDepart(int eDepart) {
		this.eDepart = eDepart;
	}




	public int getePosition() {
		return ePosition;
	}




	public void setePosition(int ePosition) {
		this.ePosition = ePosition;
	}




	public int getPlDcode() {
		return plDcode;
	}




	public void setPlDcode(int plDcode) {
		this.plDcode = plDcode;
	}




	public int getPlMCode() {
		return plMCode;
	}




	public void setPlMCode(int plMCode) {
		this.plMCode = plMCode;
	}




	public int getPlMEa() {
		return plMEa;
	}




	public void setPlMEa(int plMEa) {
		this.plMEa = plMEa;
	}




	public int getPlPrice() {
		return plPrice;
	}




	public void setPlPrice(int plPrice) {
		this.plPrice = plPrice;
	}




	public String getPlModel() {
		return plModel;
	}




	public void setPlModel(String plModel) {
		this.plModel = plModel;
	}




	public String getPlPur() {
		return plPur;
	}




	public void setPlPur(String plPur) {
		this.plPur = plPur;
	}




	public String getPlPerson() {
		return plPerson;
	}




	public void setPlPerson(String plPerson) {
		this.plPerson = plPerson;
	}




	public Date getPlDate() {
		return plDate;
	}




	public void setPlDate(Date plDate) {
		this.plDate = plDate;
	}




	public int getPlStatus() {
		return plStatus;
	}




	public void setPlStatus(int plStatus) {
		this.plStatus = plStatus;
	}




	public int getPlnow() {
		return plnow;
	}




	public void setPlnow(int plnow) {
		this.plnow = plnow;
	}
	
	
	

}
