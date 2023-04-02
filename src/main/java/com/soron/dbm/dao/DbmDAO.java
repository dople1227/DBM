package com.soron.dbm.dao;

import java.util.List;

import com.soron.dbm.dto.Criteria;
import com.soron.dbm.dto.DbmColumnDTO;
import com.soron.dbm.dto.DbmTableDTO;

public interface DbmDAO {
	List<DbmTableDTO> selTableList(Criteria cri);	
	List<DbmColumnDTO> selColumnList(String name);
	public int selTableTotCnt(Criteria cri);
	
	public int alterColumn(DbmColumnDTO dto);
	
	public void insPost(DbmTableDTO post);
	public void udtPost(DbmTableDTO post);
	DbmTableDTO udtPostHits(int no);
	public void delPost(int no);
	
	
	

}