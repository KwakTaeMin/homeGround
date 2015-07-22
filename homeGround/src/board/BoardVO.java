package board;

import java.text.SimpleDateFormat;
import java.util.Date;

public class BoardVO {

	private int no;
	private String title;
	private String contents;
	private int member;
	private int team;
	private String photo;
	private int like;
	private int hate;
	private Date regdate;
	private String memberName;

	public BoardVO() {
	}

	public BoardVO(int no, String title, String contents, int member, int team,
			String photo, int like, int hate, Date regdate, String memberName) {
		super();
		this.no = no;
		this.title = title;
		this.contents = contents;
		this.member = member;
		this.team = team;
		this.photo = photo;
		this.like = like;
		this.hate = hate;
		this.regdate = regdate;
		this.memberName = memberName;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public int getMember() {
		return member;
	}

	public void setMember(int member) {
		this.member = member;
	}

	public int getTeam() {
		return team;
	}

	public void setTeam(int team) {
		this.team = team;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public int getLike() {
		return like;
	}

	public void setLike(int like) {
		this.like = like;
	}

	public int getHate() {
		return hate;
	}

	public void setHate(int hate) {
		this.hate = hate;
	}

	public Date getRegdate() {
		return regdate;
	}
	
	public String getStrRegdate() {
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		return df.format(regdate);
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

}
