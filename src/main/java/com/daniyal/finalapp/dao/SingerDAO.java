package com.daniyal.finalapp.dao;

import com.daniyal.finalapp.model.Singer;
import com.daniyal.finalapp.model.Users;
import com.daniyal.finalapp.util.HibernateUtil;
import org.hibernate.Session;

import java.util.List;

public class SingerDAO {
    public SingerDAO() {
    }
    public List<Singer> findAll() {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            return session.createQuery("from Singer", Singer.class)
                    .getResultList();
        }
    }

    public void save(Singer singer) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            session.beginTransaction();
            session.persist(singer);
            session.getTransaction().commit();
        }
    }

    public Singer findByNickName(String nickName) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            return session.createQuery(
                    "from Singer where nickName=:nickName"
                    ,Singer.class
                    )
                    .setParameter("nickName", nickName)
                    .uniqueResult();
        }
    }

    public Boolean isNickNameExist(String nickName) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {

            Long count = session.createQuery(
                            "select count(u) from Singer u where u.nickName = :nickName",
                            Long.class
                    )
                    .setParameter("nickName", nickName)
                    .getSingleResult();

            return count == 0;
        }
    }
}
