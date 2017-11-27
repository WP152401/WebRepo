<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>Scope2</h1>
<form action ="/WebClass/scope" method ="post">
<input type ="text" name ="id">
<input type = "hidden" name ="pwd" value = "test">
<button type = "submit">전송</button>
</form>
<!--  EL로 수정 -->
<h1>id : ${param.id  }</h1>
<h1>pwd : ${param.pwd }</h1>
<h1>request scope  : %{key}</h1>
<h1>session scope  : ${sessionScope.key }</h1>
<h1>application  scope  :${ applicationScope.key }</h1>
<hr>
<form action ="/WebClass/jsp/scope.jsp" method="post">
<button type ="submit">전송</button>
</form>
</body>
</html>