package member;

public class MemberBean {
	
	private String id;
	private String pwd;
	private String name;
	private String birth_yyyy;
	private String birth_mm;
	private String birth_dd;
	private String gender;
	private String phone;
	private int questionCnt;
	private int answerCnt;
	private int inPoint;
	
	
	public int getQuestionCnt() {
		return questionCnt;
	}
	public void setQuestionCnt(int questionCnt) {
		this.questionCnt = questionCnt;
	}
	public int getAnswerCnt() {
		return answerCnt;
	}
	public void setAnswerCnt(int answerCnt) {
		this.answerCnt = answerCnt;
	}
	public int getInPoint() {
		return inPoint;
	}
	public void setInPoint(int inPoint) {
		this.inPoint = inPoint;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBirth_yyyy() {
		return birth_yyyy;
	}
	public void setBirth_yyyy(String birth_yyyy) {
		this.birth_yyyy = birth_yyyy;
	}
	public String getBirth_mm() {
		return birth_mm;
	}
	public void setBirth_mm(String birth_mm) {
		this.birth_mm = birth_mm;
	}
	public String getBirth_dd() {
		return birth_dd;
	}
	public void setBirth_dd(String birth_dd) {
		this.birth_dd = birth_dd;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
}