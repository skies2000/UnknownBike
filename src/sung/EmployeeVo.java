package sung;

public class EmployeeVo {
	private int eCode;
	private String eName;
	private int eDepart;
	private int ePosition;
	
	
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
	
	
}
