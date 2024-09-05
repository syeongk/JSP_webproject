package dto;


public class Member{
	private String memberId;
	private String memberPasswd;
	private String memberName;
	private String memberPhone;
	private String memberEmail;
	
	
	public Member() {
		super();
	}
	
	public Member(String memberId, String memberPasswd, String memberName, String memberPhone, String memberEmail) {
		this.memberId = memberId;
		this.memberPasswd = memberPasswd;
		this.memberName = memberName;
		this.memberPhone = memberPhone;
		this.memberEmail = memberEmail;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getMemberPasswd() {
		return memberPasswd;
	}

	public void setMemberPasswd(String memberPasswd) {
		this.memberPasswd = memberPasswd;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getMemberPhone() {
		return memberPhone;
	}

	public void setMemberPhone(String memberPhone) {
		this.memberPhone = memberPhone;
	}

	public String getMemberEmail() {
		return memberEmail;
	}

	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}
}