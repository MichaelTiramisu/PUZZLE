package edu.missouri.cs.news.dao;
import java.sql.SQLException;
import java.util.List;

import edu.missouri.cs.news.domain.News;
import edu.missouri.cs.news.domain.NewsType;


public interface INewsDAO {
	
	public News getOne(Integer id) throws SQLException;
	
	public List<News> getAll() throws SQLException;
	
	public List<NewsType> getAllTypes() throws SQLException;
}
