package com.letplay.letplaytest.dto;

public class MatchJoin {
	private int matchSeq;
	private String id;
	private int joinSeq;
	private String nickName;
	public MatchJoin() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MatchJoin(int matchSeq, String id, int joinSeq, String nickName) {
		super();
		this.matchSeq = matchSeq;
		this.id = id;
		this.joinSeq = joinSeq;
		this.nickName = nickName;
	}
	public int getMatchSeq() {
		return matchSeq;
	}
	public void setMatchSeq(int matchSeq) {
		this.matchSeq = matchSeq;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getJoinSeq() {
		return joinSeq;
	}
	public void setJoinSeq(int joinSeq) {
		this.joinSeq = joinSeq;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
}
