<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


	<%
	session.setAttribute("reserve", request.getParameter("reserve") );
	session.setAttribute("closeDate", request.getParameter("closeDate") );
	session.setAttribute("closeTime", request.getParameter("closeTime") );
	session.setAttribute("am_or_pm", request.getParameter("am_or_pm") );
	String vehicleType = request.getParameter("vehicleType"); 
	%>
	
	<%
	if (vehicleType.equals("Cpu")){
		response.sendRedirect("postcpu.jsp");
	}
	else if (vehicleType.equals("Mobile")){
		response.sendRedirect("postmob.jsp");
	}
	else if (vehicleType.equals("Laptop")){
		response.sendRedirect("postlap.jsp");
	}
	%>
	
	

</head>
<body>

</body>
</html>