package com.daniyal.finalapp.dao;

import com.daniyal.finalapp.model.Album;
import com.daniyal.finalapp.model.Sell;
import com.daniyal.finalapp.model.Users;
import com.daniyal.finalapp.util.HibernateUtil;
import org.hibernate.Session;

import java.util.List;

public class SellDAO {
    public void save(Sell sell) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            session.beginTransaction();
            session.persist(sell);
            session.getTransaction().commit();
        }
    }

    public List<Sell> findAll() {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            return session.createQuery("from Sell ", Sell.class)
                    .getResultList();
        }
    }

    public Boolean isSellExistsByUserAlbum(Users user, Album album) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {

            Long count = session.createQuery(
                            "select count(u) from Sell u where u.user = :user and u.album = :album",
                            Long.class
                    )
                    .setParameter("user", user)
                    .setParameter("album", album)
                    .getSingleResult();

            return count == 0;
        }
    }

    public Sell findById(Long id) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            return session.find(Sell.class, id);
        }
    }

    public Sell findByUserAndAlbum(Users user, Album album) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            return session.createQuery("from Sell s where s.user = :user and album = :album",
                            Sell.class)
                    .setParameter("user", user)
                    .setParameter("album", album)
                    .getSingleResult();
        }
    }

    public void update(Sell sell) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            session.beginTransaction();
            session.merge(sell);
            session.getTransaction().commit();
        }
    }
}
