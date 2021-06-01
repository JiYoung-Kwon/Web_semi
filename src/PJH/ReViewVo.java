package PJH;

import java.util.List;

public class ReViewVo {
	int serial;
	int pserial;
	int hit;
	String gubun ="";
	String mdate ="";
	String mid ="";
	String subject ="";
	String doc ="";
	String pwd ="";
	
	List<ReViewAttVo> attList;	//첨부 파일 목록
	List<ReViewAttVo> delList;	//삭제 파일 목록
	
	
	
	
	public int getPserial() {
		return pserial;
	}
	public void setPserial(int pserial) {
		this.pserial = pserial;
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
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public int getSerial() {
		return serial;
	}
	public void setSerial(int serial) {
		this.serial = serial;
	}
	public String getDoc() {
		return doc;
	}
	public void setDoc(String doc) {
		this.doc = doc;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public String getGubun() {
		return gubun;
	}
	public void setGubun(String gubun) {
		this.gubun = gubun;
	}
	public String getMdate() {
		return mdate;
	}
	public void setMdate(String mdate) {
		this.mdate = mdate;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
}
