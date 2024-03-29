package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BaseConnection;

public class Suggest extends HttpServlet {
	private ArrayList lib = new ArrayList();
	//初始化数据集合,可以在这个字库中添加更多词条
	public void init() throws ServletException
	{
		//从数据库中提取 数据  
		String sql="select username from info ";
		BaseConnection bc =new BaseConnection();
		ResultSet rs=null;
		rs=bc.query(sql);
		
		try {
			while(rs.next()){
				lib.add(rs.getString("username"));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	/*	lib.add("a");
		lib.add("able");
		lib.add("access");
		lib.add("advance");*/
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 设置生成文件的类型和编码格式
		response.setContentType("text/xml; charset=UTF-8");
		response.setHeader("Cache-Control", "no-cache");
		PrintWriter out = response.getWriter();
		String output = "";
		// 处理接收到的参数
	    String key = request.getParameter("key");
	    ArrayList matchList = getMatchString(key);
	    
	    if(!matchList.isEmpty())
	    {
	    	output +="<response>";
	    	for(int i=0;i<matchList.size();i++)
	    	{
	    		String match = matchList.get(i).toString();
	    		output +="<item>"+match+"</item>";
	    	}
	    	output +="</response>";
	    }
		out.println(output);
		out.close();
	}
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}
	
	//取得所有匹配的字符串
	public ArrayList getMatchString(String key)
	{
		ArrayList result = new ArrayList();
		if(!lib.isEmpty())
		{
			for(int i=0;i<lib.size();i++)
			{
				String str = lib.get(i).toString();
				if(str.startsWith(key))
					result.add(str);
			}
		}
		return result;
	}
}