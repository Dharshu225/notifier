package com.Dharshiny.notifier.dto;

import java.io.Serializable;

public class Note implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int nid;
	private String note;
	private String description;
	private String status;
	private String sdate;
	private String edate;
	private String rdate;
	private int uid;
	
	public Note(){}
	
	public Note(int nid, String note, String description, String status, String sdate, String edate, String rdate,int uid) {
		super();
		this.nid = nid;
		this.note = note;
		this.description = description;
		this.status = status;
		this.sdate = sdate;
		this.edate = edate;
		this.rdate = rdate;
		this.uid=uid;
	}

	public int getNid() {
		return nid;
	}
	public void setNid(int nid) {
		this.nid = nid;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	public String getSdate() {
		return sdate;
	}
	public void setSdate(String sdate) {
		this.sdate = sdate;
	}
	public String getEdate() {
		return edate;
	}
	public void setEdate(String edate) {
		this.edate = edate;
	}
	public String getRdate() {
		return rdate;
	}
	public void setRdate(String rdate) {
		this.rdate = rdate;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}

}
