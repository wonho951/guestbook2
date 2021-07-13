<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% String no = request.getParameter("no");%>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<h1>비밀번호 확인</h1>

	<form action="/guestbook2/gbc" method="post">
		비밀번호:<input type="password" name="password"> 		
		<input type="hidden" name = "no" value="<%=no  %>">
		<input type="hidden" name="action" value="delete">
		<button type="submit">확인</button>
	</form>
	<a href="/guestbook2/gbc?action=list">메인으로 돌아가기</a>
</body>
</html>