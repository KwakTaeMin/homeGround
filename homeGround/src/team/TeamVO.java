package team;

import java.text.SimpleDateFormat;
import java.util.Date;

public class TeamVO {
	private int no;
	private String name;
	private String area;
	private int	coachNo;
	private String introduce;
	private String photo;
	private Date regdate;
	private int peopleNum;
	
	public TeamVO() {	}

	public int getNo() {
		return no;
	}

	public String getName() {
		return name;
	}

	public String getArea() {
		return area;
	}

	public int getCoachNo() {
		return coachNo;
	}

	public String getIntroduce() {
		return introduce;
	}

	public String getPhoto() {
		return photo;
	}

	public Date getRegdate() {
		return regdate;
	}
	
	public String getStrDate() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy년MM월dd일");
		return sdf.format(regdate);
	}
	
	public int getPeopleNum() {
		return peopleNum;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public void setCoachNo(int coachNo) {
		this.coachNo = coachNo;
	}

	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
	public void setPeopleNum(int peopleNum) {
		this.peopleNum = peopleNum;
	}

	@Override
	public String toString() {
		return "TeamVO [no=" + no + ", name=" + name + ", area=" + area
				+ ", coachNo=" + coachNo + ", introduce=" + introduce
				+ ", photo=" + photo + ", regdate=" + regdate + "]";
	}
	
}
