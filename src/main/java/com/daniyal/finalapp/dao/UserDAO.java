package com.daniyal.finalapp.dao;

import com.daniyal.finalapp.model.Users;
import com.daniyal.finalapp.util.HibernateUtil;
import org.hibernate.Session;

import java.util.List;

public class UserDAO {
    public List<Users> findAll() {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            return session.createQuery("from Users", Users.class)
                    .getResultList();
        }
    }
    public void save(Users user) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            session.beginTransaction();

            session.persist(user);

            session.getTransaction().commit();
        }
    }
    public Users findById(Long id) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            return session.find(Users.class, id);
        }
    }

    public Users findByUsername(String username) {

        try (Session session = HibernateUtil.getSessionFactory().openSession()) {

            return session.createSelectionQuery(
                            "from Users where userName = :username",
                            Users.class
                    )
                    .setParameter("username", username)
                    .uniqueResult();
        }
    }

    public boolean setUserAdmin(Users user) {
        if  (user == null)
            return false;
        if   (user.isAdmin())
            return false;
        user.setAdmin(true);
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            session.beginTransaction();
            session.merge(user);
            session.getTransaction().commit();
            return true;
        }
    }

    public boolean isUsernameExist(String username) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {

            Long count = session.createQuery(
                            "select count(u) from Users u where u.userName = :username",
                            Long.class
                    )
                    .setParameter("username", username)
                    .getSingleResult();

            return count == 0;
        }
    }

    public void update(Users user) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            session.beginTransaction();
            session.merge(user);
            session.getTransaction().commit();
        }
    }
}
