<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%-- ssi.jsp 공통 페이지 --%>

<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@ page import="net.sunjuk.*"%>

<jsp:useBean id="dao" class="net.sunjuk.SungjukDAO" scope="page"></jsp:useBean>
<jsp:useBean id="dto" class="net.sunjuk.SungjukDTO" scope="page"></jsp:useBean>

<%request.setCharacterEncoding("UTF-8");%>