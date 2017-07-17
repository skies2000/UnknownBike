package hwan;

public class HwanVo {
	
	//login.jsp에서 사용
	String userid;
	String userpwd;
	
	//employees table
	String ecode;
	String epwd;
	String ename;
	String eimage;
	
	//product table
	int pcode;
	String pname;
	int pea;
	int pcost;
	int pprice;
	String pdev;
	int pcate;
	int pstatus;
	String pdate;
	String pimage;
	int pmanhour;
	
	//document table
	String dWrite;
	String dname;
	String dSign;
	int dStatus; 
	String dcont;
	String dcate;
	int dcode;
	String ddate;
	//문서 카테고리 이름
	String dcateName;
	//문서 상태 이름
	String dstatudName;
	
	
	
	
	//metarial table
	String mcode;
	String mname;
	String mimage;
	int mprice;
	
	//MList table
	int mlpcode;
	int mlmcode;
	int mlmea;
	
	//검색어
	String findStr;
	
	//결재 승인자 1, 2
	String appOne;
	String appTwo;
	
	
	int nowPage;
	
	
	
	
	
	
	
	
	public String getDstatudName() {
		return dstatudName;
	}
	public void setDstatudName(String dstatudName) {
		this.dstatudName = dstatudName;
	}
	public String getDdate() {
		return ddate;
	}
	public void setDdate(String ddate) {
		this.ddate = ddate;
	}
	public int getDcode() {
		return dcode;
	}
	public void setDcode(int dcode) {
		this.dcode = dcode;
	}
	public String getDcateName() {
		return dcateName;
	}
	public void setDcateName(String dcateName) {
		this.dcateName = dcateName;
	}
	public String getDcate() {
		return dcate;
	}
	public void setDcate(String dcate) {
		this.dcate = dcate;
	}
	public int getNowPage() {
		return nowPage;
	}
	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}
	public int getMlpcode() {
		return mlpcode;
	}
	public void setMlpcode(int mlpcode) {
		this.mlpcode = mlpcode;
	}
	public int getMlmcode() {
		return mlmcode;
	}
	public void setMlmcode(int mlmcode) {
		this.mlmcode = mlmcode;
	}
	public int getMlmea() {
		return mlmea;
	}
	public void setMlmea(int mlmea) {
		this.mlmea = mlmea;
	}
	public int getMprice() {
		return mprice;
	}
	public void setMprice(int mprice) {
		this.mprice = mprice;
	}
	public String getAppOne() {
		return appOne;
	}
	public void setAppOne(String appOne) {
		this.appOne = appOne;
	}
	public String getAppTwo() {
		return appTwo;
	}
	public void setAppTwo(String appTwo) {
		this.appTwo = appTwo;
	}
	public String getFindStr() {
		return findStr;
	}
	public void setFindStr(String findStr) {
		this.findStr = findStr;
	}
	public String getDcont() {
		return dcont;
	}
	public void setDcont(String dcont) {
		this.dcont = dcont;
	} 
	public int getPea() {
		return pea;
	}
	public void setPea(int pea) {
		this.pea = pea;
	}
	public int getPcost() {
		return pcost;
	}
	public void setPcost(int pcost) {
		this.pcost = pcost;
	}
	public int getPprice() {
		return pprice;
	}
	public void setPprice(int pprice) {
		this.pprice = pprice;
	}
	public int getPmanhour() {
		return pmanhour;
	}
	public void setPmanhour(int pmanhour) {
		this.pmanhour = pmanhour;
	}
	public String getPimage() {
		return pimage;
	}
	public void setPimage(String pimage) {
		this.pimage = pimage;
	}
	public int getPcode() {
		return pcode;
	}
	public void setPcode(int pcode) {
		this.pcode = pcode;
	}
	public String getPdate() {
		return pdate;
	}
	public void setPdate(String pdate) {
		this.pdate = pdate;
	}
	public int getPstatus() {
		return pstatus;
	}
	public void setPstatus(int pstatus) {
		this.pstatus = pstatus;
	}

	
	
	public String getMcode() {
		return mcode;
	}
	public void setMcode(String mcode) {
		this.mcode = mcode;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public String getMimage() {
		return mimage;
	}
	public void setMimage(String mimage) {
		this.mimage = mimage;
	}
	public String getdSign() {
		return dSign;
	}
	public void setdSign(String dSign) {
		this.dSign = dSign;
	}
	public String getdWrite() {
		return dWrite;
	}
	public void setdWrite(String dWrite) {
		this.dWrite = dWrite;
	}
	public int getdStatus() {
		return dStatus;
	}
	public void setdStatus(int dStatus) {
		this.dStatus = dStatus;
	}
	public int getPcate() {
		return pcate;
	}
	public void setPcate(int pcate) {
		this.pcate = pcate;
	}
	public String getPdev() {
		return pdev;
	}
	public void setPdev(String pdev) {
		this.pdev = pdev;
	}
	public String getEimage() {
		return eimage;
	}
	public void setEimage(String eimage) {
		this.eimage = eimage;
	}
	public String getDname() {
		return dname;
	}
	public void setDname(String dname) {
		this.dname = dname;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public String getEname() {
		return ename;
	}
	public void setEname(String ename) {
		this.ename = ename;
	}
	public String getUserpwd() {
		return userpwd;
	}
	public void setUserpwd(String userpwd) {
		this.userpwd = userpwd;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getEpwd() {
		return epwd;
	}
	public void setEpwd(String epwd) {
		this.epwd = epwd;
	}
	public String getEcode() {
		return ecode;
	}
	public void setEcode(String ecode) {
		this.ecode = ecode;
	}
	
}
