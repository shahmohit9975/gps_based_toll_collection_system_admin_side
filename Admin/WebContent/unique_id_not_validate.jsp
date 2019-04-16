<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<!-- App favicon -->
<link rel="shortcut icon" href="image/favicons.ico">

<title>Toll</title>

<!-- App -->
<!-- Bootstrap core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- Google font -->
<link
	href="https://fonts.googleapis.com/css?family=Roboto:300,300i,400,400i,500,500i,700,700i"
	rel="stylesheet">

<!-- custombox.min -->
<link href="css/custombox.min.css" rel="stylesheet">

<!-- Icons Font -->
<link href="css/font-awesome.min.css" rel="stylesheet">
<link href="css/materialdesignicons.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/style.css" rel="stylesheet">
<script>
alert("ID NOT MATCHED !!!");
</script>
</head>
<body>
<%
// 		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
// 		response.setHeader("Pragma", "no-cache");
// 		response.setHeader("Expires", "0");

		String s = (String) session.getAttribute("toll_collector");
		System.out.println("outer : " + s);

		// 		response.sendRedirect("toll_collector_login_page.jsp");

		if (session.getAttribute("toll_collector") == null) {
			System.out.println("null part");

			response.sendRedirect("login_page.jsp");
		}
	%>
	<jsp:include page="toll_collector_home_page.jsp"></jsp:include>
</body>
</html>