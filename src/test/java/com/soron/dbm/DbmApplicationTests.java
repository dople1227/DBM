package com.soron.dbm;


import java.util.List;
import org.junit.jupiter.api.Test;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.soron.dbm.dao.Board1DAO;
import com.soron.dbm.dto.Board1DTO;
import com.soron.dbm.dto.Criteria;

import lombok.extern.log4j.Log4j;
import lombok.extern.log4j.Log4j2;


@Log4j2
@SpringBootTest
class DbmApplicationTests {

	@Autowired
	private Board1DAO board1DAO;

	@Test
	void contextLoads() {
		Criteria cri = new Criteria();
		List<Board1DTO> list = board1DAO.selList(cri); 
		log.info("------test STARTTTTT------" + cri);
		list.forEach(board -> log.info(board.getNo()));
		log.info("------test ENDDDDDDD------");
		
	}

}
