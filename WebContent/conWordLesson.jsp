<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
	request.setCharacterEncoding("UTF-8");
	String idCon = request.getParameter("con_str");
	String idVowel = request.getParameter("vowel_str");

	String userDB = "root";
	String pwdDB = "";
	String urlDB = "jdbc:mysql://localhost:3306/pronounceit?";

	try {
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(urlDB, userDB,
				pwdDB);

		String sql = "SELECT * FROM `word` WHERE `Consonant_id`='"+idCon+"' AND `Vowel_id`='"+idVowel+"'";
		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery(sql);

		while (rs.next()) {
			String id_word = rs.getString("Word_id");
			String name_word = rs.getString("Word_word");
			//String id_conWord = rs.getString("Consonant_id");
			//String id_vowelWord = rs.getString("Vowel_id");
			String address_word = rs.getString("address_word");

			out.println("<option value="+address_word+">"+name_word+"</option>");
		}
		stmt.close();
		con.close();
	} catch (Exception e) {
		out.print("Exception:" + e);
	}
%>