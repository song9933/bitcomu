package kr.co.bitcomu.repository.vo;

public class Code {
	private String codeGroup;
	private int codeValue;
	private String codeName;
	public Code() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Code(String codeGroup, int codeValue, String codeName) {
		super();
		this.codeGroup = codeGroup;
		this.codeValue = codeValue;
		this.codeName = codeName;
	}
	public String getCodeGroup() {
		return codeGroup;
	}
	public void setCodeGroup(String codeGroup) {
		this.codeGroup = codeGroup;
	}
	public int getCodeValue() {
		return codeValue;
	}
	public void setCodeValue(int codeValue) {
		this.codeValue = codeValue;
	}
	public String getCodeName() {
		return codeName;
	}
	public void setCodeName(String codeName) {
		this.codeName = codeName;
	}
	@Override
	public String toString() {
		return "Code [codeGroup=" + codeGroup + ", codeValue=" + codeValue + ", codeName=" + codeName + "]";
	}
	
	
}
