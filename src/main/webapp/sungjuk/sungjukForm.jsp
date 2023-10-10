<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sungjukForm.jsp</title>
</head>
<body>
 
	<h3>성적 입력 폼</h3>
	<p>
		<a href="sungjukList.jsp">[성적목록]</a>
	</p>

	<form name="sungjukfrm" id="sungjukfrm" method="get"
		action="sungjukIns.jsp">

	<table>
		<tr>
			<th>이름</th>
			<td>
				<input type="text" name="uname" id="uname" maxlength="50"
					required autofocus>
			</td>
			<!-- 이름 end -->
		</tr>

		<tr>
			<th>국어</th>
			<td>
				<input type="number" name="kor" id="kor" size="5" min="0"
					max="100" placeholder="국어점수">
			</td>
			<!-- 국어 end -->
		</tr>

		<tr>
			<th>영어</th>
			<td>
				<input type="number" name="eng" id="eng" size="5" min="0"
					max="100" placeholder="국어점수">
			</td>
			<!-- 영어 end -->
		</tr>

		<tr>
			<th>수학</th>
			<td>
				<input type="number" name="mat" id="mat" size="5" min="0"
					max="100" placeholder="국어점수">
			</td>
			<!-- 수학 end -->

		<tr>
			<th>주소</th>
			<td>
				<select name="addr" id="addr">
						<option value="Seoul">서울</option>
						<option value="Jeju">제주</option>
						<option value="Suwon">수원</option>
						<option value="Busan">부산</option>
				</select>
			</td>
			<!-- 주소 end -->
		</tr>
		
		<tr>
			<td colspan="2" align="center">
				<input type="submit" value="전송">
				<input type="reset" value="다시쓰기">
			</td>
			<!-- 전송 end -->
		</tr>
	</table> 
</form>

</body>
</html>