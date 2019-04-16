<%@page import="bean.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*,java.sql.*"%>
<%
	String id = request.getParameter("val");
	if (id == null || id.trim().equals("")) {
		out.print("<p>Please enter Id!</p>");
	} 
	else 
	{
		try 
		{

			//Connection con = ConnectionProvider.getCon();

			String DRIVER = "com.mysql.jdbc.Driver";
			String CONNECTION_URL = "jdbc:mysql://www.db4free.net:3306/toll_collection1?autoReconnect=true&useSSL=false";
			String USERNAME = "se_team_2";
			String PASSWORD = "nopassword1234";

			Class.forName(DRIVER);
			Connection con = DriverManager.getConnection(CONNECTION_URL, USERNAME, PASSWORD);

			PreparedStatement ps = con
					.prepareStatement("select * from main_admin where password like '" + id + "%'");
			ResultSet rs = ps.executeQuery();

			if (!rs.isBeforeFirst()) 
			{
				out.println("<p>ID not Found!</p>");
			} 
			else 
			{
				out.print("<table border='1' width='100%'>");
				out.print("<tr><th>Idddd</th></tr>");
				while (rs.next()) {
					out.print("<tr><td>" + rs.getString(3) + "</td></tr>");
			}
				out.print("</table>");
			} //end of else for rs.isBeforeFirst  
			//con.close();
		} 
		catch (Exception e) 
		{
			out.print(e);
		}
	} //end of else
%>
