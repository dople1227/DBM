package com.soron.dbm.dto;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Board1DTO {
	private int no;
	private String title;
	private String content;
	private String writer;
	private Date ins_time;
	private Date udt_time;
	private int hits;
	
	public Board1DTO() {
		this.no = 1;
		this.title = "DEFAULT title";
		this.content = "DEFAULT content";
		this.writer = "soronprfbs";
		this.ins_time = Timestamp.valueOf(LocalDateTime.now());
		this.udt_time = Timestamp.valueOf(LocalDateTime.now());
		this.hits = 0;
	}
	
	public Board1DTO(int no, String title, String content, String writer, Date ins_time, Date udt_time, int hits) {
		this.no = no;
		this.title = title;
		this.content = content;
		this.writer = writer;
		this.ins_time = ins_time;
		this.ins_time = udt_time;
		this.hits = hits;
	}
	
}