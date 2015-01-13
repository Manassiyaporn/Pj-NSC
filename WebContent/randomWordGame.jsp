<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
	request.setCharacterEncoding("UTF-8");

	String userDB = "root";
	String pwdDB = "";
	String urlDB = "jdbc:mysql://localhost:3306/pronounceit?";

	try {
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(urlDB, userDB,
				pwdDB);

		//String sql = "SELECT 'word_id','word_word',COUNT(`word_id`) FROM word";
		String sql = "SELECT * FROM word ORDER BY RAND()LIMIT 1";
		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery(sql);

		while (rs.next()) {
			String id = rs.getString("word_id");
			String word = rs.getString("word_word");
			out.println(word);
		}
		stmt.close();
		con.close();
	} catch (Exception e) {
		out.print("Exception:" + e);
	}
%> 