<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>travelList.jsp</title>
<style>
  header{background:darkblue; color:white; text-align: center;}
  nav   {background:lightblue; color:white;}
  footer{background:blue; color:white; text-align: center;}
</style>
</head>
<body>
	<header>여행예약 프로그램 ver2018-12</header>
	<nav>
		  <jsp:include page="mainmenu.jsp"></jsp:include>
	</nav>
	<section>
	<!-- 본문시작 -->
        <h3>여행내역 조회</h3>
        
        <table border="1">
        <tr>
        	<th>예약번호</th>
        	<th>주민번호</th>
        	<th>성명</th>
        	<th>성별</th>
        	<th>전화번호</th>
        	<th>여행상품</th>
        	<th>상태</th>
        	<th>금액</th>
        	<th>수정/삭제</th>
        </tr>
<%
	Connection con=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	
	try{
		
		String url     ="jdbc:oracle:thin:@localhost:1521:xe";
		String user    ="system";
		String password="1234";
		String driver  ="oracle.jdbc.driver.OracleDriver";
		Class.forName(driver);						
		con=DriverManager.getConnection(url, user, password);			
		
	    StringBuilder sql=new StringBuilder();
	    sql.append(" SELECT tbl_reserve_01.tcode, rno, rjumin, rname, rphone1, rphone2, rphone3, remail, rstat ");
	    sql.append("       , tarea, tdate, ttime, tday, thotel, tmoney, tair ");
	    sql.append(" FROM tbl_reserve_01 INNER JOIN tbl_tourcode_02 ");
	    sql.append(" ON tbl_reserve_01.tcode = tbl_tourcode_02.tcode ");
	    sql.append(" ORDER BY tbl_reserve_01.rno ");

	    pstmt=con.prepareStatement(sql.toString());
	    rs=pstmt.executeQuery();
	    if(rs.next()){
	    	do{
%>    		
				<tr>
					<td><%=rs.getString("rno") %></td>
					<td>
						<%=rs.getString("rjumin").substring(0, 6) %>-<%=rs.getString("rjumin").substring(6) %>
					</td>
					<td><%=rs.getString("rname") %></td>
					<td>
<%
						String code=rs.getString("rjumin").substring(6, 7); //성별코드
						if(code.equals("1")){
							out.print("남");
						}else if(code.equals("2")){
							out.print("여");
						}//if end
%>					
					</td>
					<td><%=rs.getString("rphone1") %>-<%=rs.getString("rphone2") %>-<%=rs.getString("rphone3") %></td>
					<td>
<%
						//여행상품
						String tname="";
						tname += rs.getString("tcode") + "-";
						tname += rs.getString("tarea") + "-";
						tname += rs.getString("tdate") + "-";
						tname += rs.getString("ttime") + "/";
						tname += rs.getString("thotel") + "/";
						tname += rs.getString("tair");
						out.print(tname);
%>					
					</td>
					<td>
<%
						String rstat=rs.getString("rstat");//상태코드
						if(rstat.equals("1")){
							out.print("미납");
						}else if(rstat.equals("2")){
							out.print("완납");
						}//if end
%>					
					</td>
					<td><%=String.format("\\%,d", rs.getInt("tmoney")) %></td>
					<td>
						<input type="button" value="수정" onclick="location.href='travelUpdate.jsp?rno=<%=rs.getString("rno") %>'">
						<input type="button" value="삭제" onclick="location.href='travelDel.jsp?rno=<%=rs.getString("rno") %>'">					
					</td>
				</tr>
<%
        	}while(rs.next());
        }else{
	        out.println("<tr>");
	        out.println("  <td colspan='8'>글없음!!</td>");
	        out.println("</tr>");
        }//if end	       
	}catch (Exception e) {
	    out.println("오라클DB연결실패:" + e);
	}finally {//자원반납(순서주의)
	    try {
	        if(rs!=null) {rs.close();}
	    }catch (Exception e) {}
	    try {
	        if(pstmt!=null) {pstmt.close();}
	    }catch (Exception e) {}            
	    try {
	          if(con!=null) {con.close();}
	    }catch (Exception e) {}
	}//end
%>        
		</table>       
	<!-- 본문끝 -->
	</section>
	<footer>
		<p>
		    HRDKOREA Copyright&copy;2018 All rights reserved.
    	    Human Resources Development Service of Korea
    	</p>
	</footer>
</body>
</html>