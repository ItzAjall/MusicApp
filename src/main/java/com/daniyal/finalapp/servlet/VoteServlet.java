package com.daniyal.finalapp.servlet;

import com.daniyal.finalapp.dao.AlbumDAO;
import com.daniyal.finalapp.dao.GenreDAO;
import com.daniyal.finalapp.dao.VoteDAO;
import com.daniyal.finalapp.model.Album;
import com.daniyal.finalapp.model.Genre;
import com.daniyal.finalapp.model.Users;
import com.daniyal.finalapp.model.Vote;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/vote")
public class VoteServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Users user = (Users) req.getSession().getAttribute("user");
        int genreId = Integer.parseInt(req.getParameter("genreId"));
        int albumId = Integer.parseInt(req.getParameter("albumId"));
        GenreDAO genreDAO = new GenreDAO();
        VoteDAO voteDAO = new VoteDAO();
        AlbumDAO albumDAO = new AlbumDAO();
        Album album = albumDAO.findById(albumId);
        Genre genre = genreDAO.findById(genreId);
        if (voteDAO.canVoteById(user.getId(), genre)) {

            Vote vote = new Vote(user, album, genre);
            voteDAO.addVote(vote);

            req.getSession().setAttribute("alert", "رای شما با موفقیت ثبت شد");

        } else {

            req.getSession().setAttribute("alert", "شما قبلا به این سبک در این ماه رای داده اید");

        }

        String referer = req.getHeader("Referer");

        if (referer != null && !referer.isEmpty()) {
            resp.sendRedirect(referer);
        } else {
            resp.sendRedirect("member.jsp");
        }
    }
}
