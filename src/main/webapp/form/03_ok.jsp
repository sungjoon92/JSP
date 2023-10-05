<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<style>
td {
	width: 20px;
	text-align: center;
}
</style>
<body>

	<%
	request.setCharacterEncoding("utf-8");
	int num1 = Integer.parseInt(request.getParameter("num1").trim());
	int num2 = Integer.parseInt(request.getParameter("num2").trim());
	String op = request.getParameter("op").trim();

	int result1 = 0;
	double result2 = 0.0;

	if (op.equals("+")) {
		result1 = num1 + num2;
	} else if (op.equals("-")) {
		result1 = num1 - num2;
	} else if (op.equals("/")) {
		result2 = (double) num1 / num2;
	} else if (op.equals("*")) {
		result1 = num1 * num2;
	} else if (op.equals("%")) {
		result1 = num1 % num2;
	} //if end
	%>

	<table>
		<tr>
			<th>결과값</th>

			<td><%=num1%></td>
			<td><%=op%></td>
			<td><%=num2%></td>
			<td>=</td>
			<td>
			<%
			if (op.equals("/")) {
				out.print(String.format("%.1f", result2));
			} else {
				out.print(result1);
			} //if end
			%>
			</td>
		</tr>
	</table>

</body>
</html>