package com.daniyal.finalapp.dao;

import com.daniyal.finalapp.model.Album;
import com.daniyal.finalapp.util.HibernateUtil;
import org.hibernate.Session;

import java.util.List;

public class AlbumDAO {
    public List<Album> findAll() {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            return session.createQuery("from Album ", Album.class)
                    .getResultList();
        }
    }

    public void save(Album album) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            session.beginTransaction();
            session.persist(album);
            session.getTransaction().commit();
        }
    }

    public Album findById(int id) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            return session.find(Album.class, id);
        }
    }
}
