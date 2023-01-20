package com.spring.bookdream.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.bookdream.vo.PurchaseVO;

@Repository
public class PurchaseDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;

	public int insertPurchase(PurchaseVO user_no) {

		System.out.println("---> 구매목록 저장 <---");
		
		return mybatis.insert("PurchaseDAO.insertPurchase", user_no);
	}
	
}