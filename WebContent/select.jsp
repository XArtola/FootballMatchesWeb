<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
* {
	font-family: arial, sans-serif;
}

h1 {
	text-align: center;
}

a {
	text-decoration: none;
}

input {
	width: 200px;
	height: 200px;
	display: block: 
	font-size: 25px;
}

table {
	width: auto;
	border: 5px solid grey;
	margin: auto;
	overflow: hidden;
}
</style>
</head>
<body>
	<table>
		<tr>
			<h1>Football matches database manager</h1>
		</tr>
		<tr>

			<td><a href="index.jsp?selection=players"> <input
					type="submit"
					style="font-size: 35px; font-family: arial, sans-serif; font-weight: bold;"
					value="Players">
			</a></td>
			<td><a href="index.jsp?selection=teams"> <input
					type="submit"
					style="font-size: 35px; font-family: arial, sans-serif; font-weight: bold;"
					value="Teams">
			</a></td>
			<td><a href="index.jsp?selection=matches"> <input
					type="submit"
					style="font-size: 35px; font-family: arial, sans-serif; font-weight: bold;"
					value="Matches">
			</a></td>


		</tr>



	</table>
</body>
</html>