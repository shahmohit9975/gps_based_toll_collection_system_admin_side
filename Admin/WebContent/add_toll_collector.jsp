<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>add_toll_collector</title>
</head>
<body>
	<br>
	<br>
	<br>
<!-- 	<form action="add_toll_collector" method="post"> -->
<!-- 		email id: <input type="email" name="email_id" minlength="8" -->
<!-- 			maxlength="30" required="" placeholder="Email Address"> <br> -->
<!-- 		<br> password : <input type="password" minlength="6" -->
<!-- 			maxlength="15" required="" name="password" placeholder="Password"> -->
<!-- 		<br> <br> Name : <input type="text" required="" name="name" -->
<!-- 			placeholder="enter name"> <br> <br> Contact No :<input -->
<!-- 			type="text" required="" name="contact_no" -->
<!-- 			placeholder="enter contact number"> <br> <br> -->
<!-- 		<button type="submit" name="add">ADD</button> -->
<!-- 	</form> -->
<h1>hello</h1>
	<%
		String email_id = request.getParameter("email_id");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		String contact_no = request.getParameter("contact_no");
		try {
			System.out.println(email_id);
			System.out.println(password);
			System.out.println(name);
			System.out.println(contact_no);
			Integer.parseInt(contact_no);
		} catch (Exception e) {
			System.out.println("exeptin in add toll collector contact no");
			System.out.println("msg : " + e.getMessage());
		}
	%>

</body>
</html>