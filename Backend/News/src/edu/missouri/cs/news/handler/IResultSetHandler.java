package edu.missouri.cs.news.handler;

import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * 处理结果集对象的接口，所有使用JdbcTemplete进行查询，都必须实现此接口
 * @author LSY
 *
 * @param <T>
 */
public interface IResultSetHandler<T> {
	T handle(ResultSet rs) throws SQLException;
}
