package com.daniyal.finalapp.dao;

import com.daniyal.finalapp.model.Genre;
import com.daniyal.finalapp.util.HibernateUtil;
import org.hibernate.Session;

import java.util.List;

public class GenreDAO {

    public List<Genre> findAll() {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            return session.createQuery("from Genre", Genre.class)
                    .getResultList();
        }
    }

    public void save(Genre genre) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            session.beginTransaction();
            session.persist(genre);
            session.getTransaction().commit();
        }
    }

    public Genre findById(int id) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            return session.find(Genre.class, id);
        }
    }

    public Boolean isGenreExists(String name) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {

            Long count = session.createQuery(
                            "select count(u) from Genre u where u.genreName = :name",
                            Long.class
                    )
                    .setParameter("name", name)
                    .getSingleResult();

            return count == 0;
        }
    }
}
