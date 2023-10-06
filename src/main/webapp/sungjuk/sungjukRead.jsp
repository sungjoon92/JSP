<%@page import="oracle.jdbc.proxy.annotation.GetProxy"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>sungjukRead.jsp</title>
	</head>



<body>

	<h3> 성적 상세보기</h3>
	<p>
		<a href="sungjukForm.jsp">[성적쓰기]</a>
		<a href="sungjukList.jsp">[성적목록]</a>
	</p>
	
	
	<%
		//예)sungjukRead.jsp?sno=21
		out.print(request.getParameter("sno"));
		int sno=Integer.parseInt(request.getParameter("sno"));
		
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
		
		sql.append(" SELECT sno, uname, kor, eng, mat, aver, addr, wdate");
		sql.append(" FROM sungjuk");
		sql.append(" ORDER BY wdate DESC ");

		pstmt = con.prepareStatement(sql.toString());
		rs = pstmt.executeQuery();
		
		if(rs.next()){
%>
			<table>
			<tr>
				<th>이름</th>
				<td><%=rs.getString("uname") %></td>
			</tr>
			<tr>
				<th>국어</th>
				<td><%=rs.getInt("kor") %></td>
			</tr>
			<tr>
				<th>영어</th>
				<td><%=rs.getInt("eng") %></td>
			</tr>
			<tr>
				<th>수학</th>
				<td><%=rs.getInt("mat") %></td>
			</tr>
			<tr>
				<th>평균</th>
				<td><%=rs.getInt("aver") %></td>
			</tr>
			<tr>
				<th>주소</th>
				<td><%=rs.getString("addr") %>
				<!--주소 한글로 입력 -->
				<%
				String addr=rs.getString("addr");
					if(addr.equals("Seoul")){
						out.print("서울");
					}else if(addr.equals("Jeju")){
						out.print("제주");
					}else if(addr.equals("Suwon")){
						out.print("수월");
					}else if(addr.equals("Busan")){
						out.print("부산");
					}//if end
					
				%>
				</td>
			</tr>
			<tr>
				<th>작성일</th>
				<td><%=rs.getString("wdate") %></td>
			</tr>
			</table>
			<br><br>
			<a href="sungjukUpdate.jsp?sno=<%=sno%>">[수정]</a>		
			&nbsp;&nbsp;
			<a href="sungjukDel.jsp?sno=<%=sno%>">[삭제]</a>
<%		
	}else{
		out.println("해당 글 있음:");
	}//if end
		
	
	}catch(Exception e){
		out.println("오라클DB연결실패:" + e);
	}finally{//자원반납
		try{if(pstmt!=null) {pstmt.close();}
			}catch(Exception e){}
		try{if(con!=null) {pstmt.close();}	
			}catch (Exception e){}
		try{if(con!=null) {pstmt.close();}
			}catch(Exception e){}
		}//finally end
%>
	
	
</body>
</html>