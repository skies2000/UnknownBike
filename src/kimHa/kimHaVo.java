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
