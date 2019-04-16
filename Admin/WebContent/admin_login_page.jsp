<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="loginprocess.jsp" method="post">
    Enter username :<input type="email" name="id" minlength="8" maxlength="30" required /> <br>
    Enter password :<input type="password" name="password" minlength="6" maxlength="15" required><br>
    <input type="hidden" name="user_type" value="main_admin">
    <input type="submit" value="Login">
</form>


</body>
</html>