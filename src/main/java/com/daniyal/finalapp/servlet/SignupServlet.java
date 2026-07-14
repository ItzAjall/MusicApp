package com.daniyal.finalapp.servlet;

import com.daniyal.finalapp.dao.UserDAO;
import com.daniyal.finalapp.model.Users;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/signup")
public class SignupServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String userName = request.getParameter("username");
        String password = request.getParameter("password");
        String repass = request.getParameter("re-password");

        UserDAO userDAO = new UserDAO();

        if (!userDAO.isUsernameExist(userName)) {

            response.getWriter().println("Username already exists");
            return;

        }

        if (!password.equals(repass)) {

            response.getWriter().println("Passwords do not match");
            return;

        }

        Users user = new Users(
                false,
                firstName,
                lastName,
                userName,
                password
        );

        userDAO.save(user);

        HttpSession session = request.getSession();
        session.setAttribute("user", user);

        response.sendRedirect("index.jsp");
    }
}