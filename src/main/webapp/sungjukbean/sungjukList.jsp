<%@page import="java.util.ArrayList"%>
<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.sql.*"%>
<%@ page import="net.sunjuk.*"%>

<jsp:useBean id="dao" class="net.sunjuk.SungjukDAO" scope="page"></jsp:useBean>
<jsp:useBean id="dto" class="net.sunjuk.SungjukDTO" scope="page"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sungjukList.jsp</title>
</head>


<style>
body {
	background-image:url("https://prugna.co.kr/web/product/big/202302/8352b2364e49846c32203efecf1a2124.jpg");
	background-size: cover;
	background-position: 25% 30%;
	
}

h3, p {
	font-size: 30px; 
	font-weight: bold;
	text-align: center;
}

table {
	width: 50%;
	height: 40vh;
	border: 1px solid black;
	margin: 0 auto;
	text-align: center;
	background: #c9f78d;
}

tr:nth-child(1) {
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
			<th>평균</th>
			<th>날짜</th>
		</tr>


<%
	ArrayList<SungjukDTO> list = dao.list();
	if (list == null) {
		out.print("<tr>");
		out.print("	<td colspan='5'>글없음!!</td>");
		out.print("</tr>");
	} else {
		for (int i = 0; i < list.size(); i++) {
			dto = list.get(i); //한줄 가져오기
%>
		<tr>
			<td><a href="sungjukRead.jsp?sno=<%=dto.getSno()%>"> <%=dto.getUname()%></a></td>
			<td><%=dto.getKor()%></td>
			<td><%=dto.getEng()%></td>
			<td><%=dto.getMat()%></td>
			<td><%=dto.getAver()%></td>
			<td><%=dto.getWdate()%></td>
		</tr>
<%
		} //for end
	} //if end
%>
	</table>

</body>
</html>