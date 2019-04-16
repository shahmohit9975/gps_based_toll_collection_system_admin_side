<%@page
	import="java.util.Arrays,java.util.Collections,java.util.List,java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Generated Reports</title>
</head>
<body>

<input type="button" onclick="printDiv('printableArea')" value="print a div!" />
	
<script>
function myFunction() {
  window.print();
}
function printDiv(divName) {
    var printContents = document.getElementById(divName).innerHTML;
    var originalContents = document.body.innerHTML;

    document.body.innerHTML = printContents;

    window.print();

    document.body.innerHTML = originalContents;
}
</script>
<div id="printableArea">
      <h1>Print me</h1>
      <%
		String date = request.getParameter("date");

// 		String split[] = date.split("-");
// 		List<String> listOfProducts = Arrays.asList(split);
// 		Collections.reverse(listOfProducts);
// 		String[] split_reversed = listOfProducts.toArray(split);
// 		String original_date = String.join("-", split_reversed);

		out.println(date);
		int main_admin_toll_id=(int)session.getAttribute("main_admin_toll_id");
		

	%>
</div>


<!-- <button onclick="myFunction()">Print this page</button> -->
</body>
</html>