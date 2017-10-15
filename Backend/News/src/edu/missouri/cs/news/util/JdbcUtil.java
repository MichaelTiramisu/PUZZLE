package edu.missouri.cs.news.util;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

/**
 * 通过Jdbc访问数据库的工具类 
 * @author LSY
 */
public class JdbcUtil {

	private JdbcUtil() {
	}

	// 数据库的url地址
	private static String url;
	// 数据库的用户名
	private static String username;
	// 数据库的密码
	private static String password;

	// 静态代码块，初始化数据库访问参数
	static {
		try {
			Properties properties = new Properties();
			// 获取类加载器
			ClassLoader loader = JdbcUtil.class.getClassLoader();
			InputStream in = loader.getResourceAsStream("db.properties");
			properties.load(in);
			in.close();
			// 加载数据库驱动
			Class.forName(properties.getProperty("driverClassName"));
			url = properties.getProperty("url");
			username = properties.getProperty("username");
			password = properties.getProperty("password");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 获取数据库连接对象
	 * TODO: 是否考虑用对象池？？？？？？
	 * @return 返回一个新的数据库连接对象
	 */
	public static Connection getConnection() {
		try {
			return DriverManager.getConnection(url, username, password);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	/**
	 * 关闭数据库有关的东西
	 * @param conn 数据库连接对象
	 * @param ps PreparedStatement对象
	 * @param rs 结果集对象
	 */
	public static void close(Connection conn, PreparedStatement ps, ResultSet rs) {
		try {
			// 关闭结果集
			if (rs != null) {
				rs.close();
			}
		} catch (SQLException e) {
			throw new RuntimeException(e);
		} finally {
			try {
				// 关闭PreparedStatement
				if (ps != null) {
					ps.close();
				}
			} catch (SQLException e) {
				throw new RuntimeException(e);
			} finally {
				// 关闭数据库连接
				try {
					if (conn != null) {
						conn.close();
					}
				} catch (SQLException e) {
					throw new RuntimeException(e);
				}
			}
		}
	}
}
