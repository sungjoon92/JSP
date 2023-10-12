<%@page import="oracle.jdbc.proxy.annotation.Pre"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>travelBookproc.jsp</title>
</head>
<body>

	<h3>성적 결과 페이지</h3>
	<p>
		<a href="travelBook.jsp">[예약등록]</a>
	</p>
<% 
	//한글 인코딩
	request.setCharacterEncoding("utf-8");

	//사용자가 입력한 정보를 가져와서 변수에 담기
	
	String rno = request.getParameter("rno").trim();
	String tcode = request.getParameter("tcode").trim();
	String rjumin1 = request.getParameter("rjumin1").trim();
	String rjumin2 = request.getParameter("rjumin2").trim();
	String rjumin =(rjumin1 + rjumin2);
	String rname = request.getParameter("rname").trim(); 
	String rphone1 = request.getParameter("rphone1").trim(); 
	String rphone2 = request.getParameter("rphone2").trim(); 
	String rphone3 = request.getParameter("rphone3").trim();
	String rphone =(rphone1 + rphone2 + rphone3);
	String remail = request.getParameter("remail").trim();
	String rstat = request.getParameter("rstat").trim();
	//평균구하기
	
	/* out.println("요청IP:" + request.getRemoteAddr()); */ 

 	Connection con = null;
	PreparedStatement pstmt = null;
	
	try{
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "system";
		String password = "1234";
		String driver = "oracle.jdbc.driver.OracleDriver"; // ojdbc8.jar
		Class.forName(driver);

		// 3) 오라클 DB 서버 연결
		con = DriverManager.getConnection(url, user, password);
		//out.println("오라클  JDBC 서버 연결 성공!! ");

		
		StringBuilder sql=new StringBuilder();
		sql.append("INSERT INTO tbl_reserve_01(rno, tcode, rjumin, rname, rphone1, rphone2, rphone3, remail, rstat) ");
		sql.append("VALUES( ?, ?, ?, ?, ?, ?, ?, ?, ?) ");
		
		pstmt = con.prepareStatement(sql.toString());
		pstmt.setString(1, rno);
		pstmt.setString(2, tcode);
		pstmt.setString(3, rjumin);
		pstmt.setString(4, rname);
		pstmt.setString(5, rphone1);
		pstmt.setString(6, rphone2);
		pstmt.setString(7, rphone3);
		pstmt.setString(8, remail);
		pstmt.setString(9, rstat);
		
		int cnt=pstmt.executeUpdate();		
		if(cnt==0){
			out.println("<p>고객정보 입력이 실패했습니다!!</p>");
			out.println("<p><a href='javascript:history.back()'>[다시시도]</a></p>");
		}else{
			out.println("<script>");
			out.println("	alert('고객정보가 입력되었습니다~');");
			out.println("	location.href='sungjukList.jsp';");//목록 페이지 이동
			out.println("</script>");
		}//if end
		
		
		
	}catch(Exception e){
		out.println("오라클DB연결실패:" + e);
	}finally{//자원반납
		try{
			if(pstmt!=null) {pstmt.close();}
	}catch(Exception e){}
		try{
			if(con!=null) {pstmt.close();}
		}catch (Exception e){}
	}
 

	%>
















</body>
</html>