package pjh;

import java.util.List;

public class ReViewVo {
	int serial;
	int pSerial;
	int hit;
	int rno;
	String subject = "";
	String doc = "";
	String mid = "";
	String pwd = "";
	String mdate = "";
	String gubun = "";
	
	List<ReViewAttVo> attList;
	List<ReViewAttVo> delList;
	
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public List<ReViewAttVo> getAttList() {
		return attList;
	}
	public void setAttList(List<ReViewAttVo> attList) {
		this.attList = attList;
	}
	public List<ReViewAttVo> getDelList() {
		return delList;
	}
	public void setDelList(List<ReViewAttVo> delList) {
		this.delList = delList;
	}
	public int getSerial() {
		return serial;
	}
	public void setSerial(int serial) {
		this.serial = serial;
	}
	public int getpSerial() {
		return pSerial;
	}
	public void setpSerial(int pSerial) {
		this.pSerial = pSerial;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getDoc() {
		return doc;
	}
	public void setDoc(String doc) {
		this.doc = doc;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getMdate() {
		return mdate;
	}
	public void setMdate(String mdate) {
		this.mdate = mdate;
	}
	public String getGubun() {
		return gubun;
	}
	public void setGubun(String gubun) {
		this.gubun = gubun;
	}

}
