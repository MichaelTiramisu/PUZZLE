package edu.missouri.cs.news.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import edu.missouri.cs.news.dao.INewsDAO;
import edu.missouri.cs.news.domain.News;
import edu.missouri.cs.news.domain.NewsType;
import edu.missouri.cs.news.handler.IResultSetHandler;
import edu.missouri.cs.news.util.JdbcTemplate;

public class NewsDAOImpl implements INewsDAO {

	@Override
	public News getOne(Integer id) throws SQLException {
		String sql = "select * from news where id = ?";
		Object[] params = { id };
		
		try {
			return JdbcTemplate.query(sql, new IResultSetHandler<News>() {

				@Override
				public News handle(ResultSet rs) throws SQLException {
					
					News news = null;
					
					while (rs.next()) {
						Integer id = rs.getInt("id");
						Integer typeId = rs.getInt("type_id");
						String title = rs.getString("title");
						String author = rs.getString("author");
						Long time = rs.getLong("time");
						String content = rs.getString("content");
						String imageUrl = rs.getString("imageUrl");

						news = new News(id, typeId, title, author, time, content, imageUrl);
					}

					return news;
				}
			}, params);

		} catch (Exception e) {
			throw new RuntimeException(e);
		}

//		return null;
	}

	@Override
	public List<News> getAll() throws SQLException {
		String sql = "select * from news";
		
		try {
			return JdbcTemplate.query(sql, new IResultSetHandler<List<News>>() {

				@Override
				public List<News> handle(ResultSet rs) throws SQLException {
					
					List<News> newzz = new ArrayList<News>();
					
					while (rs.next()) {
						Integer id = rs.getInt("id");
						Integer typeId = rs.getInt("type_id");
						String title = rs.getString("title");
						String author = rs.getString("author");
						Long time = rs.getLong("time");
						String content = rs.getString("content");
						String imageUrl = rs.getString("imageUrl");

						newzz.add(new News(id, typeId, title, author, time, content, imageUrl));
					}

					return newzz;
				}
			});

		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	@Override
	public List<NewsType> getAllTypes() throws SQLException {
		return null;
	}
	

}
