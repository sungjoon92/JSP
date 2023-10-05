<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>03_calc</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  
  <link rel="stylesheet" href="../css/reset06.css">
  <script src="../js/code.jquery.com_jquery-3.7.1.min"></script>
</head>

<script>
	function validate() {
		//alert();
		
		let op = $("#op").val();
		op= op.trim();
		
		
	if (!(op == "+" || op == "-" || op == "*" || op == "/" || op == "%")){
		alert("연산자에는 연산기호 (+) (-) (×) (÷) (%) 만 입력 가능합니다");
		return false
	}//if end

	}//validate end
</script>
<body>

	<h3>계산기 연습</h3>
	<form name="calcfrm" id="calcfrm" method="get" action="03_ok.jsp" onsubmit="return validate()">
		첫번째 수 : <input type="number" name="num1" id="num1" min="0" max="100"required>
		<hr>
		연산자 : <input type="text" name="op" id="op" size="3" maxlength="1"required>
		<hr>
		두번쨰 수 : <input type="number" name="num2" id="num2" min="0" max="100"required>
		<hr>
		<input type="submit" value="계산"> 
		<input type="reset"value="취소">
	</form>
</body>
</html>