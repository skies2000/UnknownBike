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
	int pcate;
	String pdev;
	String pname;

	//document table
	String dWrite;
	String dname;
	String dSign;
	int dStatus; 
	
	
	//metarial table
	String mcode;
	String mname;
	String mimage;
	
	
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
