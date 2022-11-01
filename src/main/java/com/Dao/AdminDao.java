package com.Dao;

import com.model.Responsable;
import com.model.Users;
import org.hibernate.Session;

import java.util.List;

public class AdminDao {
    public void saveUser(Users user) {
        try  {
            Session session = SessionUtil.getCurrentSession();
            session.getTransaction();
            session.getTransaction().begin();
            // save the student object
            session.save(user);
            session.persist(user);
            session.getTransaction().commit();
            session.close();
        } catch (Exception e) {
            System.out.println(e.getMessage());
            System.out.println("error");
            e.printStackTrace();
        }
    }
    public List < Users > getAllUser() {
        List< Users > listOfUser = null;
        try {
            Session session = SessionUtil.getCurrentSession();
            session.getTransaction();
            session.getTransaction().begin();
            // get an user object

            listOfUser = session.createQuery("from Users ").getResultList();

            // commit transaction
            session.getTransaction().commit();
            session.close();
        } catch (Exception e) {
            System.out.println(e.getMessage());
            System.out.println("error");
            e.printStackTrace();
        }
        return listOfUser;
    }
    //delete admin
    public void deleteUser(int id) {


        try {
            // start a transaction
            Session session = SessionUtil.getCurrentSession();
            session.getTransaction();
            session.getTransaction().begin();

            // Delete a user object
            Users user = session.get(Users.class, id);
            if (user != null) {
                session.delete(user);
                System.out.println("user is deleted");
            }
            // commit transaction
            session.getTransaction().commit();
            session.close();
        } catch (Exception e) {
            System.out.println(e.getMessage());
            System.out.println("error");
            e.printStackTrace();
        }
    }
    //update
    public void updateUser(Users user) {
        try{
            // start a transaction
            Session session = SessionUtil.getCurrentSession();
            session.getTransaction();
            session.getTransaction().begin();
            // save the student object
            session.update(user);
            // commit transaction
            session.persist(user);
            session.getTransaction().commit();
            session.close();
        } catch (Exception e) {
            System.out.println(e.getMessage());
            System.out.println("error");
            e.printStackTrace();
        }
    }
    public void saveresp(Responsable responsable) {
        try  {
            Session session = SessionUtil.getCurrentSession();
            session.getTransaction();
            session.getTransaction().begin();
            // save the student object
            session.save(responsable);
            session.persist(responsable);
            session.getTransaction().commit();
            session.close();
        } catch (Exception e) {
            System.out.println(e.getMessage());
            System.out.println("error");
            e.printStackTrace();
        }
    }
    public List < Responsable > getAllresp() {
        List< Responsable > listOfUser = null;
        try {
            Session session = SessionUtil.getCurrentSession();
            session.getTransaction();
            session.getTransaction().begin();
            // get an user object

            listOfUser = session.createQuery("from Responsable ").getResultList();

            // commit transaction
            session.getTransaction().commit();
            session.close();
        } catch (Exception e) {
            System.out.println(e.getMessage());
            System.out.println("error");
            e.printStackTrace();
        }
        return listOfUser;
    }
}
