package beanhoon;


public class PurListVo {
	// document 테이블
	private int dCode = 0;
	private String dName;
	private String dCont;
	private String dDate;
	private int dWrite = 0;
	private int dSign = 0;
	private int dStatus = 0;
	private String dCate;
	
	// srList 테이블
	private int srlCode = 0;
	private int srlMCode = 0;
	private int srlEa = 0;
	private String srlTerm;
	
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
	public int getdSign() {
		return dSign;
	}
	public void setdSign(int dSign) {
		this.dSign = dSign;
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
}
