package member;

import java.text.SimpleDateFormat;
import java.util.Date;

public class MemberVO {
	private int no;
	private String id;
	private String pw;
	private	String name;
	private int age;
	private String area;
	private String position;
	private String phone;
	private String email;
	private Date regdate;
	private int	teamNo;
	
	private String myTeamName;
	private String rivalTeamName;
		
	public MemberVO() {	}
		
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public String getMyTeamName() {
		return myTeamName;
	}
	public void setMyTeamName(String myTeamName) {
		this.myTeamName = myTeamName;
	}
	public String getRivalTeamName() {
		return rivalTeamName;
	}
	public void setRivalTeamName(String rivalTeamName) {
		this.rivalTeamName = rivalTeamName;
	}
	public int getNo() {
		return no;
	}
	public String getId() {
		return id;
	}
	public String getPw() {
		return pw;
	}
	public String getName() {
		return name;
	}
	public int getAge() {
		return age;
	}
	public String getArea() {
		return area;
	}
	public String getPosition() {
		return position;
	}
	public String getPhone() {
		return phone;
	}
	public String getEmail() {
		return email;
	}
	public Date getDate() {
		return regdate;
	}
	public int getTeamNo() {
		return teamNo;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public void setId(String id) {
		this.id = id;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public void setDate(Date regdate) {
		this.regdate = regdate;
	}
	public String getStrDate() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일");
		return sdf.format(regdate);
	}
	public void setTeamNo(int teamNo) {
		this.teamNo = teamNo;
	}
	
	@Override
	public String toString() {
		return "MemberVO [no=" + no + ", id=" + id + ", pw=" + pw + ", name="
				+ name + ", age=" + age + ", area=" + area + ", position="
				+ position + ", phone=" + phone + ", email=" + email
				+ ", regdate=" + regdate + ", teamNo=" + teamNo + "]";
	}
	
}
