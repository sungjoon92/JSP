<%@page import="net.testbean.compute"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="net.testbean.*"%>

<jsp:useBean id="comp" class="net.testbean.compute" scope="page" ></jsp:useBean>


<%-- 	action tag
	<jsp:useBean id=""></jsp:useBean>	 객체생성
	<jsp:forward page=""></jsp:forward>	 페이지이동
	<jsp:include page=""></jsp:include>  공톨 페이지 가져오기
	
	java bean 객체 생성
	<jsp:useBean id="객체명" class="퍀키지명, 클래스명" scope="page" ></jsp:useBean>
	
	scope 유효범위
	scope="page"		현재페이지에서만 유효 셍략시 기본
	scope="request"		다른페이지에서 공유
 	scope="session"		다른페이지에서 공유
	scope="application"	다른페이지에서 공유
	
		  - Java Bean(id)가 제대로 생성 안될 수도 있음.
	    해당프로젝트 우클릭 Refresh
                       Validate
                       Project -> Clean하고 테스트할것!! --%>



<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>computeok3.jsp</title>
</head>
<body>

	<h3>계산 결과</h3>
	<h4>java bean을 이용해서 객체 생성 후 메소드 호출</h4>


	<%
	int num1 = Integer.parseInt(request.getParameter("num1").trim());
	int num2 = Integer.parseInt(request.getParameter("num2").trim());

	//객체생성 new Compute()


	out.print(num1 + "+" + num2 + "=" + comp.add(num1, num2));
	out.print("<hr>");
	out.print(num1 + "-" + num2 + "=" + comp.sub(num1, num2));
	out.print("<hr>");
	out.print(num1 + "*" + num2 + "=" + comp.mul(num1, num2));
	out.print("<hr>");
	out.print(num1 + "/" + num2 + "=" + comp.div(num1, num2));
	out.print("<hr>");
	out.print(num1 + "%" + num2 + "=" + comp.mod(num1, num2));
	%>





</body>
</html>