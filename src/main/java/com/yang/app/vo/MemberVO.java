package com.yang.app.vo;

public class MemberVO {
// mnum mid mpw mnickname mphone memail maddress

    private int mnum;
    private String mid;
    private String mpw;
    private String mnickname;
    private String mphone;
    private String memail;
    private String maddress;
    private String maddressDetail;

    public String getMaddressDetail() {
        return maddressDetail;
    }

    public void setMaddressDetail(String maddressDetail) {
        this.maddressDetail = maddressDetail;
    }

    public int getMnum() {
        return mnum;
    }

    public void setMnum(int mnum) {
        this.mnum = mnum;
    }

    public String getMid() {
        return mid;
    }

    public void setMid(String mid) {
        this.mid = mid;
    }

    public String getMpw() {
        return mpw;
    }

    public void setMpw(String mpw) {
        this.mpw = mpw;
    }

    public String getMnickname() {
        return mnickname;
    }

    public void setMnickname(String mnickname) {
        this.mnickname = mnickname;
    }

    public String getMphone() {
        return mphone;
    }

    public void setMphone(String mphone) {
        this.mphone = mphone;
    }

    public String getMemail() {
        return memail;
    }

    public void setMemail(String memail) {
        this.memail = memail;
    }

    public String getMaddress() {
        return maddress;
    }

    public void setMaddress(String maddress) {
        this.maddress = maddress;
    }

    @Override
    public String toString() {
        return "MemberVO{" +
                "mnum=" + mnum +
                ", mid='" + mid + '\'' +
                ", mpw='" + mpw + '\'' +
                ", mnickname='" + mnickname + '\'' +
                ", mphone='" + mphone + '\'' +
                ", memail='" + memail + '\'' +
                ", maddress='" + maddress + '\'' +
                ", maddressDetail='" + maddressDetail + '\'' +
                '}';
    }
}
