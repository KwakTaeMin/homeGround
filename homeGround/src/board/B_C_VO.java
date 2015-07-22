package board;

import java.util.Date;

public class B_C_VO {

	private int no;
	private String contents;
	private int memberNo;
	private int teamNo;
	private int boardNo;
	private Date date;
	private String memberName;
	
	public B_C_VO() {
	}

	public B_C_VO(int no, String contents, int memberNo, int teamNo,
			int boardNo, Date date, String memberName) {
		super();
		this.no = no;
		this.contents = contents;
		this.memberNo = memberNo;
		this.teamNo = teamNo;
		this.boardNo = boardNo;
		this.date = date;
		this.memberName = memberName;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public int getTeamNo() {
		return teamNo;
	}

	public void setTeamNo(int teamNo) {
		this.teamNo = teamNo;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	
	
	
	
}
