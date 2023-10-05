<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>01_내장객체.jsp</title>
</head>
<body>
	<%
	/*
		JSP 내장객체
			- 톰캣 서버에 의해 자동으로 생성된 객체
			- 개발자는 별도의 객체를 선언하지 않고 가져다 사용만한다
	1) out			: 출력객체
	jsp -> .java로 변환후 JspWriter out

	2) requeat		: 사용자가 요청한 정보를 관리하는 객체
	HttpServletRequest request

	3) response		: 요청한 사용자에게 응답을 관리하는 객체
	HttpServletResponse response

	4) session		: 요청한 사용자를 개별적으로 구분하기 위한 객체
	HttpSession session

	5) application	: 모든 사용자가 공유하는 값 또는 서버에 대한 정보를 관리하는 객체 	
	ServletContext application	

	6) pageContext	: JSP, JSTL, EL등 현재 페이지내에서 서로 다른 문법고의 값을 교류할 수 있다
	PageContext pageContext

	JSP 페이지 실행 과정
	- 톰캣 WAS에 의해서 .java와 .class가 자동으로 생성된다
	예) hello.jsp -> hello_jsp.java -> hello_jsp.class


	JSP변환과정 확인
	D:\java202307\workspace
	\.metadata
	\.plugins
	\org.eclipse.wst.server.core
	\tmp0
	\work
	\Catalina
	\localhost
	\basic04_web
	\org
	\apache
	\jsp
	\form

	*/
	%>
</body>
</html>