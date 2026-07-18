package com.daniyal.finalapp.dao;

import com.daniyal.finalapp.model.Genre;
import com.daniyal.finalapp.model.Users;
import com.daniyal.finalapp.model.Vote;
import com.daniyal.finalapp.util.HibernateUtil;
import org.hibernate.Session;

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

    public Boolean canVote(Users user, Genre genre) {

    }
}
