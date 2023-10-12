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
		<img alt="" src="../images/smile.png">
		<!-- 본문 끝 -->
	</section>

	<footer>
		<p>HEDKOREA Copyright&copy; 2018 All rights reserved. Human
			Resources Development Service of Korea</p>
	</footer>












</body>
</html>