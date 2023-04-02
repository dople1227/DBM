package com.soron.dbm.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class DbmColumnDTO {
    private String table_name;
    private String column_name;
    private int ordinal_position;
    private String column_default;
    private String is_nullable;
    private String column_type;
    private String column_key;
    private String extra;
    private String column_comment;
    
    // 컬럼UPDATE
    private String tableName;
    private String oldColName;
    private String newColName;
    private String colType;
    private String defaultVal;
    private String isNull;
    private String colComment;
    

    public DbmColumnDTO() {
    }

    public DbmColumnDTO(String tableName, String oldColName, String newColName, String colType, String isNull,  String defaultVal, String colComment, String extra) {
	this.tableName = tableName;
	this.oldColName = oldColName;
	this.newColName= newColName;
	this.colType = colType;
	this.isNull = isNull;
	this.defaultVal = defaultVal;
	this.colComment = colComment;
	this.extra = extra;
	
    }

    public DbmColumnDTO(String table_name, String column_name, int ordinal_position, String column_default,
	    String is_nullable, String column_type, String column_key, String extra, String column_comment) {
	this.table_name = table_name;
	this.column_name = column_name;
	this.ordinal_position = ordinal_position;
	this.column_default = column_default;
	this.is_nullable = is_nullable;
	this.column_type = column_type;
	this.column_key = column_key;
	this.extra = extra;
	this.column_comment = column_comment;
    }
}