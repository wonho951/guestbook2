<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% String no = request.getParameter("no");	//비밀번호가 숫자만 쓰라는 법은 없으니까 string줌 %>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form action="/guestbook2/gbc" method="get">
		비밀번호:<input type="password" name="password"> 		
		<input type="hidden" name = "no" value="<%=no  %>">
		<input type="hidden" name="action" value="delete">
		<button type="submit">확인</button>
	</form>
	<a href="/guestbook2/gbc?action=list">메인으로 돌아가기</a>
</body>
</html>