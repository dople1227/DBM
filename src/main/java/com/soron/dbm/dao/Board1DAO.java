package com.soron.dbm.dao;

import java.util.List;

import com.soron.dbm.dto.Board1DTO;
import com.soron.dbm.dto.Criteria;

public interface Board1DAO {
	List<Board1DTO> selList(Criteria cri);
	Board1DTO selPostByNo(int no);
	public int selTotCnt(Criteria cri);
	public void insPost(Board1DTO post);
	public void udtPost(Board1DTO post);
	public void udtPostHits(int no);
	public void delPost(int no);
}