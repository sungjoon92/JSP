<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>travelBook.jsp</title>
</head>

<Style>
* {
	margin: 0;
	padding: 0;
}

header {
	background: darkblue;
	color: white;
	text-align: center;
	height: 8vh;
	display: flex;
	align-items: center;
}

header span {
	width: 100%;
	font-size: 30px;
}

table {
	width: 60%;
	margin: 0 auto;
}

nav {
	color: white;
	display: flex;
	justify-content: space-around;
}

nav a {
	text-align: center;
	font-size: 20px;
	width: 30%;
	height: 35px; 
	margin : 0 auto;
	color: black;
	border: 1px solid black;
	background: lightblue;
	display: block;
	text-decoration: none;
	border-radius: 0px 0px 20px 20px;
	box-shadow: 2px 2px 10px 2px gray;;
	font-weight: bold;
	margin: 0 auto;
}

form {
	width: 100%;
	margin: 10% auto;
}

.ok {
	height: auto;
}

.save {
	width: 100px;
	font-size: 17px;
	background: #CCEEFF;
	border: none;
	cursor: pointer;
	margin:0 auto;
}

.reset {
	width: 100px;
	font-size: 17px;
	border: none;
	background: #FFFF00;
	cursor: pointer;
}

footer {
	background: blue;
	color: white;
	text-align: center;
}
</Style>


<script>
	function validate() {//유효성 검사
		let rno= document.getElementById("rno").value;
		let tcode = document.getElementById("tcode").value;
		let rjumin1= document.getElementById("rjumin1").value;
		let rjumin2= document.getElementById("rjumin2").value;
		let rname= document.getElementById("rname").value;
		let rphone1= document.getElementById("rphone1").value;
		let rphone2= document.getElementById("rphone2").value;
		let rphone3= document.getElementById("rphone3").value;
		let remail= document.getElementById("remail").value;
		
	
	if (rno == "") {
			alert("예약번호가 입력되지 않았습니다!")
			return false;
		}//if end
		if (tcode == "") {
			alert("상품코드가 선택되지 않았습니다!")
			return false;
		}//if end
		if (rjumin1 == "" || rjumin2.value == "") {
			alert("주민번호가 입력되지 않았습니다!")
			return false;
		}//if end
		if (rname == "") {
			alert("예약자성명이 입력되지 않았습니다!")
			return false;
		}//if end
		if (rphone1 == "" || rphone2.value == "" || rphone3.value == "") {
			alert("예약자전화가 입력되지 않았습니다!")
			return false;
		}//if end

		if (remail == "") {
			alert("고객이메일이 입력되지 않았습니다!")
			return false;
		}//if end
		return true;

	}
</script>

<body>

	<header>
		<span>여행예약 프로그램 ver2018-12</span>
	</header>

	<nav>
		<jsp:include page="mainmenu.jsp"></jsp:include>
	</nav>

	<section>
		<!-- 본문 시작 -->
		<form name="" id="" action="travelBookproc.jsp" method="post" onsubmit="return validate()">

			<table border="1">
				<tr>
					<th>예약번호</th>
					<td>
						<input type="text" name="rno" id="rno" size="8"
						maxlength="8" >
					</td>
					<td>
						<input type="hidden" name="">[JJ01]제주 2023-11-01 09:30(AM) 출발 - 160.000원 (2박3일)
					</td>
				</tr>
				<!-- 예약번호 끝 -->

				<tr>
					<th>상품코드</th>
					<td>
						<select name="tcode" id="tcode">
							<option value="">상품선택</option>
							<%
							Connection con = null;
							PreparedStatement pstmt = null;
							ResultSet rs = null;

							try {
								String url = "jdbc:oracle:thin:@localhost:1521:xe";
								String user = "system";
								String password = "1234";
								String driver = "oracle.jdbc.driver.OracleDriver"; // ojdbc8.jar
								Class.forName(driver);
								con = DriverManager.getConnection(url, user, password);
								
								StringBuilder sql = new StringBuilder();
								sql.append(" select tcode ");
								sql.append(" ,'[' || tcode || ']'|| tarea ");
								sql.append(" || substr(tdate, 1, 4) || '-' ");
								sql.append(" || substr(tdate, 5, 2) || '=' ");
								sql.append(" || substr(tdate, 7, 2) ");
								sql.append(" ||' 출발' as tname ");
								sql.append(" from tbl_tourcode_02 ");
								sql.append(" ORDER BY tcode ");

								pstmt = con.prepareStatement(sql.toString());
								rs=pstmt.executeQuery();
								if(rs.next()){
									do{
										out.println("<option value='" + rs.getString("tcode")+"'>");
										out.println(rs.getString("tname"));
										out.println("</option>");
									}while(rs.next());//while end
								}//if end
								
									
							} catch (Exception e) {
								out.println("오라클DB연결실패:" + e);
							} finally {//자원반납
								try {
									if (pstmt != null) {
								pstmt.close();
									}
								} catch (Exception e) {
								}
								try {
									if (con != null) {
								pstmt.close();
									}
								} catch (Exception e) {
								}
							}
							%>
					</select>
					</td>
					<td>
						<input type="hidden" name="">[JJ02]제주 2023-12-15 10:30(AM) 출발 - 180.000원 (2박3일)
					</td>
				</tr>
				<!-- 상품코드 끝 -->
				<tr>
					<th>주민번호</th>
					<td><input type="text" name="rjumin1" id="rjumin1" size="6"
						maxlength="6" > -
						<input type="text"
						name="rjumin2" id="rjumin2" size="7" maxlength="7">
					</td>
					
					<td>
						<input type="hidden" name="">[JJ03]제주 2024-01-25 02:30(PM) 출발 - 150.000원 (2박3일)
					</td>
				</tr>
				<!-- 주민번호 끝 -->
				<tr>
					<th>예약자성명</th>
					<td>
						<input type="text" name="rname" id="rname" size="20"
						maxlength="20" >
					</td>
					<td>
						<input type="hidden" name="">[JJ04]부산 2024-02-01 01:30(PM) 출발 - 80.000원 (2박3일)
					</td>
				</tr>
				<!-- 예약자성명 끝 -->
				<tr>
					<th>예약자전화</th>
					<td>
						<input type="text" name="rphone1" id="rphone1" size="3" maxlength="3" > 
						<input type="text" name="rphone2" id="rphone2" size="4" maxlength="4" > 
						<input type="text" name="rphone3" id="rphone3" size="4" maxlength="4"
						>
					</td>
					<td>
						<input type="hidden" name="">[JJ05]제주 2024-03-12 08:00(AM) 출발 - 300.000원 (2박3일)
					</td>
				</tr>
				<!-- 예약자전화 끝 -->
				<tr>
					<th>고객이메일</th>
					<td>
						<input type="text" name="remail" id="remail" size="30"
						maxlength="30" >
					</td>
					<td>
						<input type="hidden" name="">[JJ06]괌 2024-04-01 11:30(AM) 출발 - 750.000원 (2박3일)
					</td>
				</tr>
				 <!-- 고객이메일 끝 -->
 				<tr>
					<th>결제상태</th>
					<td>
						<input type="radio" name="rstat" id="rstat" value="1"
						checked>미납 
						<input type="radio" name="rstat" id="rstat"
						value="2">완납
					</td>
					<td>
						<input type="hidden" name="">[JJ07]제주 2024-08-01 6:30(PM) 출발 - 190.000원 (2박3일)
					</td>
				</tr>
				<!-- 결제상태 끝 -->
				<tr>
					<td class="ok" colspan="2">
						<input class="save" type="submit" value="예약"> 
						<input class="reset" type="reset" value="재작성" onclick="alert('정보를 지우고 처음부터 다시 입력합니다')">
					</td>
					
				</tr>
				
			</table>
		
		</form>
		<!-- 본문 끝 -->
	</section>

	<footer>
		<p>HEDKOREA Copyright&copy; 2018 All rights reserved. Human
			Resources Development Service of Korea</p>
	</footer>












</body>
</html>