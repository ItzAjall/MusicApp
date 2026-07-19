package com.daniyal.finalapp.dao;

import com.daniyal.finalapp.model.Album;
import com.daniyal.finalapp.model.Genre;
import com.daniyal.finalapp.model.Users;
import com.daniyal.finalapp.model.Vote;
import com.daniyal.finalapp.util.HibernateUtil;
import org.hibernate.Session;

import java.time.LocalDate;
import java.util.List;

public class VoteDAO {
    public void addVote(Vote vote) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            session.beginTransaction();

            session.persist(vote);

            session.getTransaction().commit();
        }
    }

    public Vote findById(int id) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            return session.find(Vote.class, id);
        }
    }

    public List<Vote> findAll() {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            return session.createQuery("from Vote", Vote.class)
                    .getResultList();
        }
    }

    public List<Vote> findByGenre(Genre genre) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            return session.createQuery("from Vote v where v.genre = :genre", Vote.class)
                    .setParameter("genre", genre)
                    .getResultList();
        }
    }

    public Boolean canVoteById(Long id, Genre genre) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            Long count = session.createQuery(
                            "select count(u) from Vote u where u.year = :year and u.month = :month and u.genre = :genre and u.user.id = :id",
                            Long.class
                    )
                    .setParameter("year", LocalDate.now().getYear())
                    .setParameter("month", LocalDate.now().getMonthValue())
                    .setParameter("genre", genre)
                    .setParameter("id", id)
                    .getSingleResult();

            return count == 0;
        }
    }

    public List<Object[]> getTopAlbumByVote(){
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            return session.createQuery(
                    "select v.album, count(v.album) " +
                            "from Vote v " +
                            "group by v.album " +
                            "order by count(v.album) desc",
                    Object[].class
            ).getResultList();
        }
    }
}
