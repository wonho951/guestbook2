package com.javaex.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javaex.dao.GuestbookDao;
import com.javaex.vo.GuestbookVo;


@WebServlet("/gbc")
public class GuestbookController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("컨트롤러");
		
		//파라미터의 action 값을 읽어온다.
		String action = request.getParameter("action");
		System.out.println(action);
		
		if ("list".equals(action)) {
			System.out.println("[리스트]");
			
			GuestbookDao guestbookDao = new GuestbookDao(); 
			List<GuestbookVo> guestbookList = guestbookDao.getguestList();
			
			System.out.println("controller-------------------------");
			System.out.println(guestbookList);
			
			
			request.setAttribute("gList", guestbookList);
			
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/list.jsp");
			rd.forward(request, response);	
			
		} else if ("add".equals(action)) {
			System.out.println("등록");
			
			GuestbookDao guestDao = new GuestbookDao();
			
			String name = request.getParameter("name");
			String password = request.getParameter("password");
			String content = request.getParameter("content");
			
			GuestbookVo guestVo = new GuestbookVo(name, password, content);
			
			guestDao.guestInsert(guestVo);
			
			response.sendRedirect("/guestbook2/gbc?action=list");	
			
		} else if ("dform".equals(action)) {
			System.out.println("삭제폼");
			
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/deleteForm.jsp");
			rd.forward(request, response);
			
		} else if ("delete".equals(action)) {
			System.out.println("삭제");
			
			GuestbookDao guestDao = new GuestbookDao();
			
			int guestNo = Integer.parseInt(request.getParameter("no"));
			
			guestDao.guestDelete(guestNo);
			
			response.sendRedirect("/guestbook2/gbc?action=list");
			
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
