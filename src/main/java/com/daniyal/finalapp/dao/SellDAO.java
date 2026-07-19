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

    public List<Object[]> getTopSellsPerMonth(int year, int month) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            return session.createQuery(
                    "select s.album, count(s.album) " +
                            "from Sell s " +
                            "where s.year = :year and s.month = :month " +
                            "group by s.album " +
                            "order by count(s.album) desc",
                    Object[].class
            )
                    .setParameter("year", year)
                    .setParameter("month", month)
                    .getResultList();
        }
    }
}
