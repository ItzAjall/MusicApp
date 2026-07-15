package com.daniyal.finalapp.servlet;

import com.daniyal.finalapp.dao.SingerDAO;
import com.daniyal.finalapp.model.Singer;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/add_singer")
public class SingerServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String nickName = request.getParameter("nickName");

        SingerDAO singerDAO = new SingerDAO();
        if(!singerDAO.isNickNameExist(nickName)){
            response.getWriter().println("Singer Nickname already exists");
            return;
        }

        Singer singer = new Singer(firstName, lastName, nickName);
        singerDAO.save(singer);
        response.sendRedirect("admin.jsp");
    }
}
