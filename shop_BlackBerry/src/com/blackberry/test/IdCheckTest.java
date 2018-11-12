package com.blackberry.test;

import static org.junit.Assert.*;

import org.junit.Test;

import com.blackberry.dao.MemberDAO;

public class IdCheckTest {
	String id = "sentilemon02";
	@Test
	public void testConfirmID() {
		MemberDAO mDao = MemberDAO.getInstance();
		mDao.confirmID(id);
	}

}
