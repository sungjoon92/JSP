<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%-- <%@ include file=""%>
<!-- jsp 디렉티브 jsp 코드가 많을경우 추천 -->
<jsp:include page=""></jsp:include>
<!-- 액션태그 --> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>home.jsp</title>
</head>

<Style>
* {
	margin: 0;
	padding: 0
}


header {
	background: darkblue;
	color: white;
	text-align: center;
	height: 8vh;
	display: flex;
	align-items: center;
}

header span{
	width: 100%;
	font-size: 30px;
}

table{
	width: 60%;
	margin: 0 auto;
	text-align: center;
}

nav {
	color: white;
	display: flex;
	justify-content: space-around;
}

nav a{
	text-align: center;
	font-size: 20px;
	width: 30%;
	height: 35px; 
	margin:0 auto;
	color: black;
	border: 1px solid black;
	background: lightblue;
	display: block;
	text-decoration: none;
	border-radius: 0px 0px 20px 20px;
	box-shadow: 2px 2px 10px 2px gray;;
	font-weight: bold;
}
footer {
	background: blue;
	color: white;
	text-align: center;
}
</Style>

<body>

	<header>
		<span>여행예약 프로그램 ver2018-12</span>
	</header>

	<nav>
		<jsp:include page="mainmenu.jsp"></jsp:include>
	</nav>

	<section>
		<!-- 본문 시작 -->


		<table>
			<tr>
				<th>예약번호</th>
				<th>상품선택</th>
				<th>성별</th>
				<th>주민번호</th>
				<th>예약자성명</th>
				<th>예약자전화</th>
				<th>고객이메일</th>
				<th>결제상태</th>
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
			sql.append(" SELECT rno, tcode, rjumin, rname, rphone1, rphone2, rphone3, remail, rstat");
			sql.append(" FROM tbl_reserve_01");
			pstmt = con.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();
			
			
			if(rs.next()){
				do{
%>	
					<tr>
						<td><a href="travelRead.jsp?sno=<%=rs.getInt("rno")%>"></a><%=rs.getInt("rno")%></td>
						<td><%=rs.getString("tcode")%></td>
						<td><%=rs.getString("rjumin")%></td>
						<td>
						
						
						
						<%=rs.getString("rjumin")%>
						
						
						</td>
						<td><%=rs.getString("rname")%></td>
						<td><%=rs.getString("rphone1")%>-<%=rs.getString("rphone2")%>-<%=rs.getString("rphone3")%></td>
						<td><%=rs.getString("remail")%></td>
						<td><%=rs.getString("rstat")%>
						<script>
							
						let st = document.getElementById("rstat");
						
						if(st==1){
							system.out.println("미납");
						}else{
							system.out.println("완납");
						}
						</script>
						
						</td>
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
			<!-- 본문 끝 -->

		</table>
	</section>

	<footer>
		<p>HEDKOREA Copyright&copy; 2018 All rights reserved. Human
			Resources Development Service of Korea</p>
	</footer>












</body>
</html>