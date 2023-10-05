<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>02_ok.jsp title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>

<style>
.table {
	width: 80%;
	margin: 0 auto;
	box-shadow: 3px 3px 5px 1px gray;
	text-align:center;
}

tr:hover{
	background: rgba(0, 0, 0, 0.1);
}
</style>

<body>

	<h3>결과</h3>
	<%
	//request 내장객체
	// 사용자가 입력한 모든 정보를 관리하는 객체

	//request.getParameter("");
	//사용자가 입력한 정보를 개별적으로 가져올떄
	// 예) <input type="text" name"uname">
	//request.getParameter("uname")사용자가 입력한 uname값 가져옴

	//method = post 방식이면 항글이 꺠짐 (Tomcat 9이하 버전)
	request.setCharacterEncoding("utf-8"); //조합형
	//request.setCharacterEncoding("euc-kr"); //조합형

	/*
	out.print(request.getParameter("uname"));
	out.print("<hr>");
	out.print(request.getParameter("kor"));
	out.print("<hr>");
	out.print(request.getParameter("eng"));
	out.print("<hr>");
	out.print(request.getParameter("mat"));
	out.print("<hr>"); 
	*/

	String uname = request.getParameter("uname").trim();
	int kor = Integer.parseInt(request.getParameter("kor").trim());
	int eng = Integer.parseInt(request.getParameter("eng").trim());
	int mat = Integer.parseInt(request.getParameter("mat").trim());
	int aver = (kor + eng + mat) / 3;
	%>

	<!--성적결과 테이블에 출력 -->
	<table class="table" border="1">
		
		<tr class="success">
			<th>이름</th>
			<td><%=uname%></td>
		</tr>
		<tr class="danger">
			<th>국어</th>
			<td><%=kor%></td>
		</tr>
		<tr>
			<th>영어</th>
			<td><%=eng%></td>
		</tr>
		<tr class="info">
			<th>수학</th>
			<td><%=mat%></td>
		</tr>
		<tr class="warning">
			<th>평균</th>
			<td><%=aver%></td>
		</tr>
	</table>
</body>
</html>