package edu.missouri.cs.news.handler.impl;

import java.sql.ResultSet;
import java.sql.SQLException;

import edu.missouri.cs.news.handler.IResultSetHandler;



public class ScalarHandler implements IResultSetHandler<Long> {
	@Override
	public Long handle(ResultSet rs) throws SQLException {
		if (rs.next()) {
			return rs.getLong(1);
		}
		return 0L;
	}
}
