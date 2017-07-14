package beanhoon;


public class PurListVo {
	// document table
	private int dCode = 0;
	private String dName;
	private String dCont;
	private String dDate;
	private int dWrite = 0;
	private String dSign1;
	private String dSign2;
	private int dStatus = 0;
	private String dCate = "";
	
	// srList table
	private int srlCode = 0;
	private int srlMCode = 0;
	private int srlEa = 0;
	private String srlTerm;
	
	// employees
	private String eName;
	
	// product
	private int pCode = 0;
	private String pName = "";
	private int pCate = 0;
	private int pPrice = 0;
	private String pDate;
	private int pEa = 0;
	private int pManhour = 0;
	private String pImage;
	
	// material
	private int mCode = 0;
	private String mName = "";
	private int mCate = 0;
	private int mPrice = 0;
	private String mDate;
	private int mEa = 0;
	private String mImage;
	
	// fList
	private int fldCode = 0;
	private int flpCode = 0;
	private int flpEa = 0;
	private long workCode = 0;
	private String workLine;
	private int workPeople = 0;
	private int workTime = 0;
	private String workStartDate;
	private String workEndDate;
	private int dys = 0;
	
	// 결재자 & 검색어
	private String eName1;
	private String eName2;
	private String findStr;
	
	// 결재자 & 검색어 getter setter
	public String geteName1() {
		return eName1;
	}
	public void seteName1(String eName1) {
		this.eName1 = eName1;
	}
	public String geteName2() {
		return eName2;
	}
	public void seteName2(String eName2) {
		this.eName2 = eName2;
	}
	public String getFindStr() {
		return findStr;
	}
	public void setFindStr(String findStr) {
		this.findStr = findStr;
	}
	
	// document getter setter
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
	public String getdDate() {
		return dDate;
	}
	public void setdDate(String dDate) {
		this.dDate = dDate;
	}
	public int getdWrite() {
		return dWrite;
	}
	public void setdWrite(int dWrite) {
		this.dWrite = dWrite;
	}
	public String getdSign1() {
		return dSign1;
	}
	public void setdSign1(String dSign1) {
		this.dSign1 = dSign1;
	}
	public String getdSign2() {
		return dSign2;
	}
	public void setdSign2(String dSign2) {
		this.dSign2 = dSign2;
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
	
	// srList getter setter
	public int getSrlCode() {
		return srlCode;
	}
	public void setSrlCode(int srlCode) {
		this.srlCode = srlCode;
	}
	public int getSrlMCode() {
		return srlMCode;
	}
	public void setSrlMCode(int srlMCode) {
		this.srlMCode = srlMCode;
	}
	public int getSrlEa() {
		return srlEa;
	}
	public void setSrlEa(int srlEa) {
		this.srlEa = srlEa;
	}
	public String getSrlTerm() {
		return srlTerm;
	}
	public void setSrlTerm(String srlTerm) {
		this.srlTerm = srlTerm;
	}
	
	// employees getter setter
	public String geteName() {
		return eName;
	}
	public void seteName(String eName) {
		this.eName = eName;
	}
	
	// product getter setter
	public int getpCode() {
		return pCode;
	}
	public void setpCode(int pCode) {
		this.pCode = pCode;
	}
	public String getpName() {
		return pName;
	}
	public void setpName(String pName) {
		this.pName = pName;
	}
	public int getpManhour() {
		return pManhour;
	}
	public void setpManhour(int pManhour) {
		this.pManhour = pManhour;
	}
	public int getpCate() {
		return pCate;
	}
	public void setpCate(int pCate) {
		this.pCate = pCate;
	}
	public int getpPrice() {
		return pPrice;
	}
	public void setpPrice(int pPrice) {
		this.pPrice = pPrice;
	}
	public String getpDate() {
		return pDate;
	}
	public void setpDate(String pDate) {
		this.pDate = pDate;
	}
	public int getpEa() {
		return pEa;
	}
	public void setpEa(int pEa) {
		this.pEa = pEa;
	}
	public String getpImage() {
		return pImage;
	}
	public void setpImage(String pImage) {
		this.pImage = pImage;
	}
	
	// material getter setter
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
	public int getmCate() {
		return mCate;
	}
	public void setmCate(int mCate) {
		this.mCate = mCate;
	}
	public int getmPrice() {
		return mPrice;
	}
	public void setmPrice(int mPrice) {
		this.mPrice = mPrice;
	}
	public String getmDate() {
		return mDate;
	}
	public void setmDate(String mDate) {
		this.mDate = mDate;
	}
	public int getmEa() {
		return mEa;
	}
	public void setmEa(int mEa) {
		this.mEa = mEa;
	}
	public String getmImage() {
		return mImage;
	}
	public void setmImage(String mImage) {
		this.mImage = mImage;
	}
	
	// fList getter setter
	public int getFldCode() {
		return fldCode;
	}
	public void setFldCode(int fldCode) {
		this.fldCode = fldCode;
	}
	public int getFlpCode() {
		return flpCode;
	}
	public void setFlpCode(int flpCode) {
		this.flpCode = flpCode;
	}
	public int getFlpEa() {
		return flpEa;
	}
	public void setFlpEa(int flpEa) {
		this.flpEa = flpEa;
	}
	public long getWorkCode() {
		return workCode;
	}
	public void setWorkCode(long workCode) {
		this.workCode = workCode;
	}
	public String getWorkLine() {
		return workLine;
	}
	public void setWorkLine(String workLine) {
		this.workLine = workLine;
	}
	public int getWorkPeople() {
		return workPeople;
	}
	public void setWorkPeople(int workPeople) {
		this.workPeople = workPeople;
	}
	public int getWorkTime() {
		return workTime;
	}
	public void setWorkTime(int workTime) {
		this.workTime = workTime;
	}
	public String getWorkStartDate() {
		return workStartDate;
	}
	public void setWorkStartDate(String workStartDate) {
		this.workStartDate = workStartDate;
	}
	public String getWorkEndDate() {
		return workEndDate;
	}
	public void setWorkEndDate(String workEndDate) {
		this.workEndDate = workEndDate;
	}
	public int getDys() {
		return dys;
	}
	public void setDys(int dys) {
		this.dys = dys;
	}
}
