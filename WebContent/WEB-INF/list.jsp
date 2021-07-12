<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="com.javaex.vo.GuestbookVo" %>
<%@ page import="java.util.List" %>    


<% 	List<GuestbookVo> guestbookList = (List<GuestbookVo>)request.getAttribute("gList");%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
		<form action = "/guestbook2/gbc" method = "get">
		<table border = "1">
			<tr>
				<td>이름</td>
				<td><input type = "text" name = "name"></td>
				<td>비밀번호</td>
				<td><input type = "password" name = "password"></td>
			</tr>
		
			<tr>
				<td colspan = "5"><textarea name = "content"></textarea></td>
			</tr>
			
			<tr>
				<td colspan = "5"><button type = "submit">확인</button></td>
			</tr>
		</table>
		<input type = "hidden" name = "action" value = "add">
		</form>
		<br>
	
	<% for(int i = 0; i < guestbookList.size(); i++) {%>		
	<table border = "1">
		<tr>
			<td><%= guestbookList.get(i).getNo() %></td>
			<td><%= guestbookList.get(i).getName() %></td>
			<td><%= guestbookList.get(i).getRegDate() %></td>	
			<td><a href="/guestbook2/gbc?action=deleteForm&no<%= guestbookList.get(i).getNo()%>">삭제</a></td>
		</tr>
	
		<tr>
			<td colspan = "4"><%= guestbookList.get(i).getContent() %></td>
		</tr>
	</table>
	<br>
	
	<%} %>

</body>
</html>