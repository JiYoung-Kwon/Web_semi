package mky;

import java.util.List;


public class ContactVo {
	int serial;
	int pSerial;
	int hit;
	int attCnt;
	
	String mid = "";
	String subject = "";
	String irum = "";
	String mdate = "";
	String phone= "";
	String email = "";
	String doc = "";
	String choice= "";
	String store= "";
	
	List<ContactAttVo> attList; // 첨부파일 목록
	List<ContactAttVo> delList; // 삭제파일 목록
	
	
	public List<ContactAttVo> getAttList() {
		return attList;
	}
	public void setAttList(List<ContactAttVo> attList) {
		this.attList = attList;
	}
	public List<ContactAttVo> getDelList() {
		return delList;
	}
	public void setDelList(List<ContactAttVo> delList) {
		this.delList = delList;
	}
	
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getStore() {
		return store;
	}
	public void setStore(String store) {
		this.store = store;
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
	public int getAttCnt() {
		return attCnt;
	}
	public void setAttCnt(int attCnt) {
		this.attCnt = attCnt;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	
	public String getIrum() {
		return irum;
	}
	public void setIrum(String irum) {
		this.irum = irum;
	}
	
	public String getMdate() {
		return mdate;
	}
	public void setMdate(String mdate) {
		this.mdate = mdate;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getDoc() {
		return doc;
	}
	public void setDoc(String doc) {
		this.doc = doc;
	}
	public String getChoice() {
		return choice;
	}
	public void setChoice(String choice) {
		this.choice = choice;
	}
	
	
}
