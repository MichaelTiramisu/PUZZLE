package edu.missouri.cs.news.test;

import org.junit.Test;

import edu.missouri.cs.news.dao.INewsDAO;
import edu.missouri.cs.news.dao.impl.NewsDAOImpl;

public class NewsDAOTest {

	@Test
	public void getGetOne() throws Exception {
		
		try {
		INewsDAO dao = new NewsDAOImpl();
		System.out.println(dao.getOne(1));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Test
	public void getAll() throws Exception {
		
		INewsDAO dao = new NewsDAOImpl();
		System.out.println(dao.getAll());
		
	}
	
}
