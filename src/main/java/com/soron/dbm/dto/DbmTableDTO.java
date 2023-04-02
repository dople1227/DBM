package com.soron.dbm.dto;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class DbmTableDTO {
	private int no;
	private String table_schema;
	private String table_name;
	private int table_rows;
	private Date create_time;
	private Date update_time;
	private String table_comment;
	private boolean is_nullable;
	
	public DbmTableDTO() {
		this.no = 1;
		this.table_schema = "table_schema";
		this.table_name = "table_name";
		this.table_rows = 0;
		this.create_time = Timestamp.valueOf(LocalDateTime.now());
		this.update_time = Timestamp.valueOf(LocalDateTime.now());
		this.table_comment = "table_comment";
	}
	
	public DbmTableDTO(int no, String table_schema, String table_name, int table_rows, Date create_time, Date update_time, String table_comment,  boolean is_nullable) {
		this.no = no;
		this.table_schema = table_schema;
		this.table_name = table_name;
		this.table_rows = table_rows;
		this.create_time = create_time;
		this.update_time = update_time;
		this.table_comment = table_comment;
		this.is_nullable = is_nullable;
	}
	
}