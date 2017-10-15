package edu.missouri.cs.news.api.get_news;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.missouri.cs.news.dao.INewsDAO;
import edu.missouri.cs.news.dao.impl.NewsDAOImpl;
import edu.missouri.cs.news.domain.News;
import net.sf.json.JSONArray;

public class GetNewsSevrlet extends HttpServlet {

	// 序列化ID
	private static final long serialVersionUID = -6979266559018342801L;

	@Override
	public void init() throws ServletException {
	}
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 设置请求和响应的字符集
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json;charset=UTF-8");
		
		INewsDAO dao = new NewsDAOImpl();
		
		try {
			List<News> newzz = dao.getAll();
			PrintWriter writer = resp.getWriter();
//			writer.write(newzz.toString());
			
			JSONArray jsonArr = JSONArray.fromObject(newzz);
			writer.write(jsonArr.toString());
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		// 获取用户的邮件
//		String email = req.getParameter("email");

	}
}
