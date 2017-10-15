package edu.missouri.cs.news.util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import edu.missouri.cs.news.handler.IResultSetHandler;


/**
 * 通过Jdbc访问数据库的模板 
 * @author LSY
 */
public class JdbcTemplate {

	private JdbcTemplate() {
	}

	/**
	 * 执行DML语句的模板
	 * @param sql 数据库修改的sql语句
	 * @param params sql语句中所传递的参数
	 */
	public static void update(String sql, Object... params) {
		try (Connection conn = JdbcUtil.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
			for (int i = 0; i < params.length; i++) {
				ps.setObject(i + 1, params[i]);
			}
			ps.executeUpdate();
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	public static <T> T query(String sql, IResultSetHandler<T> handler, Object... params) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			conn = JdbcUtil.getConnection();
			ps = conn.prepareStatement(sql);
			for (int i = 0; i < params.length; i++) {
				ps.setObject(i + 1, params[i]);
			}
			rs = ps.executeQuery();
			return handler.handle(rs);
		} catch (Exception e) {
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(conn, ps, rs);
		}
	}
}
