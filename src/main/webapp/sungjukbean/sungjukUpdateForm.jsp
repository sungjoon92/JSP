<%@page import="oracle.jdbc.proxy.annotation.GetProxy"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.sql.*"%>

<%@ include file="ssi.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sungjukUpdateForm.jsp</title>
</head>



<body>

	<h3>성적 업데이트</h3>
	<p>
		<a href="sungjukForm.jsp">[성적쓰기]</a> 
		<a href="sungjukList.jsp">[성적목록]</a>
	</p>

	<%
	

	//사용자가 입력한 정보를 가져와서 변수에 담기
		String uname = request.	getParameter("uname").trim();
		int kor = Integer.parseInt(request.getParameter("kor").trim());
		int eng = Integer.parseInt(request.getParameter("eng").trim());
		int mat = Integer.parseInt(request.getParameter("mat").trim());
		String addr = request.getParameter("addr");
		//평균구하기
		int aver = (kor + eng + mat) / 3;
		int sno = Integer.parseInt(request.getParameter("sno"));
		
		dto.setUname(uname);
		dto.setKor(kor);
		dto.setEng(eng);
		dto.setMat(mat);
		dto.setAver(aver);
		dto.setAddr(addr);
		dto.setSno(sno);
		
		
		
	
	//int cnt = dao.delete(sno);
	int cnt = dao.updateproc(dto);

	if (cnt == 0) {
		out.println("<p>성적 수정 실패했습니다!!</p>");
		out.println("<p><a href='javascript:history.back()'>[다시시도]</a></p>");
	} else {
		out.println("<script>");
		out.println("	alert('성적이 수정되었습니다~');");
		out.println("	location.href='sungjukList.jsp';");//목록 페이지 이동
		out.println("</script>");
	} //if end
	%>


</body>
</html>