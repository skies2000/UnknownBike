package kimHa;

public class kimHaVo {

	//사원
	int ecode; //사원 번호
	String ename; //사원 이름
	
	//문서
	String dname = "";
	String dcont="";
	String dwrite="";
	String dsign="";
	
	//자재
	String mname=""; //자재명
	int mprice=0; // 원가
	public int getMea() {
		return mea;
	}
	public void setMea(int mea) {
		this.mea = mea;
	}
	String mdev =""; //등록자
	int mcate=0;
	int mcode=0; 
	String mdate=""; // 등록일
	int mstate =0; //결재상태
	String mimage = "";
	int mea = 0; // 단가
	
	
	public String getMimage() {
		return mimage;
	}
	public void setMimage(String mimage) {
		this.mimage = mimage;
	}
	public int getMcode() {
		return mcode;
	}
	public void setMcode(int mcode) {
		this.mcode = mcode;
	}
	public String getMdate() {
		return mdate;
	}
	public void setMdate(String mdate) {
		this.mdate = mdate;
	}
	public int getMstate() {
		return mstate;
	}
	public void setMstate(int mstate) {
		this.mstate = mstate;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public int getMprice() {
		return mprice;
	}
	public void setMprice(int mprice) {
		this.mprice = mprice;
	}
	

	public String getMdev() {
		return mdev;
	}
	public void setMdev(String mdev) {
		this.mdev = mdev;
	}
	public int getMcate() {
		return mcate;
	}
	public void setMcate(int mcate) {
		this.mcate = mcate;
	}
	public int getEcode() {
		return ecode;
	}
	public void setEcode(int ecode) {
		this.ecode = ecode;
	}
	public String getEname() {
		return ename;
	}
	public void setEname(String ename) {
		this.ename = ename;
	}
	public String getDname() {
		return dname;
	}
	public void setDname(String dname) {
		this.dname = dname;
	}
	public String getDcont() {
		return dcont;
	}
	public void setDcont(String dcont) {
		this.dcont = dcont;
	}
	public String getDwrite() {
		return dwrite;
	}
	public void setDwrite(String dwrite) {
		this.dwrite = dwrite;
	}
	public String getDsign() {
		return dsign;
	}
	public void setDsign(String dsign) {
		this.dsign = dsign;
	}
	
}
