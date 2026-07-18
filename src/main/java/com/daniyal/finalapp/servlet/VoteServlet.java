package com.daniyal.finalapp.servlet;

import com.daniyal.finalapp.dao.GenreDAO;
import com.daniyal.finalapp.dao.VoteDAO;
import com.daniyal.finalapp.model.Users;
import com.daniyal.finalapp.model.Vote;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/vote")
public class VoteServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Users user = (Users) req.getSession().getAttribute("user");
        GenreDAO genreDAO = new GenreDAO();
        VoteDAO voteDAO = new VoteDAO();
        Vote vote = new Vote(user,genreDAO.findById(Integer.parseInt(req.getParameter("id"))));
        voteDAO.addVote(vote);
        resp.sendRedirect("member.jsp");
    }
}
