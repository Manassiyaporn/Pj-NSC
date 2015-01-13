<%@ page language="java" contentType="text/html; UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
	String id_vowel = request.getParameter("vowel_str");
	String userDB = "root";
	String pwdDB = "";
	String urlDB = "jdbc:mysql://localhost:3306/pronounceit?";

	try {
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(urlDB, userDB,
				pwdDB);

		String sql = "select * from vowel where Vowel_id=" + id_vowel;
		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery(sql);

		while (rs.next()) {
			String address = rs.getString("address");
			out.println(address);
		}
		stmt.close();
		con.close();
	} catch (Exception e) {
		out.print("Exception:" + e);
	}
%>