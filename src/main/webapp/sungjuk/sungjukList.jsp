<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sungjukList.jsp</title>
</head>


<style>

h3,p{
	text-align : center;
}
	table{
		width: 50%;
		border : 1px solid black;
		margin : 0 auto;
		text-align : center;
	}
	
	tr:nth-child(1){
		background: gray;
	}
</style>

<body>
	<h3>성적 목록</h3>
	<p>
		<a href="sungjukForm.jsp">[성적쓰기]</a>
	</p>

	<table>
		<tr>
			<th>이름</th>
			<th>국어</th>
			<th>영어</th>
			<th>수학</th>
			<th>등록일</th>
		</tr>
	

	<%
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
		
		try{
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String user = "system";
			String password = "1234";
			String driver = "oracle.jdbc.driver.OracleDriver"; // ojdbc8.jar
			Class.forName(driver);
		
			con = DriverManager.getConnection(url, user, password);
			StringBuilder sql = new StringBuilder();
			
			sql.append(" SELECT sno, uname, kor, eng, mat, wdate");
			sql.append(" FROM sungjuk");
			sql.append(" ORDER BY wdate DESC ");

			pstmt = con.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();
			
			if(rs.next()){
			
				do{
	%>	
					<tr>
						<td><a href="sungjukRead.jsp?sno=<%=rs.getInt("sno")%>"><%=rs.getString("uname")%></a></td>
						<td><%=rs.getInt("kor")%></td>
						<td><%=rs.getInt("eng")%></td>
						<td><%=rs.getInt("mat")%></td>
						<td><%=rs.getString("wdate").substring(0,10)%></td>
					</tr>
	<% 
				}while(rs.next());
			}else{
				out.println("<tr>");
				out.println("<td colspan='5'>글없음!!</td>");
				out.println("</tr>");
			}//while end
				
		}catch(Exception e){
			out.println("오라클DB연결실패:" + e);
		}finally{//자원반납
			try{if(pstmt!=null) {pstmt.close();}
			
			}catch(Exception e){}
				try{if(con!=null) {pstmt.close();}
					
			}catch (Exception e){}
				try{if(con!=null) {pstmt.close();}
					
			}catch(Exception e){}
		}
	%> 
</table>

</body>
</html>