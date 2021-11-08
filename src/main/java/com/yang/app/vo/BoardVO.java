package com.yang.app.vo;

import java.sql.Date;

public class BoardVO {


	private int bnum;
	private String btitle;
	private String filename;
	private String bwriter;
	private String bcontent;
	private Date bdate;
	
	public BoardVO() {}
	
	public BoardVO(final int bnum, final String btitle, final String bcontent) {
		this.bnum = bnum;
		this.btitle = btitle;
		this.bcontent = bcontent;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
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

	public String getBwriter() {
		return bwriter;
	}

	public void setBwriter(String bwriter) {
		this.bwriter = bwriter;
	}

	public String getBcontent() {
		return bcontent;
	}

	public void setBcontent(String bcontent) {
		this.bcontent = bcontent;
	}

	public Date getBdate() {
		return bdate;
	}

	public void setBdate(Date bdate) {
		this.bdate = bdate;
	}

	@Override
	public String toString() {
		return "BoardVO [bnum=" + bnum + ", btitle=" + btitle + ", filename=" + filename + ", bwriter=" + bwriter
				+ ", bcontent=" + bcontent + ", bdate=" + bdate + "]";
	}

}
