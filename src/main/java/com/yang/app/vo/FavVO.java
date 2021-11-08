package com.yang.app.vo;

// fnum int primary key,						-- 관심글 고유번호
// mid varchar(50) not null,					-- 회원아이디
// bnum	int not null,							-- 게시글 고유번호
// btitle varchar(30) not null,					-- 게시글 제목
// filename varchar(30)							-- 파일 이름

public class FavVO {
	private int fnum;
	private String mid;
	private int bnum;
	private String btitle;
	private String filename;

	public int getFnum() {
		return fnum;
	}

	public void setFnum(int fnum) {
		this.fnum = fnum;
	}

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public int getBnum() {
		return bnum;
	}

	public void setBnum(int bnum) {
		this.bnum = bnum;
	}

	public String getBtitle() {
		return btitle;
	}

	public void setBtitle(String btitle) {
		this.btitle = btitle;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	@Override
	public String toString() {
		return "FavVO [fnum=" + fnum + ", mid=" + mid + ", bnum=" + bnum + ", btitle=" + btitle + ", filename="
				+ filename + "]";
	}

}
