package com.javaex.vo;

public class GalleryVO {
	//필드
	private int no;
    private int user_no; // 작성자 회원번호
    private String content;
    private String filePath;
    private String orgName;
    private String saveName;
    private long fileSize;
    private String userName;
	
	//생성자
	public GalleryVO() {
		super();
	}
	
	public GalleryVO(int no, int user_no, String content, String filePath, String orgName, String saveName,
			long fileSize, String userName) {
		super();
		this.no = no;
		this.user_no = user_no;
		this.content = content;
		this.filePath = filePath;
		this.orgName = orgName;
		this.saveName = saveName;
		this.fileSize = fileSize;
		this.userName = userName;
	}

	//메소드gs
	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public String getOrgName() {
		return orgName;
	}

	public void setOrgName(String orgName) {
		this.orgName = orgName;
	}

	public String getSaveName() {
		return saveName;
	}

	public void setSaveName(String saveName) {
		this.saveName = saveName;
	}

	public long getFileSize() {
		return fileSize;
	}

	public void setFileSize(long fileSize) {
		this.fileSize = fileSize;
	}
	
	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	//메소드일반
	@Override
	public String toString() {
		return "FileVO [no=" + no + ", user_no=" + user_no + ", content=" + content + ", filePath=" + filePath
				+ ", orgName=" + orgName + ", saveName=" + saveName + ", fileSize=" + fileSize + "]";
	}
}
