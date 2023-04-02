package com.soron.dbm.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Criteria{
	private int pageNum;
	private int amount;
		
	//기본 생성자 1페이지 10개
	public Criteria() {
		this(1,10);
	}
	
	//매개변수 생성자 pageNum페이지 amount개
	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
}